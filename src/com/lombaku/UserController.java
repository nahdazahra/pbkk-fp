package com.lombaku;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.JDBCException;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lombaku.models.User;
import com.lombaku.util.HibernateUtil;

@Controller
public class UserController {

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView showRegisterPage() {
		return new ModelAndView("register", "user", new User());
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView register(@Valid @ModelAttribute("user") User user, BindingResult result, HttpServletRequest request) {
		if (result.hasErrors()) {
            return new ModelAndView("register", "user", user);
		}
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		
		try {
			session.save(user);
		}
		catch (JDBCException e) {
			result.rejectValue("email", "error.user", "Email sudah terpakai");
            return new ModelAndView("register", "user", user);
		}

		session.getTransaction().commit();
        session.close();
        
        request.getSession().setAttribute("loggedIn", user);
		
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLoginPage() {
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, RedirectAttributes attributes) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<User> criteriaQuery = criteriaBuilder.createQuery(User.class);
        Root<User> root = criteriaQuery.from(User.class);
        
        criteriaQuery.where(
        	criteriaBuilder.and(
        		criteriaBuilder.equal(root.get("email"), email),
        		criteriaBuilder.equal(root.get("password"), password)
        	)
        );

        List<User> userList = session.createQuery(criteriaQuery).getResultList();
        session.close();
        
        if (userList.isEmpty()) {
            attributes.addFlashAttribute("error", "Email atau sandi salah.");
        	return "redirect:/login";
        }
        
        request.getSession().setAttribute("loggedIn", userList.get(0));
		
		return "redirect:/";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
}

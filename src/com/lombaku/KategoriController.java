package com.lombaku;

import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lombaku.models.Kategori;
import com.lombaku.models.Lomba;
import com.lombaku.models.Peserta;
import com.lombaku.models.User;
import com.lombaku.util.HibernateUtil;

@Controller
public class KategoriController {
	
	@RequestMapping(value = "/kategori", method = RequestMethod.GET)
	public ModelAndView index() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Kategori> criteriaQuery = criteriaBuilder.createQuery(Kategori.class);
        Root<Kategori> root = criteriaQuery.from(Kategori.class);
        
        criteriaQuery.orderBy(criteriaBuilder.desc(root.get("id")));

        List<Kategori> kategoriList = session.createQuery(criteriaQuery).getResultList();
        session.close();
        
        return new ModelAndView("kategoriIndex", "kategoriList", kategoriList);
	}
	
	@RequestMapping(value = "/kategori/create", method = RequestMethod.POST)
	public ModelAndView createKategori(@RequestBody String inputKategori, HttpServletRequest request, RedirectAttributes attributes) {
		User user = (User) request.getSession().getAttribute("loggedIn");
		System.out.println("++++++++++++++++----");
		if (request.getSession().getAttribute("loggedIn") == null) {
			return new ModelAndView("redirect:/login");
		}
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		String inpKategori = inputKategori.split("=")[1];
		System.out.println("++++++++++++++++"+inpKategori);
		
		Kategori kategori = new Kategori();
		kategori.setKategori(inpKategori);
		session.beginTransaction();
		session.save(kategori);
		session.getTransaction().commit();
		session.close();
        
        attributes.addFlashAttribute("success", "Berhasil menambah kategori.");
		
		return new ModelAndView("redirect:/kategori");
	}

//	@RequestMapping(value = "/register", method = RequestMethod.GET)
//	public ModelAndView showRegisterPage() {
//		return new ModelAndView("register", "user", new User());
//	}

//	@RequestMapping(value = "/register", method = RequestMethod.POST)
//	public ModelAndView register(@Valid @ModelAttribute("user") User user, BindingResult result, HttpServletRequest request) {
//		if (result.hasErrors()) {
//            return new ModelAndView("register", "user", user);
//		}
//		
//		Session session = HibernateUtil.getSessionFactory().openSession();
//		session.beginTransaction();
//		
//		try {
//			session.save(user);
//		}
//		catch (JDBCException e) {
//			result.rejectValue("email", "error.user", "Email sudah terpakai");
//            return new ModelAndView("register", "user", user);
//		}
//
//		session.getTransaction().commit();
//        session.close();
//        
//        request.getSession().setAttribute("loggedIn", user);
//		
//		return new ModelAndView("redirect:/");
//	}
//
//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String showLoginPage() {
//		return "login";
//	}
//
//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	public String login(HttpServletRequest request, RedirectAttributes attributes) {
//		String email = request.getParameter("email");
//		String password = request.getParameter("password");
//		
//		Session session = HibernateUtil.getSessionFactory().openSession();
//		
//		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
//        CriteriaQuery<User> criteriaQuery = criteriaBuilder.createQuery(User.class);
//        Root<User> root = criteriaQuery.from(User.class);
//        
//        criteriaQuery.where(
//        	criteriaBuilder.and(
//        		criteriaBuilder.equal(root.get("email"), email),
//        		criteriaBuilder.equal(root.get("password"), password)
//        	)
//        );
//
//        List<User> userList = session.createQuery(criteriaQuery).getResultList();
//        session.close();
//        
//        if (userList.isEmpty()) {
//            attributes.addFlashAttribute("error", "Email atau sandi salah.");
//        	return "redirect:/login";
//        }
//        
//        request.getSession().setAttribute("loggedIn", userList.get(0));
//		
//		return "redirect:/";
//	}
//
//	@RequestMapping("/logout")
//	public String logout(HttpSession session) {
//		session.invalidate();
//		
//		return "redirect:/";
//	}
}

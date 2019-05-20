package com.lombaku;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.hibernate.Session;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import java.util.List;

import com.lombaku.models.Lomba;
import com.lombaku.models.User;
import com.lombaku.util.HibernateUtil;


@Controller
public class LombaController {

	@RequestMapping("/")
	public ModelAndView index() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Lomba> criteriaQuery = criteriaBuilder.createQuery(Lomba.class);
        Root<Lomba> root = criteriaQuery.from(Lomba.class);
        
        criteriaQuery.where(criteriaBuilder.equal(root.get("isVerified"), true));
        criteriaQuery.orderBy(criteriaBuilder.desc(root.get("id")));

        List<Lomba> lombaList = session.createQuery(criteriaQuery).getResultList();
        session.close();
        
        return new ModelAndView("index", "lombaList", lombaList);
	}

	@RequestMapping(value = "/lomba/new", method = RequestMethod.GET)
	public ModelAndView showCreateLombaPage(HttpServletRequest request) {
		if (request.getSession().getAttribute("loggedIn") == null) {
			return new ModelAndView("redirect:/login");
		}
		
		return new ModelAndView("createLomba", "lomba", new Lomba());
	}

	@RequestMapping(value = "/lomba/new", method = RequestMethod.POST)
	public ModelAndView createLomba(@Valid @ModelAttribute("lomba") Lomba lomba, BindingResult result,
			HttpServletRequest request, RedirectAttributes attributes) {
		
		if (request.getSession().getAttribute("loggedIn") == null) {
			return new ModelAndView("redirect:/login");
		}
		
		if (result.hasErrors()) {
            return new ModelAndView("createLomba", "lomba", lomba);
        }
		
		lomba.setUser((User) request.getSession().getAttribute("loggedIn"));
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(lomba);
		session.getTransaction().commit();
        session.close();
        
        attributes.addFlashAttribute("success", "Lomba berhasil diajukan. Menunggu verifikasi admin.");
		
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/lomba/pending", method = RequestMethod.GET)
	public ModelAndView showPendingLomba(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("loggedIn");
		
		if (user == null) {
			return new ModelAndView("redirect:/login");
		}
		
		if (user.getIsAdmin() == false) {
			return new ModelAndView("redirect:/");
		}
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Lomba> criteriaQuery = criteriaBuilder.createQuery(Lomba.class);
        Root<Lomba> root = criteriaQuery.from(Lomba.class);
        
        criteriaQuery.where(criteriaBuilder.equal(root.get("isVerified"), false));
        criteriaQuery.orderBy(criteriaBuilder.desc(root.get("id")));

        List<Lomba> lombaList = session.createQuery(criteriaQuery).getResultList();
        session.close();
		
		return new ModelAndView("pendingLomba", "lombaList", lombaList);
	}

	@RequestMapping(value = "/lomba/verify", method = RequestMethod.POST)
	public ModelAndView verifyLomba(HttpServletRequest request, RedirectAttributes attributes) {
		User user = (User) request.getSession().getAttribute("loggedIn");
		int lombaId = Integer.parseInt(request.getParameter("lombaId"));
		
		if (user == null) {
			return new ModelAndView("redirect:/login");
		}
		
		if (user.getIsAdmin() == false) {
			return new ModelAndView("redirect:/");
		}
		
		Session session = HibernateUtil.getSessionFactory().openSession();

		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Lomba> criteriaQuery = criteriaBuilder.createQuery(Lomba.class);
        Root<Lomba> root = criteriaQuery.from(Lomba.class);
        
        criteriaQuery.where(criteriaBuilder.equal(root.get("id"), lombaId));

        Lomba lomba = session.createQuery(criteriaQuery).getResultList().get(0);
        lomba.setIsVerified(true);
        
		session.beginTransaction();
		session.update(lomba);
		session.getTransaction().commit();
        session.close();
        
        attributes.addFlashAttribute("success", "Lomba berhasil diverifikasi.");
		
		return new ModelAndView("redirect:/lomba/pending");
	}
	
	// TODO:
	// Halaman detail untuk lomba
	// e.g. /lombaku/lomba/6
}
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
	public ModelAndView showCreateLombaPage() {
		return new ModelAndView("createLomba", "lomba", new Lomba());
	}

	@RequestMapping(value = "/lomba/new", method = RequestMethod.POST)
	public ModelAndView createLomba(@Valid @ModelAttribute("lomba") Lomba lomba, BindingResult result,
			HttpServletRequest request, RedirectAttributes attributes) {
		
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
	
	// TODO:
	// Halaman detail untuk lomba
	// e.g. /lombaku/lomba/6
}
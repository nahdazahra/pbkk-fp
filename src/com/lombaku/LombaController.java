package com.lombaku;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.hibernate.Session;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import java.util.Date;
import java.util.List;

import com.lombaku.models.Lomba;
import com.lombaku.models.Peserta;
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
	
	@RequestMapping(value = "/lomba/lomba_show", method = RequestMethod.GET)
	public ModelAndView showAllLomba(HttpServletRequest request) {

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
        
//        criteriaQuery.where(criteriaBuilder.equal(root.get("isVerified"), false));
        criteriaQuery.orderBy(criteriaBuilder.desc(root.get("id")));

        List<Lomba> lombaList = session.createQuery(criteriaQuery).getResultList();
        session.close();
		
		return new ModelAndView("showAllLomba", "lombaList", lombaList);
	}
	
	@RequestMapping(value = "/lomba/manage", method = RequestMethod.GET)
	public ModelAndView manageLomba(HttpServletRequest request) {

		User user = (User) request.getSession().getAttribute("loggedIn");
		
		if (user == null) {
			return new ModelAndView("redirect:/login");
		}
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Lomba> criteriaQuery = criteriaBuilder.createQuery(Lomba.class);
        Root<Lomba> root = criteriaQuery.from(Lomba.class);
        
        criteriaQuery.where(criteriaBuilder.equal(root.get("user"), user.getId()));
        criteriaQuery.orderBy(criteriaBuilder.desc(root.get("id")));

        List<Lomba> lombaList = session.createQuery(criteriaQuery).getResultList();
        session.close();
		
		return new ModelAndView("showAllLomba", "lombaList", lombaList);
	}
	
	@RequestMapping(value = "/lomba/manage/{id}", method = RequestMethod.GET)
	public ModelAndView lihatPeserta(HttpServletRequest request, @PathVariable String id) {
		User user = (User) request.getSession().getAttribute("loggedIn");
		
		if (user == null) {
			return new ModelAndView("redirect:/login");
		}
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		CriteriaBuilder criteriaBuilderLomba = session.getCriteriaBuilder();
        CriteriaQuery<Lomba> criteriaQueryLomba = criteriaBuilderLomba.createQuery(Lomba.class);
        Root<Lomba> rootLomba = criteriaQueryLomba.from(Lomba.class);
        
        criteriaQueryLomba.where(criteriaBuilderLomba.equal(rootLomba.get("id"), id));

        List<Lomba> lomba = session.createQuery(criteriaQueryLomba).getResultList();
//        System.out.println(lomba);
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Peserta> criteriaQuery = criteriaBuilder.createQuery(Peserta.class);
        Root<Peserta> root = criteriaQuery.from(Peserta.class);
        
        criteriaQuery.where(criteriaBuilder.equal(root.get("lomba"), lomba.get(0)));
        criteriaQuery.orderBy(criteriaBuilder.desc(root.get("id")));

        List<Peserta> pesertaList = session.createQuery(criteriaQuery).getResultList();
//        System.out.println(pesertaList);
        session.close();
		
		return new ModelAndView("showPeserta", "pesertaList", pesertaList);
	}
	
	@RequestMapping(value = "/lomba/manage/verify_peserta/{id}/{action}", method = RequestMethod.GET)
	public ModelAndView verifyPeserta(HttpServletRequest request, @PathVariable String id, @PathVariable String action, RedirectAttributes attributes) {
		User user = (User) request.getSession().getAttribute("loggedIn");
		
		if (user == null) {
			return new ModelAndView("redirect:/login");
		}
		
		Session session = HibernateUtil.getSessionFactory().openSession();

		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Peserta> criteriaQuery = criteriaBuilder.createQuery(Peserta.class);
        Root<Peserta> root = criteriaQuery.from(Peserta.class);
        
        criteriaQuery.where(criteriaBuilder.equal(root.get("id"), id));

        Peserta peserta = session.createQuery(criteriaQuery).getResultList().get(0);
        peserta.setStatus(Integer.parseInt(action));
        
		session.beginTransaction();
		session.update(peserta);
		session.getTransaction().commit();
        session.close();
        
        attributes.addFlashAttribute("success", "Peserta berhasil diverifikasi.");
		
        return new ModelAndView("redirect:/lomba/manage/"+peserta.getLomba().getId()) ;
	}
	
	@RequestMapping(value = "/lomba/daftar", method = RequestMethod.POST)
	public ModelAndView daftarLomba(@RequestBody String lombaId, HttpServletRequest request, RedirectAttributes attributes) {
//		System.out.println("++++++++++++++++"+lombaId.split("=")[1]);
		User user = (User) request.getSession().getAttribute("loggedIn");
		
		if (request.getSession().getAttribute("loggedIn") == null) {
			return new ModelAndView("redirect:/login");
		}
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Lomba> criteriaQuery = criteriaBuilder.createQuery(Lomba.class);
        Root<Lomba> root = criteriaQuery.from(Lomba.class);
        
        criteriaQuery.where(criteriaBuilder.equal(root.get("id"), lombaId.split("=")[1]));

        List<Lomba> lomba = session.createQuery(criteriaQuery).getResultList();
		
		System.out.println(lomba.get(0));
		
		
		Peserta peserta = new Peserta();
		peserta.setUser(user);
		peserta.setLomba(lomba.get(0));
		Date date = new Date();  
		peserta.setTanggalDaftar(date);
		session.beginTransaction();
		session.save(peserta);
		session.getTransaction().commit();
		session.close();
        
        attributes.addFlashAttribute("success", "Berhasil mendaftar. Menunggu verifikasi panitia.");
		
		return new ModelAndView("redirect:/");
	}
	
	// TODO:
	// Halaman detail untuk lomba
	// e.g. /lombaku/lomba/6
}
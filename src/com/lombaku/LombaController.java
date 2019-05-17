package com.lombaku;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.hibernate.Session;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import java.util.List;

import com.lombaku.models.Lomba;
import com.lombaku.util.HibernateUtil;


@Controller
public class LombaController {

	@RequestMapping("/")
	public ModelAndView index() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Lomba> criteriaQuery = criteriaBuilder.createQuery(Lomba.class);
        Root<Lomba> root = criteriaQuery.from(Lomba.class);
        criteriaQuery.orderBy(criteriaBuilder.desc(root.get("id")));

        List<Lomba> lombaList = session.createQuery(criteriaQuery).getResultList();
        session.close();
        
        return new ModelAndView("index", "lombaList", lombaList);
	}
	
	// TODO:
	// Halaman detail untuk lomba
	// e.g. /lombaku/lomba/6
}
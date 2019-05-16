package com.lombaku;

import org.hibernate.Session;

import com.lombaku.models.User;
import com.lombaku.utils.HibernateUtil;

public class App {
	public static void main(String[] args) {
		Session session = HibernateUtil.getSessionFactory().openSession();

		session.beginTransaction();
		
		User user = new User("Abc", "abc@test.com", "abc", false);

		session.save(user);
		session.getTransaction().commit();

		System.out.println("Done");
	}
}
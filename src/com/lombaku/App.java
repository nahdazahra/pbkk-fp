package com.lombaku;

import org.hibernate.Session;

import com.lombaku.models.User;
import com.lombaku.models.Lomba;
import com.lombaku.models.Peserta;
import com.lombaku.utils.HibernateUtil;

import java.util.Calendar;
import java.util.Date;

public class App {
	public static void main(String[] args) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		// Buat ngetes

		session.beginTransaction();
		
		User user = new User("Byi", "1by@test.com", "123", false);
		User user2 = new User("Ced", "dw@test.com", "1w23", false);
		
		Calendar cal = Calendar.getInstance();
		cal.set(2019, 5, 20);
		Date mulaiDaftar = cal.getTime();
		cal.set(2019, 6, 20);
		Date akhirDaftar = cal.getTime();
		cal.set(2019, 6, 25);
		Date mulaiLomba = cal.getTime();
		cal.set(2019, 6, 30);
		Date akhirLomba = cal.getTime();
		
		Lomba lomba = new Lomba("Lomba tidur", mulaiDaftar, akhirDaftar, mulaiLomba, akhirLomba, "Lalaldeodalala", user);

		cal.set(2019, 5, 31);
		Date tanggalDaftar = cal.getTime();
		Peserta peserta = new Peserta(user2, lomba, tanggalDaftar);

		session.save(user);
		session.save(user2);
		session.save(lomba);
		session.save(peserta);
		session.getTransaction().commit();

		System.out.println("Done");
	}
}
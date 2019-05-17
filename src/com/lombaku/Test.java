package com.lombaku;

import org.hibernate.Session;

import com.lombaku.models.User;
import com.lombaku.models.Lomba;
import com.lombaku.models.Peserta;
import com.lombaku.util.HibernateUtil;

import java.util.Calendar;
import java.util.Date;

public class Test {
	public static void main(String[] args) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		// Buat ngetes

		session.beginTransaction();
		
		User user = new User("Byi__", "1by__@test.com", "123");
		User user2 = new User("Ced__", "dw__@test.com", "1w23");
		
		Calendar cal = Calendar.getInstance();
		cal.set(2019, 5, 21);
		Date mulaiDaftar = cal.getTime();
		cal.set(2019, 6, 21);
		Date akhirDaftar = cal.getTime();
		cal.set(2019, 6, 26);
		Date mulaiLomba = cal.getTime();
		cal.set(2019, 6, 31);
		Date akhirLomba = cal.getTime();
		
		Lomba lomba = new Lomba("Lomba makan", mulaiDaftar, akhirDaftar, mulaiLomba, akhirLomba, "Fjgrhwghfwhbed", user);

		cal.set(2019, 5, 22);
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
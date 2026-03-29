package com.ritik.Entity;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class App {
	public static void main(String args[]) {
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		
		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();
		
		Student s = new Student();
		s.setId(1);
		s.setName("Ritik");
		s.setCity("Patna");
		
		session.beginTransaction();
		session.save(s);
		session.getTransaction().commit();
		
		session.close();
		factory.close();
		
		System.out.println("Data saved successfully!");
		
	}
}

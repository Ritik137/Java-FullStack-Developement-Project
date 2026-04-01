package com.ritik.ProjectWithMaven;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class App {
    public static void main(String[] args) {

        System.out.println("Project started...");

        Configuration cfg = new Configuration();
        cfg.configure(); // hibernate.cfg.xml load karega
        cfg.addAnnotatedClass(Student.class);
        cfg.addAnnotatedClass(Address.class);

        SessionFactory factory = cfg.buildSessionFactory();

        // Create Student
        Student st = new Student();
        st.setName("Ritik");
        st.setCity("Patna");
        System.out.println(st);
         		
//        Creating object of address class
        Address ad = new Address();
        ad.setStreet("street1");
        ad.setCity("Delhi");
        ad.setOpen(true);
        ad.setAddedDate(new Date());
        ad.setX(1234.3456);
        
        
        
        
        
        

        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();

        session.persist(st);
        session.persist(ad);

        tx.commit();

        session.close();
        factory.close();

        System.out.println("Done...");
    }
}
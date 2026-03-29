package com.ritik.HibernateProject;

import org.hibernate.Session;
import org.hibernate.Transaction;   // ✅ Sahi import

public class MainApp {
    public static void main(String[] args) {

        // CREATE - Save student..
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();

        Student s1 = new Student("Rahul Sharma", "rahul@gmail.com");
        Student s2 = new Student("Priya Singh", "priya@gmail.com");

        session.save(s1);
        session.save(s2);

        tx.commit();
        session.close();
        System.out.println("Students saved successfully!");

        // READ - fetch student by ID..
        Session session2 = HibernateUtil.getSessionFactory().openSession();
        Student fetched = session2.get(Student.class, 1);
        System.out.println("Fetched: "+ fetched);
        session2.close();
        HibernateUtil.shutdown();
    }
}
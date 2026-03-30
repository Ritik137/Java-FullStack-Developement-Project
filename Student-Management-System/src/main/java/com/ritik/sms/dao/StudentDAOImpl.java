package com.ritik.sms.dao;

import com.ritik.sms.entity.Student;
import com.ritik.sms.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.List;

public class StudentDAOImpl implements StudentDAO {

    @Override
    public void saveStudent(Student student) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.persist(student);        // ✅ Hibernate 6
        tx.commit();
        session.close();
    }

    @Override
    public List<Student> getAllStudents() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Student> list = session
                .createQuery("FROM Student", Student.class)
                .list();
        session.close();
        return list;
    }

    @Override
    public Student getStudentById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Student student = session.get(Student.class, id);
        session.close();
        return student;
    }

    @Override
    public void updateStudent(Student student) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.merge(student);          // ✅ Hibernate 6
        tx.commit();
        session.close();
    }

    @Override
    public void deleteStudent(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Student student = session.get(Student.class, id);
        if (student != null) session.remove(student);  // ✅ Hibernate 6
        tx.commit();
        session.close();
    }
}
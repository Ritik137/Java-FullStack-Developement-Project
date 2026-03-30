package com.ritik.sms.dao;

import com.ritik.sms.entity.Student;
import java.util.List;

public interface StudentDAO {
    public void saveStudent(Student student);
    public List<Student> getAllStudents();
    public Student getStudentById(int id);
    public void updateStudent(Student student);
    public void deleteStudent(int id);
}
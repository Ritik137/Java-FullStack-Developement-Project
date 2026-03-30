package com.ritik.sms.servlet;

import com.ritik.sms.dao.StudentDAO;
import com.ritik.sms.dao.StudentDAOImpl;
import com.ritik.sms.entity.Student;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/students")
public class StudentServlet extends HttpServlet {

    private StudentDAO studentDAO = new StudentDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {

            case "new":
                req.getRequestDispatcher("/views/add-student.jsp")
                   .forward(req, resp);
                break;

            case "edit":
                int editId = Integer.parseInt(req.getParameter("id"));
                Student editStudent = studentDAO.getStudentById(editId);
                req.setAttribute("student", editStudent);
                req.getRequestDispatcher("/views/edit-student.jsp")
                   .forward(req, resp);
                break;

            case "delete":
                int deleteId = Integer.parseInt(req.getParameter("id"));
                studentDAO.deleteStudent(deleteId);
                resp.sendRedirect(
                    req.getContextPath() + "/students?action=list");
                break;

            default:
                List<Student> students = studentDAO.getAllStudents();
                req.setAttribute("students", students);
                req.getRequestDispatcher("/views/students-list.jsp")
                   .forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("add".equals(action)) {
            Student s = new Student();
            s.setFirstName(req.getParameter("firstName"));
            s.setLastName(req.getParameter("lastName"));
            s.setEmail(req.getParameter("email"));
            s.setPhone(req.getParameter("phone"));
            s.setCourse(req.getParameter("course"));
            studentDAO.saveStudent(s);

        } else if ("update".equals(action)) {
            Student s = new Student();
            s.setId(Integer.parseInt(req.getParameter("id")));
            s.setFirstName(req.getParameter("firstName"));
            s.setLastName(req.getParameter("lastName"));
            s.setEmail(req.getParameter("email"));
            s.setPhone(req.getParameter("phone"));
            s.setCourse(req.getParameter("course"));
            studentDAO.updateStudent(s);
        }

        resp.sendRedirect(req.getContextPath() + "/students?action=list");
    }
}
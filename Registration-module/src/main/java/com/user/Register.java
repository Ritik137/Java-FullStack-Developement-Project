package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class Register extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public Register() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		
		String name = request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");

		PrintWriter out = response.getWriter();
		
		
		out.println(name);
		out.println(password);
		out.println(email);
		
//		connection...............
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root", "Anshritik");
		
//		querry..........................
		String q ="insert into users(name,password,email) values(?,?,?)";
		
		PreparedStatement psmt = con.prepareStatement(q);
		psmt.setString(1, name);
		psmt.setString(2,password);
		psmt.setString(3,email);
		
		psmt.executeUpdate();
		out.println("<h1>done...</h1>");
		
		
		} catch(Exception e){
			e.printStackTrace();
			out.println("<h1>error...</h1>");
			
		}

	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    response.getWriter().println("Signup servlet working");
	}


}

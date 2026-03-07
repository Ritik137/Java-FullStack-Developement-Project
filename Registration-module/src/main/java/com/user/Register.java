package com.user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet("/signup")
public class Register extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String name = request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");

		Part part = request.getPart("image");
		String filename = part.getSubmittedFileName();

		try {

			// 1️⃣ Load Driver
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 2️⃣ Create Connection
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/youtube", "root", "Anshritik");

			// 3️⃣ SQL Query
			String q = "insert into users(name,password,email,imageName) values(?,?,?,?)";

			PreparedStatement psmt = con.prepareStatement(q);

			psmt.setString(1, name);
			psmt.setString(2, password);
			psmt.setString(3, email);
			psmt.setString(4, filename);

			int row = psmt.executeUpdate();

			if (row > 0) {

				out.println("<h2>Data Inserted Successfully</h2>");

				// 4️⃣ Image Save
				if (filename != null && !filename.isEmpty()) {

					InputStream is = part.getInputStream();
					byte[] data = is.readAllBytes();

					String path = request.getServletContext().getRealPath("/") 
							+ "img" + File.separator + filename;

					FileOutputStream fos = new FileOutputStream(path);
					fos.write(data);
					fos.close();

					out.println("<h3>Image saved successfully</h3>");
				}

			} else {
				out.println("<h2>Data Not Inserted</h2>");
			}

			// 5️⃣ Close Resources
			psmt.close();
			con.close();

		} catch (Exception e) {

			e.printStackTrace();
			out.println("<h2>Error Occurred</h2>");

		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().println("Signup servlet working");

	}
}
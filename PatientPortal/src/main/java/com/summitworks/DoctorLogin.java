package com.summitworks;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.ConnectionDetails;

public class DoctorLogin extends HttpServlet {
	Connection connection = null;
	PreparedStatement ps = null;
	
	public void init(ServletConfig config) {
		try {
			connection = ConnectionDetails.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try {
			ps= connection.prepareStatement("select * from doctor where d_email=? and d_password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			
			HttpSession session = request.getSession();
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				session.setAttribute("D_ID", rs.getInt(1));
				session.setAttribute("email", email);
				response.sendRedirect("./doctor_home.jsp?msg=Doctor Login Successful");
			}	
			else response.sendRedirect("./doctor_login.html?msg=Login Failed!");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
		
	
}

package com.summitworks;

import java.io.IOException;
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

public class PatientLogin extends HttpServlet {
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
			
			ps=connection.prepareStatement("select * from patient where p_email=? and p_password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			
			HttpSession session = request.getSession();
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				session.setAttribute("P_ID", rs.getInt(1)); 
				session.setAttribute("f_name", rs.getString(2));
				session.setAttribute("l_name", rs.getString(3));
				session.setAttribute("age", rs.getInt(6));
				session.setAttribute("gender", rs.getString(7));
				session.setAttribute("phone", rs.getInt(8));
				
				response.sendRedirect("./patient_home.jsp?msg=Patient login Successful");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

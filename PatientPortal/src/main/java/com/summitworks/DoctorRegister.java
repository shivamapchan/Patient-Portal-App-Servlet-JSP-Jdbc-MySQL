package com.summitworks;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.ConnectionDetails;

public class DoctorRegister extends HttpServlet {
	
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
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String first_name = request.getParameter("f_name");
		String last_name = request.getParameter("l_name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String specialty = request.getParameter("specialty");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		int phone = Integer.parseInt(request.getParameter("phone"));
		String address = request.getParameter("address");
		 
		try {
			String query = "insert into doctor(d_first_name,d_last_name,d_email,d_password,d_specialty,d_age,"
					+ "d_gender,d_phone,d_address) values(?,?,?,?,?,?,?,?,?)";
			ps=connection.prepareStatement(query);
			ps.setString(1, first_name);
			ps.setString(2,last_name);
			ps.setString(3, email);
			ps.setString(4, password);
			ps.setString(5, specialty);
			ps.setInt(6, age);
			ps.setString(7, gender);
			ps.setInt(8, phone);
			ps.setString(9, address);
			int x = ps.executeUpdate();
			if(x!=0) {
				response.sendRedirect("./doctor_login.html?msg=Doctor Register Successful");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

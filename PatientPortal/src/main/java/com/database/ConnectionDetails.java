package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDetails {
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/summitworks";
		String username = "root";
		String password = "365Pass";
		Connection connection = DriverManager.getConnection(url, username, password);
		return connection;
	}
}
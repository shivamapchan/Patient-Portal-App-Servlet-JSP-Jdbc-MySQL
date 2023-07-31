<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="lightGreen">
	<br>
	<h1 align="center">Welcome to Patient Portal-MyChart</h1>
	<br>
	<br>
	<h2 align="center">
		<a href="patient_appointment_details.jsp" align="center">View Appointments</a>
		<a href="patient_profile.jsp" align="center">View Profile</a>
		<a href="appointment.jsp" align="center">Make Appoinment</a><br><br>
		<a href="patient_home.jsp" align="center">Home Page</a>
		<a href="index.html" align="center">Logout</a>
	</h2>
</body>
</html>

<%@page import="java.sql.*"%>
<%@page import="com.database.*"%>

<table border="1" width="400" height="300" cellpadding="15" align="center">
	<tr>
		<td>ID</td>
		<td>F_Name</td>
		<td>L_Name</td>
		<td>Email</td>
		<td>Password</td>
		<td>Age</td>
		<td>Gender</td>
		<td>Phone</td>
		<td>Hobbies</td>
		<td>Address</td>
	</tr>
	<%
	Connection connection = ConnectionDetails.getConnection();
	PreparedStatement ps = connection.prepareStatement("select * from patient where p_id=?");
	int id = (Integer)session.getAttribute("P_ID");
	ps.setInt(1,id);
	ResultSet rs = ps.executeQuery();
	while (rs.next()) {
	%>
	<tr>
		<td><%=rs.getInt(1) %></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		<td><%=rs.getInt(6)%></td>
		<td><%=rs.getString(7)%></td>
		<td><%=rs.getInt(8)%></td>
		<td><%=rs.getString(9)%></td>
		<td><%=rs.getString(10)%></td>
	</tr>

	<%
	}
	%>

</table>
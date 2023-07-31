<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment page</title>
</head>
<body bgcolor="lightBlue">
	<br>
	<h1 align="center">Apply Appointment - Patient Portal-MyChart</h1>
	<br>
	<br>
	<h1 align="center">
		<a href="patient_profile.jsp" align="center">View Profile</a>
		<a href="patient_home.jsp" align="center">Home Page</a>
		<a href="index.html" align="center">Logout</a>
	</h1>
</body>
</html>

<%@page import="java.sql.*"%>
<%@page import="com.database.*"%>

<h3 align="center">
	<form action="./search_doctor.jsp">
	<label>Search Doctor:</label>
	<input type="text" name="search" placeholder="search doctor by specialty">
	<input type="submit" value="Search">
	</form>
</h3>

<table border="1" width="400" height="300" cellpadding="15" align="center">
	<tr>
		<td>ID</td>
		<td>F_Name</td>
		<td>L_Name</td>
		<td>Email</td>
		<td>Password</td>
		<td>Specialty</td>
		<td>Age</td>
		<td>Gender</td>
		<td>Phone</td>
		<td>Address</td>
		<td>Appointment</td>
	</tr>
	<%
	Connection connection = ConnectionDetails.getConnection();
	PreparedStatement ps = connection.prepareStatement("select * from doctor");

	ResultSet rs = ps.executeQuery();
	while (rs.next()) {
	%>
	<tr>
		<td><%=rs.getInt(1) %></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		<td><%=rs.getString(6)%></td>
		<td><%=rs.getInt(7)%></td>
		<td><%=rs.getString(8)%></td>
		<td><%=rs.getInt(9)%></td>
		<td><%=rs.getString(10)%></td>
		<td><a href="patient_apply_appointment.jsp?doc_id=<%=rs.getInt(1)%>">Apply Appointment</a></td>
	</tr>

	<%
	}
	%>

</table>
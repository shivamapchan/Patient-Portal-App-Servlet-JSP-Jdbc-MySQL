<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Requested appointments page</title>
</head>
<body bgcolor="lightGrey">
	<br>
	<h2 align="center">Patient Portal-MyChart</h2>
	<br>
	<h2 align="center">
		<a href="doctor_profile.jsp" align="center">My Profile</a>
		<a href="doctor_home.jsp" align="center">Home Page</a>
		<a href="index.html" align="center">Logout</a>
	</h2>
	<h3 align="center">List of patients applied for appointments</h3>
</body>
</html>

<%@page import="java.sql.*"%>
<%@page import="com.database.*"%>

<table border="2" align="center" cellpadding="20" height="200" width="950">
<tr> 
<td>First_Name</td><td>Last_Name</td><td>Gender</td><td>Age</td><td>Date</td><td>Time</td><td>Reason</td><td>Phone</td>
<td>Accept/Decline</td></tr>
<%
Connection connection= ConnectionDetails.getConnection();
int d_id = (Integer)session.getAttribute("D_ID"); // session object "D_ID" getting from DoctorLogin.
String sql = "select p_f_name, p_l_name, p_gender, p_age, date, time, reason,p_phone,p_id from appointment where d_id=?";
PreparedStatement ps = connection.prepareStatement(sql);
ps.setInt(1,d_id);

ResultSet rs = ps.executeQuery();
while(rs.next()){
%>
  <tr> 
  <td><%=rs.getString(1) %></td>
  <td><%=rs.getString(2) %></td>
  <td><%=rs.getString(3) %></td>
  <td><%=rs.getInt(4) %></td>
  <td><%=rs.getString(5) %></td>
  <td><%=rs.getString(6) %></td>
  <td><%=rs.getString(7) %></td>
  <td><%=rs.getInt(8) %></td>
  <td>
  <a href="doctor_accept.jsp?p_id=<%=rs.getInt(9)%>">Accept?</a>
  <a href="doctor_decline.jsp?p_id=<%=rs.getInt(9)%>">Decline?</a>
  </td>
  </tr>

<%
}
%>
</table>
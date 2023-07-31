<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment page</title>
</head>
<body bgcolor="lightGrey">
	<br>
	<h2 align="center">Patient Portal-MyChart</h2>
	<br>
	<h2 align="center">
		<a href="patient_profile.jsp" align="center">View Profile</a>
		<a href="patient_home.jsp" align="center">Home Page</a>
		<a href="index.html" align="center">Logout</a>
	</h2>
	<h3 align="center">List of your upcoming appointments</h3>
</body>
</html>


<%@page import="java.sql.*"%>
<%@page import="com.database.*"%>

<table border="2" align="center" cellpadding="20" height="200" width="950">
<tr> 
<td>Dr.First_Name</td><td>Last_Name</td><td>Specialty</td><td>Date</td><td>Time</td><td>Reason</td><td>Phone</td><td>Location</td>
<td>Status</td><td>Change/Cancel</td></tr>
<%
Connection connection= ConnectionDetails.getConnection();
int p_id = (Integer)session.getAttribute("P_ID");
String sql = "select d_f_name, d_l_name, specialty,date, time, reason,d_phone,d_address,status,d_id from appointment where p_id=?";
PreparedStatement ps = connection.prepareStatement(sql);
ps.setInt(1,p_id);

ResultSet rs = ps.executeQuery();
while(rs.next()){
%>
  <tr> 
  <td><%=rs.getString(1) %></td>
  <td><%=rs.getString(2) %></td>
  <td><%=rs.getString(3) %></td>
  <td><%=rs.getString(4) %></td>
  <td><%=rs.getString(5) %></td>
  <td><%=rs.getString(6) %></td>
  <td><%=rs.getInt(7) %></td>
  <td><%=rs.getString(8) %></td>
  <td><%=rs.getString(9) %></td>
  <td>
  <a href="patient_change_appt.jsp?d_id=<%=rs.getInt(10)%>">change?</a>
  <a href="patient_cancel_appt.jsp?d_id=<%=rs.getInt(10)%>">cancel?</a>
  </td>
  </tr>

<%
}
%>
</table>
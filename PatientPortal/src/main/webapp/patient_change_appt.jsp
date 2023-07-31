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
	<h3 align="center">Modify your upcoming appointments</h3>
</body>
</html>


<%@page import="java.sql.*"%>
<%@page import="com.database.*"%>

<%
Connection connection = ConnectionDetails.getConnection();
int p_id = (Integer)session.getAttribute("P_ID");
int d_id = Integer.parseInt(request.getParameter("d_id"));

String sql = "select * from appointment where p_id=? and d_id=?";
PreparedStatement ps = connection.prepareStatement(sql);
ps.setInt(1, p_id);
ps.setInt(2,d_id);

ResultSet rs = ps.executeQuery();
while(rs.next()){
%>
<table border="2" align="center" cellpadding="20" height="200" width="950">
  <tr> 
    <td>
      <form action="./patient_changed_appt.jsp?">
      <h3>Edit the necessary details</h3>
	  <label for="reason">Reason:</label>
      <input type="text" name="reason" value="<%=rs.getString(8)%>"><br><br>
      <label for="date">Date:</label>
	  <input type="date" name="date" value="<%=rs.getString(9)%>"><br><br>
	  <label for="time">Time:</label>
	  <input type="time" name="time" value="<%=rs.getString(10)%>"><br><br>
	  <input type="hidden" name="p_id" value="<%=rs.getInt(2)%>">
	  <input type="hidden" name="d_id" value="<%=rs.getInt(11)%>">
      <input type="submit" value="Confirm">
      </form>
    </td>
  </tr>
</table>
	
<%
}

%>
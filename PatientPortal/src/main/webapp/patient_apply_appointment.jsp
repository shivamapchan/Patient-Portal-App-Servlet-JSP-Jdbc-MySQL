
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PatientPortalApplication</title>
</head>
<body bgcolor="lightGray">
<br>
<h1 align="center">Welcome to Patient Portal-MyChart</h1>
<br>
<br>
	<h2 align="center">
		<a href="patient_profile.jsp" align="center">Patient Profile</a><br><br>
		<a href="appointment.jsp" align="center">Make Appointment</a><br><br>
		<a href="patient_home.jsp" align="center">Home Page</a><br><br>
		<a href="index.html" align="center">Logout</a>
	</h2>
<br>

<%@page import="java.sql.*" %>
<%@page import="com.database.*" %>

<%
Connection connection = ConnectionDetails.getConnection();
int id = Integer.parseInt(request.getParameter("doc_id")); // "doc_id" getting from appointment.jsp
PreparedStatement ps = connection.prepareStatement("select * from doctor where d_id=?");
ps.setInt(1,id);
ResultSet rs = ps.executeQuery();
while(rs.next()){
%>

<table border="2" align="center" cellpadding="20" height="200" width="950">
  <tr> 
    <td>
      <form action="./appointment_confirm.jsp?">
      <h3>Fill out the form to confirm appointment</h3>
	  <label for="reason">Reason:</label>
      <input type="text" name="reason" placeholder="Enter the reason for visit"><br><br>
      <label for="date">Date:</label>
	  <input type="date" name="date" placeholder="Enter date"><br><br>
	  <label for="time">Time:</label>
	  <input type="time" name="time" placeholder="Enter time"><br><br>
	  <input type="hidden" name="d_id" value="<%=rs.getInt(1)%>">
	  <input type="hidden" name="d_f_name" value="<%=rs.getString(2)%>">
	  <input type="hidden" name="d_l_name" value="<%=rs.getString(3)%>">
	  <input type="hidden" name="specialty" value="<%=rs.getString(6)%>">
	  <input type="hidden" name="d_gender" value="<%=rs.getString(8)%>">
	  <input type="hidden" name="d_phone" value="<%=rs.getInt(9)%>">
	  <input type="hidden" name="d_address" value="<%=rs.getString(10)%>">
	  
      <input type="submit" value="Confirm">
      </form>
    </td>
  </tr>
</table>
<% } %>
</body>
</html>
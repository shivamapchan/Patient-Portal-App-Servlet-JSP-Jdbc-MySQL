<%@page import="java.sql.*"%>
<%@page import="com.database.*"%>


<%
Connection connection = ConnectionDetails.getConnection();
int d_id = (Integer)session.getAttribute("D_ID"); // session object "D_ID" getting from "DoctorLogin" Servlet Class.
int p_id = Integer.parseInt(request.getParameter("p_id")); // session variable "p_id" getting from "doctor_received_appointment.jsp"
PreparedStatement ps = connection.prepareStatement("update appointment set status=? where p_id=? and d_id=?");
ps.setString(1,"declined!");
ps.setInt(2,p_id);
ps.setInt(3,d_id);
int x = ps.executeUpdate();
if(x!=0){
	response.sendRedirect("./doctor_received_appointments.jsp?msg=Appointment declined!");
}
%>
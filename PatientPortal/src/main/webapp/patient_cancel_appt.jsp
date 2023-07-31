<%@page import="java.sql.*"%>
<%@page import="com.database.*"%>

<%
Connection connection = ConnectionDetails.getConnection();
PreparedStatement ps = connection.prepareStatement("delete from appointment where p_id=? and d_id=?");
int p_id = (Integer)session.getAttribute("P_ID");
int d_id = Integer.parseInt(request.getParameter("d_id"));
ps.setInt(1, p_id);
ps.setInt(2,d_id);
int x = ps.executeUpdate();
if(x!=0){
	response.sendRedirect("./patient_appointment_details.jsp?msg=Appointment cancel sccessfully");
}
%>
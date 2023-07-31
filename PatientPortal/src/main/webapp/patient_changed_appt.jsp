<%@page import="java.sql.*"%>
<%@page import="com.database.*"%>

<%
Connection connection = ConnectionDetails.getConnection();
String reason = request.getParameter("reason");
String date = request.getParameter("date");
String time = request.getParameter("time");
int p_id = (Integer)session.getAttribute("P_ID");
int d_id = Integer.parseInt(request.getParameter("d_id"));

String sql = "update appointment set reason=?, date=?, time=? where p_id=? and d_id=?";

PreparedStatement ps = connection.prepareStatement(sql);
ps.setString(1, reason);
ps.setString(2,date);
ps.setString(3,time);
ps.setInt(4,p_id);
ps.setInt(5,d_id);
int x = ps.executeUpdate();
if(x!=0){
	response.sendRedirect("./patient_appointment_details.jsp?msg=Updated success");
}
%>
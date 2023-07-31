<%@page import="java.sql.*"%>
<%@page import="com.database.*"%>

<%
	Connection connection = ConnectionDetails.getConnection();
	int p_id = (Integer)session.getAttribute("P_ID");
	String p_f_name = (String)session.getAttribute("f_name");
	String p_l_name = (String)session.getAttribute("l_name");
	String p_gender = (String)session.getAttribute("gender");
	int p_age = (Integer)session.getAttribute("age");
	int p_phone = (Integer)session.getAttribute("phone");
	String reason = request.getParameter("reason");
	String date = request.getParameter("date");
	String time = request.getParameter("time");
	int d_id = Integer.parseInt(request.getParameter("d_id"));
	String d_f_name = request.getParameter("d_f_name");
	String d_l_name = request.getParameter("d_l_name");
	String specialty = request.getParameter("specialty");
	int d_phone = Integer.parseInt(request.getParameter("d_phone"));
	String d_address = request.getParameter("d_address");
	String d_gender = request.getParameter("d_gender");
	
	
	String query = "insert into appointment (p_id, p_f_name, p_l_name, p_gender, p_age,p_phone,reason, date,"+
	"time,d_id,d_f_name,d_l_name,specialty,d_phone,d_address,d_gender,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps = connection.prepareStatement(query);
	ps.setInt(1,p_id);
	ps.setString(2,p_f_name);
	ps.setString(3,p_l_name);
	ps.setString(4,p_gender);
	ps.setInt(5,p_age);
	ps.setInt(6,p_phone);
	ps.setString(7,reason);
	ps.setString(8,date);
	ps.setString(9,time);
	
	ps.setInt(10,d_id);
	ps.setString(11,d_f_name);
	ps.setString(12,d_l_name);
	ps.setString(13,specialty);
	ps.setInt(14,d_phone);
	ps.setString(15,d_address);
	ps.setString(16,d_gender);
	ps.setString(17,"pending");
	int x = ps.executeUpdate();
	if(x!=0){
		response.sendRedirect("./patient_appointment_details.jsp?msg=View applied appointment");	
	}
%>

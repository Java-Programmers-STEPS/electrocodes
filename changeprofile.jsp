<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
      <%@ page import="pass.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String email=(String)session.getAttribute("email"); 
session.setMaxInactiveInterval(5*60);
 if(email!=null){
    String name=request.getParameter("nname"); 
 	String nemail=request.getParameter("nemail");
	String phone=request.getParameter("nphone");
	connection con= new connection();
	
	try{
		int log_id=0;
		
					
					PreparedStatement str3=con.getPreparedstatement("select loid from Login where loemail=?");
					str3.setString(1,email);
					ResultSet rst=str3.executeQuery();
					while(rst.next()) {
						log_id=rst.getInt(1);
					}
					System.out.println(log_id);
	
	 	PreparedStatement str=con.getPreparedstatement("update Login set loemail=? where loid=?");
	str.setString(1,nemail);
 	str.setInt(2,log_id);
 	int i=str.executeUpdate();
	System.out.println(i);
 	if(i>0){
 
 		PreparedStatement str1=con.getPreparedstatement("update registration set uname=?,uphone=? where loidfk=?");
str1.setString(1,name);
	str1.setString(2,phone);
str1.setInt(3,log_id);
	int j=str1.executeUpdate();
	System.out.println(j);
 	if(j>0){response.sendRedirect("myAccount.jsp");
 	}
 	else{response.sendRedirect("myAccount.jsp"); 
 	 
 	}}}
 		catch(Exception e){
 			out.print(e);
 		}}
	
 else{response.sendRedirect("myAccount.jsp");
 	}
 


 	%>
</body>
</html>
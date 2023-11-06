<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Base64"%>
<%@ page import="java.util.UUID"%>
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
String name=request.getParameter("name");
String email=request.getParameter("email"); 
String phone=request.getParameter("phoneno");
String password=request.getParameter("password");
String key=null;
String spassword=null;
String em =null;
connection con= new connection();

 int type=1;
 try {
	
    UUID uuid=UUID.randomUUID();
     key=uuid.toString();
     String saltd_password=password+key;
     spassword= Base64.getEncoder().encodeToString(saltd_password.getBytes());
     
    
   		 
} catch (Exception e) {
 
    e.printStackTrace();
} 
 try{
		
	PreparedStatement str=con.getPreparedstatement("INSERT INTO registration(uname,uphone,remail)VALUES(?,?,?)");
	str.setString(1,name);
	str.setString(2,phone);
	str.setString(3,email);
	int i=str.executeUpdate();
	PreparedStatement str1=con.getPreparedstatement("INSERT INTO Login(loemail,lokey,lopassword,lousertype)VALUES(?,?,?,?)");
	str1.setString(1,email);
	str1.setString(2,key);
	str1.setString(3,spassword);
	str1.setInt(4,type);
	int j=str1.executeUpdate();
	if(i>0){if(j>0){
		PreparedStatement str2=con.getPreparedstatement("update Login set lostatus=? where loemail=? ");
		str2.setInt(1,1);
		str2.setString(2,email);
		int k=str2.executeUpdate();
out.print(" Registration successfull");
}}
	else{
		out.print(" Error!!.."); 
	}}
	catch(Exception e){
		out.print(e);
	}  
%>
</body>
</html>
<%@ page import="java.util.Base64"%>
<%@ page import="java.util.UUID"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="pass.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String email=request.getParameter("email");
String password=request.getParameter("password");
String passk=null;
String pass=null;
String spassword=null;
connection con= new connection();
int s=0;
int status=0;
try{
	
PreparedStatement str=con.getPreparedstatement("select lousertype from Login where loemail=?");
str.setString(1,email);
ResultSet rst=str.executeQuery();
while(rst.next()){
	s=rst.getInt(1);
}
}
catch(Exception e){
	out.print(e);
}

	try{
	
PreparedStatement str=con.getPreparedstatement("select lokey,lopassword,lostatus from Login where loemail=?");
str.setString(1,email);
ResultSet rst=str.executeQuery();
while(rst.next()){
	passk=rst.getString(1);
	pass=rst.getString(2);
	status=rst.getInt(3);
	System.out.println("statsus"+status);
}
	}
catch(Exception e){
	out.print(e);
}
	
  try {
	  String saltd_password=password+passk;
     spassword= Base64.getEncoder().encodeToString(saltd_password.getBytes());
     
    } 
 catch (Exception e) {
 
    e.printStackTrace();
}
 
 if(spassword.equals(pass)){
	 if(status==2){
	 request.getSession().setAttribute("email", email);
	 

	 if(s==2){
request.getRequestDispatcher("Home.jsp").forward(request, response);
}
	 else{request.getRequestDispatcher("admin.jsp").forward(request, response);}}
	 else{
		 
		 out.print("please complete registration!"); 
	 }}
else{

out.print("incorrect email or password!");
	  }

%>

</body>
</html>
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
String email=(String)session.getAttribute("email");
 session.setMaxInactiveInterval(5*60);
 connection con= new connection();
 if(email!=null){
    String cupass=request.getParameter("cupass"); 
 	String npass=request.getParameter("npass");
 	System.out.println("cupass"+cupass);
 	System.out.println("npass"+npass);
 	String passk=null;
 	String pass=null;
 	String spassword=null;
 	String newpass=null;
 	try{
 		
 		PreparedStatement str=con.getPreparedstatement("select lokey,lopassword from Login where loemail=?");
 		str.setString(1,email);
 		ResultSet rst=str.executeQuery();
 		while(rst.next()){
 			passk=rst.getString(1);
 			pass=rst.getString(2);
 		}
 	}
 	catch(Exception e){
 		out.print(e);
 	}
 	 try {
 		  String saltd_password=cupass+passk;
 	     spassword= Base64.getEncoder().encodeToString(saltd_password.getBytes());
 	     
 	    } 
 	 catch (Exception e) {
 	 
 	    e.printStackTrace();
 	} 
 	if(spassword.equals(pass)){
 		try{
 	
 			
 	PreparedStatement str=con.getPreparedstatement("update Login set lopassword=? where loemail=?");
 	try {
		  String saltd_password=npass+passk;
	    newpass= Base64.getEncoder().encodeToString(saltd_password.getBytes());
	     
	    } 
	 catch (Exception e) {
	 
	    e.printStackTrace();
	} 
 	str.setString(1,newpass);
 	str.setString(2,email);
 	int i=str.executeUpdate();
 	
 	if(i>0){request.getRequestDispatcher("myAccount.jsp").include(request, response);   
 	out.println("<p style='color:red;'>");
 	out.print("updated"); 
 	out.println("</p>");
 	}
 	else { request.getRequestDispatcher("Home.jsp").include(request, response);   
 	out.println("<p style='color:red;'>");
 	out.print("error!"); 
 	out.println("</p>");
 	}}
 		
 		
 	catch(Exception e){
 		out.print(e);
 	}
 		
 }
 	else {request.getRequestDispatcher("myAccount.jsp").include(request, response);   
 	out.println("<p style='color:red;'>");
 	out.print("password incorrect!");
 	out.println("</p>");
}
     }
     else{request.getRequestDispatcher("myAccount.jsp").include(request, response);   
     out.println("<p style='color:red;'>");
     out.print("please login first!");
     out.println("</p>");
     	}
     

%>
</body>
</html>
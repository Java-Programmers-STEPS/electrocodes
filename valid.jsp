<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %> 
  <%@ page import="pass.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String email=request.getParameter("val"); 

String nm=null;
int k=0;
connection con= new connection();
try{  

PreparedStatement ps1=con.getPreparedstatement("select loemail from Login"); 
ResultSet rs=ps1.executeQuery();  

while(rs.next()){  
	System.out.println(nm);
	nm=rs.getString(1);
	if(nm.equals(email)){
		k=1;
	}
	
}
System.out.println(k);
if(k==1){
out.print("Unavailable!");  }
else{  
out.print("Available!");  
}  
}catch(Exception e){out.print(e);}  

%>  
</head>
<body>

</body>
</html>
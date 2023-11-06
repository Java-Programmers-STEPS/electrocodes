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
<% String uemail=(String)request.getSession().getAttribute("email"); 
session.setMaxInactiveInterval(5*60);
		int loid=0;
		String acno=null;
		String em =null;
		connection con= new connection();
		try{
		 	
			

			PreparedStatement ps1=con.getPreparedstatement("select loid from Login where loemail =?");	 
			 ps1.setString(1, uemail);
			 ResultSet rs=ps1.executeQuery();  	
			 while(rs.next()) {
					loid = rs.getInt(1);
			 }			
			
			
			
			
			
PreparedStatement ps2=con.getPreparedstatement("select cardnumber from Transactiontable inner join Custpayment on Custpayment.id=Transactiontable.cpidfk where Custpayment.loidfk=?");	 
 ps2.setInt(1, loid);
 ResultSet rs2=ps2.executeQuery();  	
 while(rs2.next()) {
		acno = rs2.getString(1);
 }
	
	}
	catch(Exception e){
		out.print(e);}
	%>
	Acc no  :<input type="text" name="accno" value="<%=acno%>">
</body>
</html>
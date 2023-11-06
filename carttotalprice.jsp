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
int loid=0;
int price=0;
int disprice=0;
int pricetotal=0;
int dispricetotal=0;
int quty=0;
String email=(String)session.getAttribute("email");
session.setMaxInactiveInterval(5*60);
connection con= new connection();

 try{
	
		PreparedStatement ps1=con.getPreparedstatement("select loid from Login where loemail =?");	 
		 ps1.setString(1, email);
		 ResultSet rs=ps1.executeQuery();  	
		 while(rs.next()) {
				loid = rs.getInt(1);
				
		 }
		PreparedStatement ps2=con.getPreparedstatement("select producttable.proprice,producttable.discountprice,carttable.cproqut from carttable inner join producttable on carttable.cproid=producttable.proid inner join Login on carttable.cuseremail=  Login.loid WHERE Login.loid=? GROUP BY cid order by cid    ");	 
				 ps2.setInt(1, loid);
				 ResultSet rs2=ps2.executeQuery();
				 
				 while(rs2.next()) {
						price = rs2.getInt(1);
					   disprice = rs2.getInt(2);
					   quty=rs2.getInt(3);
					   System.out.println(quty);
					   price=price*quty;
					   disprice=disprice*quty;
						if(disprice!=0){price=0;}
						pricetotal=pricetotal+price;
						dispricetotal=dispricetotal+disprice;
 }}
 catch(Exception e){
	 out.print(e);
 }
 int total=pricetotal+dispricetotal;
			out.println("₹"+total);
		;%>
</body>
</html>
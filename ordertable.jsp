<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*"%>
       <%@ page import="pass.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<table border="1"> 
         <tr align="center"><th>ID</th><th>CUSTOMER EMAIL</th><th>PRODUCTS</th><th>DATE</th><th>PRICE</th></tr>   
         <%
         int id=0;int loid = 0;
         connection con= new connection();
 		//String email=(String)session.getAttribute("email"); 
    try
    {
           
    	PreparedStatement ps1=con.getPreparedstatement("select ordertable.products,ordertable.pdate,ordertable.price,Login.loemail from ordertable inner join Login on Login.loid = ordertable.userloid  order by oid DESC;");
        
    	ResultSet rs=ps1.executeQuery();
        while(rs.next()){
      id++;
        String products=rs.getString(1);
        String date=rs.getString(2);
        Double price=rs.getDouble(3);
        String email=rs.getString(4);
        %>  
    <tr><td><%out.print(id);%></td><td><%out.print(email);%></td><td><%out.print(products);%></td><td><%out.print(date);%></td><td><%out.print(price); %></td></tr>  
   <%}}
         catch(Exception e){
	out.print(e);}%>
    </table>  
     
</body>
</html>
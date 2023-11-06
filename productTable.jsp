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
         <tr align="center"><th>ID</th><th>NAME</th><th>CATEGORY</th><th>MODEL</th><th>PRICE</th><th>COUNT</th></tr>   
         <%
         connection con= new connection();
    try
    {
        
        Statement st=con.getStatement();
        ResultSet rs=st.executeQuery("select proid,proname,procategory,promodel,proprice,procount from producttable;");
        while(rs.next()){
        int id=rs.getInt(1);
        String name=rs.getString(2);
        String category=rs.getString(3);
        String model=rs.getString(4);
        int price=rs.getInt(5);
        int count=rs.getInt(6);
        %>  
    <tr><td <%if(count<=5){ %>style="color:red"<%} %>><%out.print(id);%></td><td <%if(count<=5){ %>style="color:red"<%} %>><%out.print(name); %></td><td <%if(count<=5){ %>style="color:red"<%} %>><%out.print(category); %></td><td <%if(count<=5){ %>style="color:red"<%} %>><%out.print(model); %></td><td <%if(count<=5){ %>style="color:red"<%} %>><%out.print(price); %></td><td <%if(count<=5){ %>style="color:red"<%} %>><%out.print(count); %></td></tr>  
   <%}}
         catch(Exception e){
	out.print(e);}%>
    </table>  
     
</body>
</html>
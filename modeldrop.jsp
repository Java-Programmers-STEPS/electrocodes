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
Product model:   <select name="sel" id="drop">
<% 
connection con= new connection();
 try
    {
        
        Statement st=con.getStatement();
        ResultSet rs=st.executeQuery("select proid,promodel from producttable;");
        while(rs.next()){
       int i=rs.getInt(1);
        String model=rs.getString(2);%>
        <option value=<%=i %>><%=model%></option>
       <% }}
        catch(Exception e){
	out.print(e);}%>
	</select>
</body>
</html>
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
 String sid=request.getParameter("id");
 int id=Integer.parseInt(sid);
 String name=null;
 String brand=null;
 String model=null;
 int price=0;
 int count=0;
 String category=null;
 String prodescription=null;
 connection con= new connection();
 try
    {
 
        PreparedStatement ps=con.getPreparedstatement("select proname,pbrand,promodel,proprice,procount,procategory,prodescription from producttable where proid=?");
       ps.setInt(1,id);
       ResultSet rs = ps.executeQuery();
while(rs.next()){
        	name=rs.getString(1);
        	brand=rs.getString(2);
        	model=rs.getString(3);
        	price=rs.getInt(4);
        	count=rs.getInt(5);
        	category=rs.getString(6);
        prodescription=rs.getString(7);
        	
   }}
         catch(Exception e){
	out.print(e);}%>
New Product Name:<br><input type="text" name="pname" value="<%=name%>"><br>
New Product Brand:<br><input type="text" name="pbrand" value="<%=brand%>"><br>
New Product Model:<br><input type="text" name="pmodel" value="<%=model%>"><br>
New Product Price:<br><input type="text" name="pprice" value="<%=price%>"><br>
New Product Image 1:<br> <img src="" id="IMAGE1" width="100px" height="70px"/>
<br> <input type="file"  name="IMAGE1" id="fileToUpload1" onchange="readURL(this,IMAGES);">
<br>
New Product Image 2:<br> <img src="" id="IMAGE2" width="100px" height="70px"/>
<br> <input type="file" name="IMAGE2" id="fileToUpload2" onchange="readURL(this,IMAGES);">
<br>
New Product Image 3:<br> <img src="" id="IMAGE3" width="100px" height="70px"/>
<br> <input type="file" name="IMAGE3" id="fileToUpload3" onchange="readURL(this,IMAGES);">
<br>
New Product Count:<br><input type="text" name="pcount" value="<%=count%>"><br>
New Category:<br><input type="text" name="pcategory" value="<%=category%>"><br>
New description:<br><input type="text" name="pdescription" value="<%=prodescription%>"><br>
</body>
</html>
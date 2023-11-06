<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.io.InputStream"%>
     <%@ page import="javax.servlet.http.Part"%>
       <%@ page import="pass.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	String email=(String)session.getAttribute("email"); 
connection con= new connection();
if(email!=null){
	 String name=request.getParameter("pname"); 
	 	String brand=request.getParameter("pbrand");
		String model=request.getParameter("pmodel");
		String rs=request.getParameter("pprice");
		int price=0;
		price=Integer.parseInt(rs);
 InputStream inputStream1 = null; 
	/*
	 * InputStream inputStream2 = null; InputStream inputStream3 = null;
	 */
		 Part IMAGES = request.getPart("IMAGE1"); 
	/*
	 * Part IMAGE2 = request.getPart("IMAGE2"); Part IMAGE3 =
	 * request.getPart("IMAGE3");
	 */
		 try {
			if (IMAGES != null ) {
				inputStream1=IMAGES.getInputStream();
			}
		/*
		 * if (IMAGE2 != null ) { inputStream2=IMAGE2.getInputStream(); } if (IMAGE3 !=
		 * null ) { inputStream3=IMAGE3.getInputStream(); }
		 */
				
	 }
		catch(Exception e){
			out.print(e);
		}
		
		String pcount=request.getParameter("pcount");
		int count=Integer.parseInt(pcount);
		String category=request.getParameter("pcategory");
		String description=request.getParameter("pdescription");
		
		try{
		 	
			
	PreparedStatement str=con.getPreparedstatement("insert into producttable(proname,proprice,pbrand,procategory,promodel,prodescription,procount,proimage1) values(?,?,?,?,?,?,?,?)");
	str.setString(1,name);
	str.setInt(2,price);
	str.setString(3,brand);
	str.setString(4,category);
	str.setString(5,model);
	str.setString(6,description);
	
		/*
		 * str.setBlob(8,inputStream2); str.setBlob(9,inputStream3);
		 */
	str.setInt(7,count);
		 str.setBlob(8,inputStream1); 
	int i=str.executeUpdate();
	if(i>0){request.getRequestDispatcher("admin.jsp").include(request, response);   
   out.println("<p style='color:red;'>");    
   out.print("product uploaded");  
   out.println("</p>"); }
	else{request.getRequestDispatcher("admin.jsp").include(request, response);   
   out.println("<p style='color:red;'>");    
   out.print("Error");  
   out.println("</p>"); }
}
		catch(Exception e){
		out.print(e);}
		}
else{
	out.println("please login first");
}

%>
</body>
</html>
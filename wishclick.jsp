<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
      <%@ page import="pass.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script> 
<script>

var request2;  
function cartint()  
{  
	var url="cartnumber";
  
if(window.XMLHttpRequest){  
request2=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request2=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request2.onreadystatechange=getInfo2;  
request2.open("GET",url,true);  
request2.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo2(){  
if(request2.readyState==4){  
var val=request2.responseText;  

	document.getElementById('cart').innerHTML=val;
}}
</script>
</head>
<body>

<%String email=(String)session.getAttribute("email"); 
connection con= new connection();
int loid=0;
if(email!=null){
	int  lprice=0;
	 String lname=null;
	 int lpid=0;
	
	 int no=0;
	 int y=0;
	 int  sprice=0;
	 String sname=null;
	 int spid=0;
	
		 try{
			 	
				
				PreparedStatement ps1=con.getPreparedstatement("select loid from Login where loemail =?");	 
				 ps1.setString(1, email);
				 ResultSet rs=ps1.executeQuery();  	
				 while(rs.next()) {
						loid = rs.getInt(1);
				 
				 }
				
				
				PreparedStatement ps2=con.getPreparedstatement("select producttable.proprice,producttable.proname,producttable.proid from wishlist inner join producttable on wishlist.wproid=producttable.proid inner join Login on wishlist.wuseremail=  Login.loid WHERE Login.loid=? GROUP BY wid order by wid DESC limit 2 ");	 
	 ps2.setInt(1, loid);
	 ResultSet rs1=ps2.executeQuery();  	
	if( rs1.next()){y=1;
			 lprice=rs1.getInt(1);
	lname=rs1.getString(2);
	lpid=rs1.getInt(3);
	}
	else{no=1;}
	 if(rs1.next()){y=2;
	 sprice=rs1.getInt(1);
sname=rs1.getString(2);
spid=rs1.getInt(3);
}
	 else{no+=1;}
	 
	 }	 catch(Exception e){
			 out.print(e);
		 }
	%>

	
<%if(y==2){ %><div class="cart-list">
											<div class="product-widget">
												<div class="product-img">
													<img src="imageview?id=<%=spid%>" alt="">
												</div>
												<div class="product-body">
													<h3 class="product-name"><a href="#"><%=sname %></a></h3>
													<h4 class="product-price"><span class="qty"></span>₹<%=sprice %></h4>
												</div>
												
											</div>
											<div class="product-widget">
											<div class="product-img">
													<img src="imageview?id=<%=lpid%>" alt="">
												</div>
												<div class="product-body">
													<h3 class="product-name"><a href="#"><%=lname%></a></h3>
													<h4 class="product-price"><span class="qty"></span>₹<%=lprice %></h4>
												</div>
												
											</div>
											
										</div>
									
										<%}
if(y==1){%>
<div class="cart-list">
<div class="product-widget">
											<div class="product-img">
													<img src="imageview?id=<%=lpid%>" alt="">
												</div>
												<div class="product-body">
													<h3 class="product-name"><a href="#"><%=lname%></a></h3>
													<h4 class="product-price"><span class="qty"></span>₹<%=lprice %></h4>
												</div>
												
											</div>
											</div><%} 
if(no==2){%>
<div class="cart-list">
<div class="product-widget">
	<P style="color:red;font-size:20px;">No items..<p>	
	</div></div>	<%} }
else {out.print("please login...");}%>
</body>
</html>
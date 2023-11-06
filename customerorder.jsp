<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="java.sql.*"%>
        <%@ page import="pass.*" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Electro - HTML Ecommerce Template</title>

 		<!-- Google font -->
 		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

 		<!-- Bootstrap -->
 		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

 		<!-- Slick -->
 		<link type="text/css" rel="stylesheet" href="css/slick.css"/>
 		<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

 		<!-- nouislider -->
 		<link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

 		<!-- Font Awesome Icon -->
 		<link rel="stylesheet" href="css/font-awesome.min.css">

 		<!-- Custom stlylesheet -->
 		<link type="text/css" rel="stylesheet" href="css/style.css"/>

 		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
 		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
 		<!--[if lt IE 9]>
 		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
 		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
 		<![endif]-->
 		<style>
.cartlist1{
margin-left:10px;}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script> 
<% 


if(session.getAttribute("email")==null){
out.println("Please login first");
	response.sendRedirect("myAccount.jsp");
}
%>

<script>
$(window).load(function(){  
   this.name(); 
    });   
   
var request1;  
function name()  
{  
	var url="username";
  
if(window.XMLHttpRequest){  
request1=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request1=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request1.onreadystatechange=getInfo;  
request1.open("GET",url,true);  
request1.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
if(request1.readyState==4){  
var val=request1.responseText;  
if(val.indexOf("null")>-1){
	val="";
}
else{
	document.getElementById('uname').innerHTML=val;
}}

} 
$(window).load(function(){  
	   this.cartint(); 
	    }); 
var request2;  

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
	document.getElementById('cartin').innerHTML=val;
}}
var request3;  
function cartarea()  
{  
	total();
	var url="cartclick.jsp";
  
if(window.XMLHttpRequest){  
request3=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request3=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request3.onreadystatechange=getInfo3;  
request3.open("GET",url,true);  
request3.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo3(){  
if(request3.readyState==4){  
var val=request3.responseText;  

	document.getElementById('cartpage').innerHTML=val;
}}
var request4;  
function total()  
{  
	
	var url="carttotalprice.jsp";
  
if(window.XMLHttpRequest){  
request4=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request4=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request4.onreadystatechange=getInfo4;  
request4.open("GET",url,true);  
request4.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo4(){  
if(request4.readyState==4){  
var val=request4.responseText;  

	document.getElementById('tbill').innerHTML=val;
}}
$(window).load(function(){  
	   this.wishint(); 
	    }); 


var request5;  
function wishint()  
{  
	var url="wishnumber";

if(window.XMLHttpRequest){  
request5=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request5=new ActiveXObject("Microsoft.XMLHTTP");  
}  

try{  
request5.onreadystatechange=getInfo5;  
request5.open("GET",url,true);  
request5.send();  
}catch(e){alert("Unable to connect to server");}  
}  

function getInfo5(){  
if(request5.readyState==4){  
var val=request5.responseText;  

	document.getElementById('whish').innerHTML=val;
	document.getElementById('wish').innerHTML=val;
}}
var request6;  
function wisharea()  
{  
	total();
	var url="wishclick.jsp";
  
if(window.XMLHttpRequest){  
request6=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request6=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request6.onreadystatechange=getInfo6;  
request6.open("GET",url,true);  
request6.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo6(){  
if(request6.readyState==4){  
var val=request6.responseText;  

	document.getElementById('wishpage').innerHTML=val;
}}
var request7;  
function wishtocart()  
{  
	var url="wishtocart";
  
if(window.XMLHttpRequest){  
request7=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request7=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request7.onreadystatechange=getInfo7  

request7.open("GET",url,true);  
request7.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo7(){  
if(request7.readyState==4){  
var val=request7.responseText;  
if(val.indexOf("up")>-1){
	window.location.href="Home.jsp"
}
else{
	alert("Error");}
}}
$(window).load(function(){  
	   this.name(); 
	    });   
	   
	var request8;  
	function laptop1()  
	{  
		var url="laptop.jsp";
	  
	if(window.XMLHttpRequest){  
	request8=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
	request8=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	  
	try{  
	request8.onreadystatechange=getInfo8;  
	request8.open("GET",url,true);  
	request8.send();  
	}catch(e){alert("Unable to connect to server");}  
	}  
	  
	function getInfo8(){  
	if(request8.readyState==4){  
	var val=request8.responseText;  
	
		document.getElementById('lap').innerHTML=val;
	}}
	var request11;  
	function img(id)  
	{  
		var sid=id;
	var url="cart?id="+sid;
	  
	if(window.XMLHttpRequest){  
	request11=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
	request11=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	  
	try{  
	request11.onreadystatechange=getInfo11;
	request11.onreadystatechange=cartint; 
	request11.open("GET",url,true);  
	request11.send();  
	}catch(e){alert("Unable to connect to server");}  
	}  
	  
	function getInfo11(){  
	if(request11.readyState==4){  
	var val=request11.responseText;  
	if(val.indexOf("login")>-1){
		alert("please login");
	}
		
	}}
	var request12;  
	function wishl(id) 
	{  
		var sid=id;
		
	var url="wishlist?id="+sid;
	  this.wishint();
	if(window.XMLHttpRequest){  
	request12=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
	request12=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	  
	try{  
	request12.onreadystatechange=getInfo12;  
	request12.onreadystatechange=wishint;
	request12.open("GET",url,true);  
	request12.send();  
	}catch(e){alert("Unable to connect to server");}  
	}  
	  
	function getInfo12(){  
	if(request12.readyState==4){ 
    var val=request12.responseText;  
	if(val.indexOf("login")>-1){
		alert("please login");
	}
	}}

	$(document).ready(function(){  
	    $("#sea").click(function(){  
	    	var idElement = document.getElementById("it");
			var cata = idElement.options[idElement.selectedIndex].value;
			var namemodel=document.sea.namo.value;
			  window.location.href="store.jsp?ca="+cata+"&name="+namemodel;
	    });  
	});  	

	$(window).load(function(){  
		   this.name(); 
		    });   

			    
		var request200;  
		function subscribe()  
		{ 
			var ema  = document.subsc.email.value;
			var url="subscription?email="+ema;
		  
		if(window.XMLHttpRequest){  
		request200=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
		request200=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		  
		try{  
		request200.onreadystatechange=getInfo200;  
		request200.open("GET",url,true);  
		request200.send();  
		}catch(e){alert("Unable to connect to server");}  
		}  
		  
		function getInfo200(){  
		if(request200.readyState==4){  
		var val=request200.responseText;  
		if(val.indexOf("Subscribed")>-1){
			document.getElementById('sb').innerHTML=val;
		}
		else if(val.indexOf("Already subscribed")>-1){
			document.getElementById('sb').innerHTML=val;
			}else{alert("error!");}
		}}    
			    
		$(document).ready(function(){  
		    $(".newsletter-btn").click(function(){  
		       
		        $("#sb").fadeOut(7000); 
		      
		    });   
		    });     
	
</script>
    </head>
<body>
	<!-- HEADER -->
		<header>
			<!-- TOP HEADER -->
			<div id="top-header">
				<div class="container">
					<ul class="header-links pull-left">
						<li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
						<li><a href="#"><i class="fa fa-envelope-o"></i> email@email.com</a></li>
						<li><a href="#"><i class="fa fa-map-marker"></i> 1734 Stonecoal Road</a></li>
					</ul>
		<ul class="header-links pull-right">
		<li><a href="#"><span id="uname"></span></a></li>
						<li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>
						<li><a href="myAccount.jsp"><i class="fa fa-user-o"></i> My Account</a></li>
					</ul> 
				</div>
			</div>
			<!-- /TOP HEADER -->

			<!-- MAIN HEADER -->
			<div id="header">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<!-- LOGO -->
						<div class="col-md-3">
							<div class="header-logo">
								<a href="#" class="logo">
									<img src="./img/logo.png" alt="">
								</a>
							</div>
						</div>
						<!-- /LOGO -->

						<!-- SEARCH BAR -->
						<div class="col-md-6">
							<div class="header-search">
								<form name="sea">
									<select class="input-select" id="it">
										<option value="0">All Categories</option>
										<option value="Laptop">Laptops</option>
										<option value="Mobiless">Smartphones</option>
										<option value="Camera">Cameras</option>
										<option value="Accessories">Accessories</option>
									</select>
									<input class="input" placeholder="Search here...(Name/Model/Brand/Category)" value="" name="namo">
								
									<button type="button" class="search-btn" id="sea">Search</button>
								</form>
							</div>
						</div>
						<!-- /SEARCH BAR -->

						<!-- ACCOUNT -->
						<div class="col-md-3 clearfix">
							<div class="header-ctn">
								<!-- Wishlist -->
								<div class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" onclick="wisharea()">
										<i class="fa fa-heart-o"></i>
										<span>Your Wishlist</span>
										<div class="qty"><span id="whish"></span></div>
									</a>
							
										<div class="cart-dropdown">
										<span id="wishpage">
								</span>
										<div class="cart-summary">
											<small><span id="wish"></span> Item(s) selected</small>
											
										</div>
										<div class="cart-btns">
											<a href="viewwishlist.jsp">View Wishlist</a>
											<a href="#" onclick="wishtocart()">Add to Cart  <i class="fa fa-arrow-circle-right"></i></a>
										</div>
									</div>
								</div>
								<!-- /Wishlist -->

								<!-- Cart -->
								
								<div class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" onclick="cartarea()">
										<i class="fa fa-shopping-cart"></i>
										<span>Your Cart</span>
										<div class="qty"><span id="cart"></span></div>
									</a>
									
									<div class="cart-dropdown">
									<span id="cartpage">
										
										</span>
										<%String email=(String)session.getAttribute("email");
										 session.setMaxInactiveInterval(5*60);
										if(email!=null){%>
										<div class="cart-summary">
											<small><span id="cartin"></span> Item(s) selected</small>
											<h5>SUBTOTAL:  <span id="tbill"></span></h5>
										</div>
										<div class="cart-btns">
											<a href="viewcart.jsp">View Cart</a>
											<a href="checkout.jsp">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
										</div>
										<% }%>
										
									</div>
									
								</div>
								<!-- /Cart -->

								<!-- Menu Toogle -->
								<div class="menu-toggle">
									<a href="#">
										<i class="fa fa-bars"></i>
										<span>Menu</span>
									</a>
								</div>
								<!-- /Menu Toogle -->
							</div>
						</div>
						<!-- /ACCOUNT -->
					</div>
					<!-- row -->
				</div>
				<!-- container -->
			</div>
			<!-- /MAIN HEADER -->
		</header>
		<!-- /HEADER -->

		<!-- NAVIGATION -->
		<nav id="navigation">
			<!-- container -->
			<div class="container">
				<!-- responsive-nav -->
				<div id="responsive-nav">
					<!-- NAV -->
					<ul class="main-nav nav navbar-nav">
						<li class="active"><a href="#home">Orderlist</a></li>
						<li><a href="Home.jsp">Home</a></li>
					
					</ul>
					<!-- /NAV -->
				</div>
				<!-- /responsive-nav -->
			</div>
			<!-- /container -->
		</nav>
		<!-- /NAVIGATION -->

<!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						 <div class="tab-content">  
    <div id="home" class="tab-pane fade in active"> 
    <% String mail=(String)session.getAttribute("email");
    if(mail!=null){%> 
    
    <table border="1"> 
         <tr align="center"><th>ID</th><th>PRODUCTS</th><th>DATE</th><th>PRICE</th></tr>   
         <%
         int id=0;
         connection con= new connection();
         
      

 	
 	
    try
    {
        
    
        
    	PreparedStatement ps1=con.getPreparedstatement("select ordertable.products,ordertable.pdate,ordertable.price from ordertable inner join Login on Login.loid = ordertable.userloid where loemail=? order by oid DESC  ");
   	      ps1.setString(1, mail);
    	ResultSet rs=ps1.executeQuery();
        while(rs.next()){
      id++;
        String products=rs.getString(1);
        String date=rs.getString(2);
        Double price=rs.getDouble(3);
     
        %>  
    <tr><td><%out.print(id);%></td><td><%out.print(products);%></td><td><%out.print(date);%></td><td><%out.print(price); %></td></tr>  
   <%}}
         catch(Exception e){
	out.print(e);}%>
    </table>  
     <%}
    else{
    
    
    %>
    <p style="color:red">please login<p><%} %>
    
      </div>
      </div>
      </div>
      </div>
      	<!-- row -->
      </div>
      	<!-- container -->
      </div>
      <!-- BREADCRUMB -->





		<!-- NEWSLETTER -->
		<div id="newsletter" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<div class="newsletter">
							<p>Sign Up for the <strong>NEWSLETTER</strong></p>
							<form name = "subsc">
								<input class="input" type="email" name = "email" placeholder="Enter Your Email">
								<button type="button" class="newsletter-btn" onclick = "subscribe()"><i class="fa fa-envelope"></i> Subscribe</button><span id = "sb"></span>
							</form>
							<ul class="newsletter-follow">
								<li>
									<a href="#"><i class="fa fa-facebook"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-twitter"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-instagram"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-pinterest"></i></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /NEWSLETTER -->

		<!-- FOOTER -->
		<footer id="footer">
			<!-- top footer -->
			<div class="section">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">About Us</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
								<ul class="footer-links">
									<li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
									<li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
									<li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Categories</h3>
								<ul class="footer-links">
									<li><a href="hotdeals.jsp">Hot deals</a></li>
									<li><a href="laptop.jsp">Laptops</a></li>
									<li><a href="mobile.jsp">Smartphones</a></li>
									<li><a href="camera.jsp">Cameras</a></li>
									<li><a href="Accessories.jsp">Accessories</a></li>
								</ul>
							</div>
						</div>

						<div class="clearfix visible-xs"></div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Information</h3>
								<ul class="footer-links">
									<li><a href="#">About Us</a></li>
									<li><a href="#">Contact Us</a></li>
									<li><a href="#">Privacy Policy</a></li>
									<li><a href="#">Orders and Returns</a></li>
									<li><a href="#">Terms & Conditions</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Service</h3>
								<ul class="footer-links">
									<li><a href="myAccount.jsp">My Account</a></li>
									<li><a href="viewcart.jsp">View Cart</a></li>
									<li><a href="viewwishlist.jsp">Wishlist</a></li>
									<li><a href="customerorder.jsp">My Ordres</a></li>
								
									<li><a href="#">Help</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /top footer -->

			<!-- bottom footer -->
			<div id="bottom-footer" class="section">
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-md-12 text-center">
							<ul class="footer-payments">
								<li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
								<li><a href="#"><i class="fa fa-credit-card"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
							</ul>
							<span class="copyright">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</span>
						</div>
					</div>
						<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /bottom footer -->
		</footer>
		<!-- /FOOTER -->

		<!-- jQuery Plugins -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="js/main.js"></script>
</body>
</html>
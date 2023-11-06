<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*"%>
       <%@ page import="pass.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product details</title>
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
<script>
var x;
$(document).ready(function(){
	  $("#quty1").change(function(){
		x = $(this).val();
		
	  });
	});

var request21;  
function img(id)  
{  
	var sid=id;
var url="cart?id="+sid+"&qut="+x;
  
if(window.XMLHttpRequest){  
request21=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request21=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request21.onreadystatechange=getInfo66;
request21.onreadystatechange=cartint; 
request21.open("GET",url,true);  
request21.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo66(){  
if(request21.readyState==4){  
var val=request21.responseText;  
if(val.indexOf("login")>-1){
	alert("please login");
}
	
}}

</script>
		<script>
		
var request12;  
function wishl(id) 
{  
	var sid=id;
	
var url="wishlist?id="+sid;
  
if(window.XMLHttpRequest){  
request12=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request12=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request12.onreadystatechange=getInfo12;  
request12.open("GET",url,true);  
request12.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo12(){  
if(request12.readyState==4){  
var val=request12.responseText;  

	
}}

$(window).load(function(){  
	   this.name(); 
	    });   
	   
	var request13;  
	function name()  
	{  
		var url="username";
	  
	if(window.XMLHttpRequest){  
	request13=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
	request13=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	  
	try{  
	request13.onreadystatechange=getInfo13;  
	request13.open("GET",url,true);  
	request13.send();  
	}catch(e){alert("Unable to connect to server");}  
	}  
	  
	function getInfo13(){  
	if(request13.readyState==4){  
	var val=request13.responseText;  
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
	var request14;  

	var request14;  
	function cartint()  
	{  
		var url="cartnumber";
	  
	if(window.XMLHttpRequest){  
	request14=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
	request14=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	  
	try{  
	request14.onreadystatechange=getInfo14;  
	request14.open("GET",url,true);  
	request14.send();  
	}catch(e){alert("Unable to connect to server");}  
	}  
	  
	function getInfo14(){  
	if(request14.readyState==4){  
	var val=request14.responseText;  

		document.getElementById('cart').innerHTML=val;
		document.getElementById('cartin').innerHTML=val;
	}}
	var request15;  
	function cartarea()  
	{  
		total();
		var url="cartclick.jsp";
	  
	if(window.XMLHttpRequest){  
	request15=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
	request15=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	  
	try{  
	request15.onreadystatechange=getInfo15;  
	request15.open("GET",url,true);  
	request15.send();  
	}catch(e){alert("Unable to connect to server");}  
	}  
	  
	function getInfo15(){  
	if(request15.readyState==4){  
	var val=request15.responseText;  

		document.getElementById('cartpage').innerHTML=val;
	}}
	var request16;  
	function total()  
	{  
		
		var url="carttotalprice.jsp";
	  
	if(window.XMLHttpRequest){  
	request16=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
	request16=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	  
	try{  
	request16.onreadystatechange=getInfo16;  
	request16.open("GET",url,true);  
	request16.send();  
	}catch(e){alert("Unable to connect to server");}  
	}  
	  
	function getInfo16(){  
	if(request16.readyState==4){  
	var val=request16.responseText;  

		document.getElementById('tbill').innerHTML=val;
	}}
	$(window).load(function(){  
		   this.wishint(); 
		    }); 


	var request17;  
	function wishint()  
	{  
		var url="wishnumber";

	if(window.XMLHttpRequest){  
	request17=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
	request17=new ActiveXObject("Microsoft.XMLHTTP");  
	}  

	try{  
	request17.onreadystatechange=getInfo17;  
	request17.open("GET",url,true);  
	request17.send();  
	}catch(e){alert("Unable to connect to server");}  
	}  

	function getInfo17(){  
	if(request17.readyState==4){  
	var val=request17.responseText;  

		document.getElementById('whish').innerHTML=val;
		document.getElementById('wish').innerHTML=val;
	}}
	var request18;  
	function wisharea()  
	{  
		total();
		var url="wishclick.jsp";
	  
	if(window.XMLHttpRequest){  
	request18=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
	request18=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	  
	try{  
	request18.onreadystatechange=getInfo18;  
	request18.open("GET",url,true);  
	request18.send();  
	}catch(e){alert("Unable to connect to server");}  
	}  
	  
	function getInfo18(){  
	if(request18.readyState==4){  
	var val=request18.responseText;  

		document.getElementById('wishpage').innerHTML=val;
	}}
	var request19;  
	function wishtocart()  
	{  
		var url="wishtocart";
	  
	if(window.XMLHttpRequest){  
	request19=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
	request19=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	  
	try{  
	request19.onreadystatechange=getInfo19  

	request19.open("GET",url,true);  
	request19.send();  
	}catch(e){alert("Unable to connect to server");}  
	}  
	  
	function getInfo19(){  
	if(request19.readyState==4){  
	var val=request19.responseText;  
	if(val.indexOf("up")>-1){
		window.location.href="Home.jsp"
	}
	else{
		alert("Error");}
	}}
	$(window).load(function(){  
		   this.name(); 
		    });   
		   
		var request20;  
		function laptop1()  
		{  
			var url="laptop.jsp";
		  
		if(window.XMLHttpRequest){  
		request20=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
		request20=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		  
		try{  
		request20.onreadystatechange=getInfo20;  
		request20.open("GET",url,true);  
		request20.send();  
		}catch(e){alert("Unable to connect to server");}  
		}  
		  
		function getInfo20(){  
		if(request20.readyState==4){  
		var val=request20.responseText;  
		
			document.getElementById('lap').innerHTML=val;
		}}
		
		var request22;  
		function wishl(id) 
		{  
			var sid=id;
			
		var url="wishlist?id="+sid;
		  this.wishint();
		if(window.XMLHttpRequest){  
		request22=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
		request22=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		  
		try{  
		request22.onreadystatechange=getInfo22;  
		request22.onreadystatechange=wishint;
		request22.open("GET",url,true);  
		request22.send();  
		}catch(e){alert("Unable to connect to server");}  
		}  
		  
		function getInfo22(){  
		if(request22.readyState==4){ 
	    var val=request22.responseText;  
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
								<%String email4=(String)session.getAttribute("email");
										 session.setMaxInactiveInterval(5*60);
										if(email4!=null){%>
										<div class="cart-summary">
											<small><span id="wish"></span> Item(s) selected</small>
											
										</div>
										<div class="cart-btns">
											<a href="viewwishlist.jsp">View Wishlist</a>
											<a href="#" onclick="wishtocart()">Add to Cart  <i class="fa fa-arrow-circle-right"></i></a>
										</div>
										<%} %>
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
										if(email!=null){%>
										<div class="cart-summary">
											<small><span id="cartin"></span> Item(s) selected</small>
											<h5>SUBTOTAL:  <span id="tbill"></span></h5>
										</div>
										<div class="cart-btns">
											<a href="viewcart.jsp">View Cart</a>
											<a href="checkout.jsp">Buy Now   <i class="fa fa-arrow-circle-right"></i></a>
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



	<% 
	String pid = request.getParameter("id");
int id=Integer.parseInt(pid);
	ResultSet rs1 = null;
	String proname,procat,prodetail;
	int procnt,proprice,disprice;
	connection con= new connection();
	try{
 
  PreparedStatement ps1=con.getPreparedstatement("select proname,procategory,procount,proprice,discountprice,prodescription from producttable where proid =?");				
 
  ps1.setInt(1, id);
  rs1 = ps1.executeQuery();
  while(rs1.next()) {	
	  proname = rs1.getString(1);
	  procat = rs1.getString(2);
	  procnt = rs1.getInt(3);
	  proprice = rs1.getInt(4);
	  disprice = rs1.getInt(5);
	  prodetail = rs1.getString(6);

	%>

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- Product main img -->
					<div class="col-md-5 col-md-push-2">
						<div id="product-main-img">
							<div class="product-preview">
								<img src="imageview?id=<%=id%>" alt="">
							</div>

							<div class="product-preview">
								<img src="imagefetch?id=<%=id%>" alt="">
							</div>


							<div class="product-preview">
								<img src="image3?id=<%=id%>" alt="">
							</div>
							
						</div>
					</div>
					<!-- /Product main img -->

					<!-- Product thumb imgs -->
					<div class="col-md-2  col-md-pull-5">
						<div id="product-imgs">
							<div class="product-preview">
								<img src="imageview?id=<%=id%>" alt="">
							</div>

							<div class="product-preview">
								<img src="imagefetch?id=<%=id%>" alt="">
							</div>
                            <div class="product-preview">
								<img src="image3?id=<%=id%>" alt="">
							</div>
						</div>
					</div>
					<!-- /Product thumb imgs -->

					<!-- Product details -->
					<div class="col-md-5">
						<div class="product-details">
							<h2 class="product-name"><%=proname%></h2>
						
							<div>
								<h3 class="product-price">$<%=proprice%> <del class="product-old-price">$<%=proprice%> </del></h3>
								<span class="product-available"><% if(procnt>0){%>In Stock<%}else{ %>Out of Stock <%} %></span>
							</div>
							<p><%=prodetail%> </p>
							<div class="add-to-cart">
								<div class="qty-label">
									Qty
									<form name="quty">
									<div class="input-number">
										<input type="number" id="quty1"name = "qty" value =1>
										<span class="qty-up">+</span>
										<span class="qty-down">-</span>
									</div>
									</form>
								</div>
								<button class="add-to-cart-btn" onclick="img(<%=id%>)"><i class="fa fa-shopping-cart"></i> add to cart</button>
							</div>

							<ul class="product-btns">
								<li><a href="#" onclick="wishl(<%=id%>)"><i class="fa fa-heart-o" onclick="wishl(<%=id%>)"></i> add to wishlist</a></li>
							</ul>

							<ul class="product-links">
								<li>Category:</li>
								<li><a href="#"><%=procat%></a></li>
							</ul><br><br>
							<div class="add-to-cart">
<button class="add-to-cart-btn" onclick="window.location.href='Home.jsp'">Back to Home Page</button>
							</div>	
						</div>
					</div>
					<!-- /Product details -->

					<!-- Product tab -->
					<div class="col-md-12">
						<div id="product-tab">
							<!-- product tab nav -->
							<ul class="tab-nav">
								<li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
							</ul>
							<!-- /product tab nav -->

							<!-- product tab content -->
							<div class="tab-content">
								<!-- tab1  -->
								<div id="tab1" class="tab-pane fade in active">
									<div class="row">
										<div class="col-md-12">
											<p><%=prodetail%></p>
										</div>
									</div>
								</div>
								<!-- /tab1  -->

							</div>
							<!-- /product tab content  -->
						</div>
					</div>
					<!-- /product tab -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
<% 			
  }}catch(Exception e){out.print(e);}     %>
	

		<!-- NEWSLETTER -->
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
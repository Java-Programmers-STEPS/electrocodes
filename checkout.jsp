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

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script> 
<style>
.cartlist1{
margin-left:10px;}
</style>
<% 


if(session.getAttribute("email")==null){
out.println("Please login first");
	response.sendRedirect("myAccount.jsp");
}
%>

<script>
$(document).ready(function(){  
	
    $("#payment-2").click(function(){ 
    	exx();
    	acno();
    	
    });  
});
    	var request1;
    	function exx() {
    	var url="shipping.jsp";
    
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
    	
    		document.getElementById('ship').innerHTML=val;
    	}
    	}
   

var request50;  
function acno()  
{  
	
	var url="acno.jsp";
  
if(window.XMLHttpRequest){  
request50=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request50=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request50.onreadystatechange=getInfo50;  
request50.open("GET",url,true);  
request50.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo50(){  
if(request50.readyState==4){  
var val=request50.responseText;  
document.getElementById('acccno').innerHTML=val;

}}

var request2;  
function shipadd()  
{  
	
	var fname=document.cart.firstname.value;
	var lname=document.cart.lastname.value;
	var email=document.cart.email.value;
	var address=document.cart.address.value;
	var city=document.cart.city.value;
	var country=document.cart.country.value;
	var phone=document.cart.tel.value;
	var state=document.cart.state.value;
	var zip=document.cart.zip.value;
	var url="shipaddress?fname="+fname+"&email="+email+"&address="+address+"&city="+city+"&country="+country+"&zip="+zip+"&phone="+phone+"&lname="+lname+"&state="+state;
  
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

}}



$(window).load(function(){  
	   this.excard(); 
	    });   
$("#payment-1").click(function(){  
	   this.excard(); 
	   this.shipvalidate();
	    });   
	    
var request5;  
function excard()  
{  

	var url="newcard.jsp";
  
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
document.getElementById('ship').innerHTML=val;

}}
 

$(document).ready(function(){  
	var request6;
    $("#payment-1").click(function(){  
    	var url="newcard.jsp";
    	  
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
    
    	  
    	function getInfo6(){  
    	if(request6.readyState==4){  
    	var val=request6.responseText;  
    	document.getElementById('ship').innerHTML=val;

    	}
    	}
    });  
});
var request7;  
function shipupdate()  
{  
	var fname=document.cart.firstname.value;
	var lname=document.cart.lastname.value;
	var email=document.cart.email.value;
	var address=document.cart.address.value;
	var city=document.cart.city.value;
	var country=document.cart.country.value;
	var phone=document.cart.tel.value;
	var zip=document.cart.zip.value;
	var state=document.cart.state.value;
	var url="updateshipadd?fname="+fname+"&email="+email+"&address="+address+"&city="+city+"&country="+country+"&zip="+zip+"&phone="+phone+"&lname="+lname+"&state="+state;
  
if(window.XMLHttpRequest){  
request7=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request7=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request7.onreadystatechange=getInfo7;  
request7.open("GET",url,true);  
request7.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo7(){  
if(request7.readyState==4){  
var val=request7.responseText;  

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
		window.location.href="checkout.jsp"
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
		var request21;  
		function img(id)  
		{  
			var sid=id;
		var url="cart?id="+sid;
		  
		if(window.XMLHttpRequest){  
		request21=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
		request21=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		  
		try{  
		request21.onreadystatechange=getInfo21;
		request21.onreadystatechange=cartint; 
		request21.open("GET",url,true);  
		request21.send();  
		}catch(e){alert("Unable to connect to server");}  
		}  
		  
		function getInfo21(){  
		if(request21.readyState==4){  
		var val=request21.responseText;  
		if(val.indexOf("login")>-1){
			alert("please login");
		}
			
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
		function pay(total){

				var to=total;
		
				var radio=document.acc.payment.value;
		    	
				if(radio=="new"){
					
			    	var fname=document.cart.fname.value;
			    	var lname=document.cart.lname.value;
			    	var email=document.cart.mail.value;
			    	var address=document.cart.add.value;
			    	var city=document.cart.cty.value;
			    	var country=document.cart.coutry.value;
			    	var phone=document.cart.ph.value;
			    	var zip=document.cart.z.value;
			    	var state=document.cart.sta.value;
			    	var exdate=document.acc.expdate.value;
			    	var cvv=document.acc.cvv.value;
			    	var acno=document.acc.cardnumber.value;
			    	
		    	window.location.href="payment?fname="+fname+"&email="+email+"&address="+address+"&city="+city+"&country="+country+"&zip="+zip+"&phone="+phone+"&lname="+lname+"&state="+state+"&acno="+acno+"&cvv="+cvv+"&expdate="+exdate+"&total="+to;
		    }
		    	else{
		    		
		    		
		    		var to=total;
		    		var acno=document.acc.accno.value;
		    		window.location.href="excard?total="+to+"&acno="+acno;
		    	}}
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
	
	 function shipvalidate(){
		var fname=document.cart.firstname.value;
    	var lname=document.cart.lastname.value;
    	var email=document.cart.email.value;
    	var address=document.cart.address.value;
    	var city=document.cart.city.value;
    	var country=document.cart.country.value;
    	var phone=document.cart.tel.value;
    	var zip=document.cart.zip.value;
    	var state=document.cart.state.value;
    	
    
    	
		 
	if(fname.length>0){
		if( lname.length>0){
		if(email.length>0){ 
			if(address.length>0){ 	
				if(city.length>0){	
					if(country.length>0){
					if(phone.length>0){	
						if(zip.length>0){
							if(state.length>0){
		
				this.shipadd();
							}else{alert("state can't be blank");}
							}else{alert("zip can't be blank");}
					}else{alert("phone can't be blank");}
					}else{alert("country can't be blank");}
				  }else{alert("city can't be blank");}
				}else{alert("address can't be blank");}
			 }else{alert("email can't be blank");}
		 }else{alert("lastname can't be blank");}
	   }else{alert("firstname can't be blank ");}
	}   
	 
	 
	 function shipupdatevalidate(){
			var fname=document.cart.firstname.value;
	    	var lname=document.cart.lastname.value;
	    	var email=document.cart.email.value;
	    	var address=document.cart.address.value;
	    	var city=document.cart.city.value;
	    	var country=document.cart.country.value;
	    	var phone=document.cart.tel.value;
	    	var zip=document.cart.zip.value;
	    	var state=document.cart.state.value;
	    	
	    
	    	
			 
		if(fname.length>0){
			if( lname.length>0){
			if(email.length>0){ 
				if(address.length>0){ 	
					if(city.length>0){	
						if(country.length>0){
						if(phone.length>0){	
							if(zip.length>0){
								if(state.length>0){
			
					this.shipupdate();
								}else{alert("state can't be blank");}
								}else{alert("zip can't be blank");}
						}else{alert("phone can't be blank");}
						}else{alert("country can't be blank");}
					  }else{alert("city can't be blank");}
					}else{alert("address can't be blank");}
				 }else{alert("email can't be blank");}
			 }else{alert("lastname can't be blank");}
		   }else{alert("firstname can't be blank ");}
		}   
		
</script>
</head>
<body>
<!-- HEADER -->
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
										<%String email4=(String)session.getAttribute("email");
										 session.setMaxInactiveInterval(5*60);
										if(email4!=null){%>
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
										<%String email1=(String)session.getAttribute("email"); 
										 session.setMaxInactiveInterval(5*60);
										if(email1!=null){%>
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

		<!-- NAVIGATION -->
		<nav id="navigation">
			<!-- container -->
			<div class="container">
				<!-- responsive-nav -->
				<div id="responsive-nav">
					<!-- NAV -->
					<ul class="main-nav nav navbar-nav">
						<li ><a href="Home.jsp">Home</a></li>
						<li><a href="hotdeals.jsp">Hot Deals</a></li>
						<li><a href="laptop.jsp">Laptops</a></li>
						<li><a href="mobile.jsp">Smartphones</a></li>
						<li><a href="camera.jsp">Cameras</a></li>
						<li><a href="Accessories.jsp">Accessories</a></li>
						<li class="active"><a href="checkout.jsp">Checkout</a></li>
						<% int usert = 0;
				String em =null;
				connection con= new connection();
				 em = (String)session.getAttribute("email") ;
				if(em!=null){
				try{
					
				PreparedStatement str=con.getPreparedstatement("select lousertype from Login where loemail=?");
				str.setString(1,em);
				ResultSet rst=str.executeQuery();
				while(rst.next()){
					usert=rst.getInt(1);
					
				}
					}
				catch(Exception e){
					out.print(e);
				}
				if(usert == 1){
			
				%>
						<li><a href="admin.jsp">Admin page</a></li>
						<%}} %>
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
						<h3 class="breadcrumb-header">Checkout</h3>
						<ul class="breadcrumb-tree">
							<li><a href="index.html">Home</a></li>
							<li class="active">Checkout</li>
						</ul>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /BREADCRUMB -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
				

					<div class="col-md-7">
					<span id="ship">
						<!-- Billing Details -->
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title">Billing address</h3>
							</div>
							<div class="form-group">
								<input class="input" type="text" name="first-name" placeholder="Name">
							</div>
							<div class="form-group">
								<input class="input" type="email" name="email" placeholder="Email">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="address" placeholder="Address">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="city" placeholder="City">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="country" placeholder="Country">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="zip-code" placeholder="ZIP Code">
							</div>
							<div class="form-group">
								<input class="input" type="tel" name="tel" placeholder="Phone Number">
							</div>
							<div class="form-group">
								<div class="input-checkbox">
									<input type="checkbox" id="create-account">
									<label for="create-account">
										<span></span>
										Create Account?
									</label>
									<div class="caption">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</p>
										<input class="input" type="password" name="password" placeholder="Enter Your Password">
									</div>
								</div>
							</div>
						</div>
						<!-- /Billing Details -->

						<!-- Shiping Details -->
						<div class="shiping-details">
							<div class="section-title">
								<h3 class="title">Shiping address</h3>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="shiping-address">
								<label for="shiping-address">
									<span></span>
									Ship to a diffrent address?
								</label>
								<div class="caption">
									<div class="form-group">
										<input class="input" type="text" name="first-name" placeholder="Name">
									</div>
									
									<div class="form-group">
										<input class="input" type="email" name="email" placeholder="Email">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="address" placeholder="Address">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="city" placeholder="City">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="country" placeholder="Country">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="zip-code" placeholder="ZIP Code">
									</div>
									<div class="form-group">
										<input class="input" type="tel" name="tel" placeholder="Phone number">
									</div>
								</div>
							</div>
						</div>
						</span>
						<!-- /Shiping Details -->

						<!-- Order notes -->
						
						<!-- /Order notes -->
					</div>

					<!-- Order Details -->
					
					<div class="col-md-5 order-details">
						<div class="section-title text-center">
							<h3 class="title">Your Order</h3>
						</div>
						<div class="order-summary">
							<div class="order-col">
								<div><strong>PRODUCT</strong></div>
								<div><strong>TOTAL</strong></div>
							</div>
							<div class="order-products">
										<%String email=(String)session.getAttribute("email"); 
int loid=0;
									
										
if(email!=null){
	int price=0;
	int disprice=0;
	int pricetotal=0;
	int dispricetotal=0;
	String name=null;
	int quty=0;
	int pr=0;
		 try{
			 	
				
				PreparedStatement ps1=con.getPreparedstatement("select loid from Login where loemail =?");	 
				 ps1.setString(1, email);
				 ResultSet rs=ps1.executeQuery();  	
				 while(rs.next()) {
						loid = rs.getInt(1);
				 
				 }
				
				
				PreparedStatement ps2=con.getPreparedstatement("select producttable.proprice,producttable.proname,producttable.discountprice,carttable.cproqut from carttable inner join producttable on carttable.cproid=producttable.proid inner join Login on carttable.cuseremail=  Login.loid WHERE Login.loid=? GROUP BY cid order by cid  ");	 
	 ps2.setInt(1, loid);
	 ResultSet rs1=ps2.executeQuery();  	
	 while(rs1.next()) {price = rs1.getInt(1);
	 name=rs1.getString(2);
	   disprice = rs1.getInt(3);
	   quty=rs1.getInt(4);
	   System.out.println(quty);
	   price=price*quty;
	   disprice=disprice*quty;
		if(disprice!=0){price=0;}
		pricetotal=pricetotal+price;
		dispricetotal=dispricetotal+disprice;
	 if(disprice==0){
		 pr=price;
	 }
	 else{pr=disprice;}
		%><div class="order-col">
									<div><%=quty%>x <%=name %></div>
									<div>₹<%=pr %></div>
								</div><% } 

	 	
	 } catch(Exception e){
			 out.print(e);
		 }
		 int total=pricetotal+dispricetotal;
	%>
							
								
							</div>
							<div class="order-col">
								<div>Shiping</div>
								<div><strong>FREE</strong></div>
							</div>
							<div class="order-col">
								<div><strong>TOTAL</strong></div>
								<div><strong class="order-total">₹<%=total %></strong></div>
							</div>
						</div>
					
						<div class="payment-method">
							<form name="acc">
							<div class="input-radio">
								<input type="radio" name="payment" id="payment-1" value="new" checked>
								<label for="payment-1">
									<span></span>
									New Credit/Debit Card
								</label>
								<div class="caption">
								
									<p>Credit/Debit Card Number * :<br><input type="text" name="cardnumber"><br>
									Expiry Date * :<br><input type="text" name="expdate"><br>
									Name * :<br><input type="text" name="name"><br>
									CVV code * :<br><input type="text" name="cvv"></p>
									
								</div>
								
							</div>
							<div class="input-radio">
								<input type="radio" name="payment" id="payment-2" value="ex">
								<label for="payment-2">
									<span></span>
									Existing Credit/Debit Card
								</label>
								<div class="caption">
									<span id="acccno">Acc no  :</span><br>
									CVV code * :<input type="text" name="ecvv"></p>
								</div>
							
							</div>
								</form>
						<div class="input-checkbox">
							<input type="checkbox" id="terms">
							<label for="terms">
								<span></span>
								I've read and accept the <a href="#">terms & conditions</a>
							</label>
						</div>
						<a href="#" class="primary-btn order-submit" onclick="pay(<%=total%>)">Place order</a>
					</div><%}
else{
out.print("please login");};%>
					<!-- /Order Details -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

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
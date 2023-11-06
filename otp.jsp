<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Insert title here</title>
<style>
#a1{
background-color: white ;
border-style:solid;
border-width:1px;
border-color:black;
margin-left:470px;
margin-top:200px;
width:260px;
height:250px;
padding-bottom:10px;
}
.p1{
color:red;
margin-left:100px;
margin-left:80px
padding-top:100px;
padding-bottom:1px;}
.p2{
padding-top:5px;
padding-bottom:1px;}
.p3{
padding-top:10px;
padding-left:60px;
padding-bottom:5px;}
.cart-btns{
padding-left:50px;}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>


var request1; 
var emai;
var phone;
function check()  
{  
	phone=document.ot.phno.value; 
	emai=document.ot.email1.value; 
	
	var url="otpsendtophone?phone="+phone+"&email="+emai;
  
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
if(val.indexOf("otp")>-1){
	window.location.href = "otptimer.jsp?email="+emai+"&phone="+phone;	
}
else {

	alert("invalid phone number!");
} 
}  
} 

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
						
						<!-- /SEARCH BAR -->

						<!-- ACCOUNT -->
						
						<!-- /ACCOUNT -->
					</div>
					<!-- row -->
				</div>
				<!-- container -->
			</div>
			<!-- /MAIN HEADER -->
		</header>
		<!-- /HEADER -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						 <div class="tab-content">  
		 <div class="container" id="a1">
		 <br><br>
		<%String email=request.getParameter("email"); %>
		 <p class="p1">OTP</p>
		 <p class="p3">Enter your Phone</p>
		 <form name="ot">
		 <P class="p2">Phone:<input type="text" name="phno" value=""><p>
		 <input type="hidden"  name="email1" value="<%=email %>">
		
		 </form> <span  id="timer"></span>
		 <div class= "st">
<div class="product-details">
<div class="cart-btns">
<div class="add-to-cart">
<button class="add-to-cart-btn" onclick="check()"> SEND<i class="fa fa-arrow-circle-right"></i></button>
</div>	

		 </div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		
		
		
</body>

</html>
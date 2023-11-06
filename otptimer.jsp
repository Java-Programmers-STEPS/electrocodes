<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enter OTP</title>
<script type="text/javascript" src="js\jquery-3.4.1.js"></script>
<script type="text/javascript" src="js\materialize.js"></script>
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css\materialize.css" />
<!-- Main css have custom styles for webpages -->
<link rel="stylesheet" type="text/css" href="css\main.css" />
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
margin-left:40px;
margin-left:60px
padding-top:80px;
padding-bottom:1px;}
.p2{
padding-top:20px;
padding-bottom:1px;}
.p3{
padding-top:10px;
padding-left:80px;
padding-bottom:5px;}
.cart-btns{
padding-left:50px;}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>


let timerOn = true;

function timer(remaining) {
  var m = Math.floor(remaining / 60);
  var s = remaining % 60;
  
  m = m < 10 ? '0' + m : m;
  s = s < 10 ? '0' + s : s;
  document.getElementById('timer').innerHTML = m + ':' + s;
  remaining -= 1;
  
  if(remaining >= 0 && timerOn) {
    setTimeout(function() {
        timer(remaining);
    }, 1000);
    return;
  }

  if(!timerOn) {
    // Do validate stuff here
    return;
  }
  
  // Do timeout stuff here
  document.getElementById("p1").style.display='none'; 
  document.getElementById("p2").style.display='none'; 
  document.getElementById("btn1").style.display='none'; 
  document.getElementById("otp").style.display='none'; 
	emai=document.ot.email1.value; 
  document.getElementById('timer').innerHTML = "Session Expired... <a href='otp.jsp'>Resend OTP</a> ";
}
var request1; 
var emai;
var phone;
function check()  
{  
	var otp=document.ot.otp.value; 
	emai=document.ot.email1.value; 
	phone=document.ot.email2.value;
	
	var url="otpval?otp="+otp+"&email="+emai+"&phone="+phone;
  
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
	window.location.href = "myAccount.jsp";	
}
else {

	alert("invalid OTP!");
} 
}  
} 
</script>
</head>
<body onload="timer(60)">

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
<div class="row"> </div>

<div class="container">
 <div class="card-panel col s7 s5">
		<p><h4>Verify your number</h4>
			<div class="row">
				<div class="col l6 ">

	 <form name="ot">
	<%String email=request.getParameter("email"); 
	System.out.println("email"+email);
	String phone=request.getParameter("phone");
	%>
		 <p class="p1" id="p1">OTP
		 Enter your OTP</p>
	
		 <P class="p2" id="p2">OTP:</P><input type="text" name="otp" id="otp" value="">
 		<input type="hidden"  name="email1" value="<%=email %>"><br>
 		<input type="hidden"  name="email2" value="<%=phone %>"><br>
		<strong><span id="timer"></span></strong>
		
		 </form> 

<div class="product-details">
<div class="cart-btns">
<div class="add-to-cart">


	<button class="add-to-cart-btn" id="btn1" onclick="check()"> Check<i class="fa fa-arrow-circle-right"></i></button>


</div>	

		 </div>
		</div>



		</div>
					</div>
				</div>
				</div>
				</div></div></div></div></div></div>
</body>
</html>
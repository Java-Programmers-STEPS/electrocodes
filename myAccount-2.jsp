<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
#c1{
background-color: white ;
border-style:solid;
border-width:1px;
border-color:black;
margin-left:450px;
margin-top:10px;
width:330px;
height:550px;
padding-bottom:10px;
}
#c6{
background-color: white ;
border-style:solid;
border-width:1px;
border-color:black;
margin-left:450px;
margin-top:10px;
width:300px;
height:340px;
padding-bottom:10px;
}
p{
padding-top:20px;
margin-bottom:10px;
padding-left:26px;
}
.p1{
color:red;
margin-left:35px;
margin-left:40px
padding-top:20px;
padding-bottom:5px;}
.p2{
padding-left:85px;

}
.l1{
color:red;
margin-left:80px;

padding-top:20px;
padding-bottom:5px;}
.l2{
padding-left:85px;


}
.l3{
color:red;
margin-left:70px;

padding-top:20px;
padding-bottom:5px;}
.l4{
padding-left:50px;

}
.l5 {
  background-color: red;
  color:white;
  border:none;}
#dd{
color:red;}
.add{
dispay:inline;}
#c2{
background-color: white ;
border-style:solid;
border-width:1px;
border-color:black;
margin-left:450px;
margin-top:10px;
width:300px;
height:280px;
padding-bottom:10px;
}
#c3{
background-color: white ;
border-style:solid;
border-width:1px;
border-color:black;
margin-left:450px;
margin-top:10px;
width:300px;
height:200px;
padding-bottom:10px;
}
#a{
margin-left:240px;
display:inline;}
#b{
margin-left:40px;
display:inline;}
#dd{
color:red;}
#ddd{
color:red;}</style>
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
<script src="jquery-3.3.1.min.js"></script>
 
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script>
        function get_action() 
        {
            var v = grecaptcha.getResponse();
            alert(v)
            if(v.length == 0)
            {
                document.getElementById('captcha').innerHTML="You can't leave Captcha Code empty";
                return false;
            }
            else
            {
            	  document.getElementById('captcha').innerHTML="";
                return true;
            }
        }
        </script> 
<script>
function pass(){  

	var password=document.re.pa.value;  
if(password.length<6){  
	document.getElementById("aa").innerHTML=  " Password must be at least 6 char long";  

  }
else{  
	document.getElementById("aa").innerHTML=" password strength is good";  
	
	} 
	}

function namech(){  
	
	var name=document.re.name.value;  
	var status=false;  
if(name.length<1){  
	document.getElementById("na").innerHTML=  " Please enter your name";  
	status=false;
	alert("name not entered!"); 
	}
	else{  
	document.getElementById("na").innerHTML=" success";  
	status=true;  
	} 
return status;  
} 
function matchpa(){ 
	var firstpassword=document.re.pa.value;  
	var secondpassword=document.re.cpassword.value;  
	  
	if(firstpassword==secondpassword){  
		document.getElementById("bb").innerHTML=  " Password  matching"; 

	return true;  
	}  
	else{  
	alert("password must be same!");  
	return false;  }
	}
	

	var pv=0;
var request;  
function sendInfo()  
{  
var v=document.re.email.value;  

var url="valid.jsp?val="+v;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try  
{  
request.onreadystatechange=getInfo1;  
request.open("GET",url,true);  
request.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}  
}  
  
function getInfo1(){  
if(request.readyState==4){  
var val=request.responseText;  
if(val.indexOf("Unavailable!")>-1)
	{pv=1;}else{pv=0;}
document.getElementById('emailloc').innerHTML=val;

}  
}  


$(document).ready(function(){  
    $("#mn").blur(function(){  
       
        $("#emailloc").fadeOut(3000); 
      
    });   
    }); 
$(document).ready(function(){  
    $("#ps").blur(function(){  
       
        $("#aa").fadeOut(3000); 
      
    });  
});

var request1;  
function insert()  
{  
	
	if(get_action() ){
	
	var name=document.re.name.value;
	var email=document.re.email.value; 
	var phoneno=document.re.phoneno.value;
	var password=document.re.pa.value; 
	var url="userregistration?name="+name+"&email="+email+"&phoneno="+phoneno+"&password="+password;
  
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
if(val.indexOf("user")>-1){
	document.getElementById('ddd').innerHTML=val;	
	window.location.href = "myAccount.jsp";
}
else if(val.indexOf("home")>-1){
	document.getElementById('dd').innerHTML=val;
}

}  
}  
}
  
var request3;  
function login()  
{  
   var email=document.lo.email.value; 
	var password=document.lo.password.value; 
	var url="lo?email="+email+"&password="+password;
  
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
if(val.indexOf("incorrect email or password!")>-1){
	document.getElementById('ddd').innerHTML=val;	
}
else if(val.indexOf("home")>-1){
	window.location.href = "Home.jsp";
}
else if(val.indexOf("admin")>-1){
	 window.location.href = "admin.jsp";

}
}  
}
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
	}
	}

	}
	
	function compareall(){ 
		 var password=document.re.pa.value;  
		 var name=document.re.name.value;  
		 var firstpassword=document.re.pa.value;  
		 var secondpassword=document.re.cpassword.value; 
		 var phoneno=document.re.phoneno.value; 
		
	if(password.length>6){
		if(firstpassword==secondpassword){ 
			if(name.length>1){ 	
				if(pv==0){	
					if(phoneno.length==10){ 	
						
				this.insert();
					
					 }else{alert("Phone number should have 10 digits");}
				 }else{alert("email unavailable");}
				}else{alert("name not entered");}
			}else{alert("password not matching");}
	    }else{alert("poor password strength, please reenter your password");}
	}
	

	
	var eml
	function emailcheck(){ 
		 var x=document.re.email.value;   
			var atposition=x.indexOf("@");  
			var dotposition=x.lastIndexOf(".");  
			if (atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length){  
			  alert("Please enter a valid e-mail address with " +atposition+ ":'@' position" +dotposition+ ":'.' position");  
			   eml==1;
			  return false;
			  }  
			  else{
				eml==0;
				  this.sendInfo();
				  }
			  
	}  
	/*var request9;  
	function mobilevd()  
	{  
	   var ph=document.re.phoneno.value; 
	 
		var url="mobilevalid?phoneno="+ph;
	  
	if(window.XMLHttpRequest){  
		request9=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
		request9=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	  
	try{  
		request9.onreadystatechange=getInfo9;  
		request9.open("GET",url,true);  
		request9.send();  
	}catch(e){alert("Unable to connect to server");}  
	}  
	  
	function getInfo9(){  
	if(request9.readyState==4){  
	var val=request9.responseText;
	if(val.indexOf("proceed")>-1){
			
	}
	else(val.indexOf("enter a valid ph no")>-1){
		alert("enter valid ph no");
		}
	}
	}*/
	var emle
	function emailcheckedit(){ 
		 var x=document.regi.nemail.value;   
			var atposition=x.indexOf("@");  
			var dotposition=x.lastIndexOf(".");  
			if (atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length){  
			  alert("Please enter a valid e-mail address with " +atposition+ ":'@' position" +dotposition+ ":'.' position");  
			   emle=1;
			  return false;
			  }  
			  else{
				emle=0;
				  return true;
				  }
			  
	}  
	function compareedit(){  
		this.emailcheckedit();
		 var name=document.regi.nname.value;  
		 var phoneno=document.regi.nphone.value;
		 var x=document.regi.nemail.value;   
		 
		
	if(name.length>0){
		if(phoneno.length==10){ 
			if(x.length>0){ 	
				if(emle==0){ 
				
					
			window.location.href = "changeprofile.jsp?nname="+name+"&nphone="+phoneno+"&nemail="+x;
				
					 
				}else{alert("Invalid email");return false;}
				}else{alert("Email can't be blank");return false;}
			 }else{alert("phonenumber can't be blank");return false;}
	     }else{alert("Name can't be blank");return false;}
	}  
	
	function matchpass(){ 
		var firstpassword=document.regis.npass.value;  
		var secondpassword=document.regis.cpass.value;  
		if(firstpassword.length>6){   
		if(firstpassword==secondpassword){  
	  
		window.location.href = "passchange.jsp?cmpass="+secondpassword+"&npass="+firstpassword;
		 
		
		}else{  alert("password must be same!");  return false;  }
		}  else{  alert("poor password strength");  return false;  }
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
								<form>
									<select class="input-select">
										<option value="0">All Categories</option>
										<option value="1">Category 01</option>
										<option value="1">Category 02</option>
									</select>
									<input class="input" placeholder="Search here">
									<button class="search-btn">Search</button>
								</form>
							</div>
						</div>
						<!-- /SEARCH BAR -->

						<!-- ACCOUNT -->
						<div class="col-md-3 clearfix">
							<div class="header-ctn">
								<!-- Wishlist -->
								<div>
									<a href="#">
										<i class="fa fa-heart-o"></i>
										<span>Your Wishlist</span>
										<div class="qty">2</div>
									</a>
								</div>
								<!-- /Wishlist -->

								<!-- Cart -->
								<div class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
										<i class="fa fa-shopping-cart"></i>
										<span>Your Cart</span>
										<div class="qty">3</div>
									</a>
									<div class="cart-dropdown">
										<div class="cart-list">
											<div class="product-widget">
												<div class="product-img">
													<img src="./img/product01.png" alt="">
												</div>
												<div class="product-body">
													<h3 class="product-name"><a href="#">product name goes here</a></h3>
													<h4 class="product-price"><span class="qty">1x</span>$980.00</h4>
												</div>
												<button class="delete"><i class="fa fa-close"></i></button>
											</div>

											<div class="product-widget">
												<div class="product-img">
													<img src="./img/product02.png" alt="">
												</div>
												<div class="product-body">
													<h3 class="product-name"><a href="#">product name goes here</a></h3>
													<h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
												</div>
												<button class="delete"><i class="fa fa-close"></i></button>
											</div>
										</div>
										<div class="cart-summary">
											<small>3 Item(s) selected</small>
											<h5>SUBTOTAL: $2940.00</h5>
										</div>
										<div class="cart-btns">
											<a href="#">View Cart</a>
											<a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
										</div>
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
					<% int usert = 0;
		String em =null;
		String a=null;
		String b=null;
		 em = (String)session.getAttribute("email") ;
		 if(em==null){a="active";
		 b="inactive";
		 }
		 else{b="active";
		 a="inactive";
		 }
		if(em==null){ %>					
    <li <%if(em==null){%>class="active"<%}  else{%>class="inactive" <%} %>><a data-toggle="tab" href="#home">Login</a></li>  
    <li><a data-toggle="tab" href="#menu1">Register</a></li> <%} 
    else{%> 
    
      <li <%if(em!=null){%>class="active"<%}  else{%>class="inactive" <%} %>><a data-toggle="tab" href="#menu4">Edit Profile</a></li> 
    <li><a data-toggle="tab" href="#menu3">Change Password</a></li> 
   <li><a data-toggle="tab" href="#menu2">Logout</a></li>  <%} %>
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
 <div id="home" class="tab-pane fade in <%=a %>">
       <div class="container" id="c2">
<form name="lo">
<p class="l1"><strong>Login</strong></p><br>
<p>
Email:<br><input type="email" name="email"><br>
Password:<br><input type="password" name="password"><br></p>
<p class="l2"><input type="button"  value="Login"  onclick="login()" ></p>
</form>
</div>
<span id="ddd"></span>
    </div>  
    <div id="menu1" class="tab-pane fade">  
     
     <div class="container" id="c1">






<form name="re" >

<p class="p1"><strong>Registration Form</strong></p><br>
<p>

Name:<span id="na"></span><br><input type="text" name="name" ><br>
Email:<span id="emailloc"></span><br><input type="email" id = "mn" name="email"onblur="emailcheck()"><br>
Phoneno:<br><input type="text" name="phoneno" onblur="mobilevd()"><br>
password:<span id="aa"></span><br><input type="password" name="pa" id = "ps"  onkeyup="pass()" ><br>
Con.password:<span id="bb"></span><br><input type="password" name="cpassword" onblur= "matchpa()"><br>
Please enter the captcha:

<div class="g-recaptcha" data-sitekey="6Lf2DGgUAAAAAO9meogRGS1uQpbjFJxzgASd8vcu"></div>           
<span id="captcha" style="margin-left:100px;color:red" ></span>





 

<br>
<p class="p2">
<input type="button"  value="Register" onclick="compareall() "></p>
</form>





</div>
<span id="dd"></span>
    </div>  
    <div id="menu2" class="tab-pane fade">  
      
           <div class="container" id="c3">
<form name="ajx" action="logout" >
<p class="l3"><strong>Logout????</strong></p><br>
<p class="l4">
Are you sure to logout?</p>

<p class="l2"><input type="submit" class="l5" value="Logout" ></p>
</form>
</div>
<span id="dddd"></span>
    </div>  
    <div id="menu3" class="tab-pane fade ">  
      <div class="container" id="c6">

<form name="regis" >

<p class="p1"><strong>Password Change</strong></p><br>
<p>

Current Password:<br><input type="password" name="cupass"><br>
New Password:<br><input type="password" name="npass"><br>
Confirm Password:<br><input type="password" name="cpass" ><br>
<p class="p2">
<input type="submit"  value="Update"></p>

</form>
</div>
    </div>    
     <div id="menu4" class="tab-pane fade in <%=b%>">  
      <div class="container" id="c6">

<form name="regi" >
<% String ema = null;
ema = (String)session.getAttribute("email") ;
String unam =null;
String uphon = null;
int id=0;
try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=(Connection)DriverManager.getConnection(
        "jdbc:mysql://192.168.18.245:3306/jb14101","jb14101","jb14101");
    PreparedStatement ps=con.prepareStatement("select loid from Login where loemail=?");
    ps.setString(1,ema);
    ResultSet rs = ps.executeQuery();
while(rs.next()){
     	id=rs.getInt(1);
     	
}
    PreparedStatement ps1=con.prepareStatement("select uname,uphone from registration where loidfk=?");
    ps1.setInt(1,id);
    ResultSet rs1 = ps1.executeQuery();
while(rs1.next()){
	unam=rs1.getString(1);
	uphon=rs1.getString(2);
}
}catch(Exception e){
out.print(e);}
%>
<p class="p1"><strong>Profile Change</strong></p><br>
<p>

Name:<br><input type="text" name="nname" value="<%=unam%>"><br>
Email:<br><input type="email" name="nemail" value="<%=ema%>" onblur ="emailcheckedit()"><br>
Phonenumber:<br><input type="text" name="nphone" value="<%=uphon%>"><br>
<p class="p2">
<input type="submit"  value="Update" onclick = "compareedit()"></p>

</form>
</div>
    </div>

					</div>
				</div>
			</div>
			</div>
			</div>
		<!-- /SECTION -->

		<!-- NEWSLETTER -->
		<div id="newsletter" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<div class="newsletter">
							<p>Sign Up for the <strong>NEWSLETTER</strong></p>
							<form>
								<input class="input" type="email" placeholder="Enter Your Email">
								<button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
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
									<li><a href="#">Hot deals</a></li>
									<li><a href="#">Laptops</a></li>
									<li><a href="#">Smartphones</a></li>
									<li><a href="#">Cameras</a></li>
									<li><a href="#">Accessories</a></li>
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
									<li><a href="#">My Account</a></li>
									<li><a href="#">View Cart</a></li>
									<li><a href="#">Wishlist</a></li>
									<li><a href="#">Track My Order</a></li>
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
		
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="js/main.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
      <%@ page import="pass.*" %>
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
width:340px;
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
.cap{
padding-top:20px;
margin-bottom:10px;
padding-left:45px;
}
.p1{
color:red;
margin-left:35px;
margin-left:40px
padding-top:20px;
padding-bottom:5px;}
.p2{
padding-left:90px;
padding-top:5px;

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
color:red;}

#captcha{
padding-left:5px;
margin-left:5px;}
.g-recaptcha{
padding-left:5px;
margin-left:5px;}


/* The message box is shown when the user clicks on the password field */
#message {
  display:none;
  background: #f1f1f1;
  color: #000;
  position: relative;
  padding: 250px;
  margin-top: 100px;
   cursor: pointer;
}

#message p {
  padding: 10px 35px;
  font-size: 18px;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
  color: green;
}

.valid:before {
  position: relative;
  left: -35px;
  content: "✔";
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
  color: red;
}

.invalid:before {
  position: relative;
  left: -35px;
  content: "✖";
}
</style>
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
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}  
}  
  
function getInfo(){  
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

$(document).ready(function(){  
    $("#register").click(function(){  
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
    						
    						insert();    					
    					 }else{alert("Phone number should have 10 digits");}
    				 }else{alert("email unavailable");}
    				}else{alert("name not entered");}
    			}else{alert("password not matching");}
    	    }else{alert("poor password strength, please reenter your password");}
    		
    	
    	});
    	});
    	
function matchpass(){ 
	var firstpassword=document.regpass.npass.value;  
	var secondpassword=document.regpass.cpass.value;  
	var cupass=document.regpass.cupass.value;  
	
	if(firstpassword.length>6){   
	if(firstpassword==secondpassword){  
  
	window.location.href = "passchange.jsp?cupass="+cupass+"&npass="+firstpassword;
	 
	
	}else{  alert("password must be same!");  return false;  }
	}  else{  alert("poor password strength");  return false;  }
	}
	
	
    	
function compareedit(){  
	this.emailcheckedit();
	 var name=document.regup.nname.value;  
	 var phoneno=document.regup.nphone.value;
	 var x=document.regup.nemail.value;   
	 
	
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
var emle
function emailcheckedit(){ 
	 var x=document.regup.nemail.value;   
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
var request1;  
function insert()  
{  
	var name=document.re.name.value;
	var email=document.re.email.value; 
	var phoneno=document.re.phoneno.value;
	var password=document.re.pa.value; 
	window.location.href ="userregistration?name="+name+"&email="+email+"&phoneno="+phoneno+"&password="+password;
  
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
	   
	var request4;  
	function name()  
	{  
		var url="username";
	  
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
	if(val.indexOf("null")>-1){
		val="";
	}
	else{
		document.getElementById('uname').innerHTML=val;
	}}

	}  

	</script>
	<script>
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
		
		
		</script>
		<script>
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
			window.location.href="myAccount.jsp"
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
<script>
var myInput = document.getElementById("ps");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");

// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
  document.getElementById("message").style.display = "block";
}

// When the user clicks outside of the password field, hide the message box
myInput.onblur = function() {
  document.getElementById("message").style.display = "none";
}

// When the user starts to type something inside the password field
myInput.onkeyup = function() {
  // Validate lowercase letters
  var lowerCaseLetters = /[a-z]/g;
  if(myInput.value.match(lowerCaseLetters)) {  
    letter.classList.remove("invalid");
    letter.classList.add("valid");
  } else {
    letter.classList.remove("valid");
    letter.classList.add("invalid");
  }
  
  // Validate capital letters
  var upperCaseLetters = /[A-Z]/g;
  if(myInput.value.match(upperCaseLetters)) {  
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }

  // Validate numbers
  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {  
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }
  
  // Validate length
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
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
										 session.setMaxInactiveInterval(5*60);
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
<p class="cap">

Name:<span id="na"></span><br><input type="text" name="name" ><br>
Email:<span id="emailloc"></span><br><input type="email" id = "mn" name="email"onblur="sendInfo()"><br>
Phoneno:<br><input type="text" name="phoneno"><br>
password:<span id="aa"></span><br><input type="password" name="pa" id = "ps"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required><br>
Con.password:<span id="bb"></span><br><input type="password" name="cpassword" onblur= "matchpa()"><br>
Please enter the captcha:

<div class="g-recaptcha" data-sitekey="6LchFeIUAAAAAGn8gvjAoveQIbMTnzAKnaliZ1nU"></div>           
<span id="captcha" style="margin-left:100px;color:red" ></span>

<p class="p2">
<input type="button"  value="Register"  id="register"></p>

</form>





</div>
 <div id="message">
  <h3>Password must contain the following:</h3>
  <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
  <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
  <p id="number" class="invalid">A <b>number</b></p>
  <p id="length" class="invalid">Minimum <b>8 characters</b></p>
</div>



<script>

var myInput = document.getElementById("ps");

var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");

// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
  document.getElementById("message").style.display = "block";
}

// When the user clicks outside of the password field, hide the message box
myInput.onblur = function() {
  document.getElementById("message").style.display = "none";
}

// When the user starts to type something inside the password field
myInput.onkeyup = function() {
  // Validate lowercase letters
  var lowerCaseLetters = /[a-z]/g;
  if(myInput.value.match(lowerCaseLetters)) {  
    letter.classList.remove("invalid");
    letter.classList.add("valid");
  } else {
    letter.classList.remove("valid");
    letter.classList.add("invalid");
  }
  
  // Validate capital letters
  var upperCaseLetters = /[A-Z]/g;
  if(myInput.value.match(upperCaseLetters)) {  
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }


  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {  
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }
  
  // Validate length
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}

</script>


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

<form name="regpass" >

<p class="p1"><strong>Password Change</strong></p><br>
<p>

Current Password:<br><input type="password" name="cupass"><br>
New Password:<br><input type="password" name="npass"><br>
Confirm Password:<br><input type="password" name="cpass"><br>
<p class="p2">
<input type="button"  value="Update" onclick="matchpass()"></p>

</form>
</div>
    </div>    
     <div id="menu4" class="tab-pane fade in <%=b%>">  
      <div class="container" id="c6">

<form name="regup" >
<% String ema = null;
connection con= new connection();
ema = (String)session.getAttribute("email") ;
String unam =null;
String uphon = null;
int id=0;
try
{

    PreparedStatement ps=con.getPreparedstatement("select loid from Login where loemail=?");
    ps.setString(1,ema);
    ResultSet rs = ps.executeQuery();
while(rs.next()){
     	id=rs.getInt(1);
     	
}
    PreparedStatement ps1=con.getPreparedstatement("select uname,uphone from registration where loidfk=?");
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
Email:<br><input type="email" name="nemail" value="<%=ema%>"><br>
Phonenumber:<br><input type="text" name="nphone" value="<%=uphon%>"><br>
<p class="p2">
<input type="submit"  value="Update" onclick="compareedit()"></p>

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
		
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="js/main.js"></script>
</body>
</html>
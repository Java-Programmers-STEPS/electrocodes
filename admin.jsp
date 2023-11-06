<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@ page import="pass.pass" %>
   <%@ page import="java.sql.*"%>
     
<!DOCTYPE html>
<html>
<head>

<style>
#a1{
background-color: white ;
border-style:solid;
border-width:1px;
border-color:black;
margin-left:450px;
margin-top:10px;
width:300px;
height:400px;
padding-bottom:10px;
}
.j1{
color:red;
margin-left:35px;
margin-left:40px
padding-top:20px;
padding-bottom:5px;}
.j2{
padding-left:85px;

}
#c1{
background-color: white ;
border-style:solid;
border-width:1px;
border-color:black;
margin-left:450px;
margin-top:10px;
width:300px;
height:230px;
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
#dropbox1{
pading-left:0px;}
.p20{
padding-left:0px;
}
.p22{
padding-left:23px;
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
margin-left:40px;

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
#c22{
background-color: white ;
border-style:solid;
border-width:1px;
border-color:black;
margin-left:450px;
margin-top:10px;
width:300px;
height:1040px;
padding-bottom:10px;
}
#c2{
background-color: white ;
border-style:solid;
border-width:1px;
border-color:black;
margin-left:450px;
margin-top:10px;
width:300px;
height:950px;
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
height:310px;
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
#k3{
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
.k3{
color:red;
margin-left:70px;

padding-top:20px;
padding-bottom:5px;}
.k5{
padding-left:50px;

}
.k6{
padding-left:85px;}

table{  
  border: 1px solid RED;  
  border-collapse: collapse;
   width: 100%; 
     text-align:center;
}  
 td {  
color:black;
  padding:30px;
  
}  
th{
padding:30px;
  
}

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
var pv;
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
document.getElementById('mailloc').innerHTML=val;


}  
}  
function compareallprod(){ 
	 var prodname=document.aj.pname.value;  
	 var prodbrand=document.aj.pbrand.value;  
	 var prodmodel=document.aj.pmodel.value;  
	 var prodprice=document.aj.pprice.value; 
	 var prodcount=document.aj.pcount.value; 
	 var prodcategory=document.aj.pcategory.value; 
	 var proddescrip=document.aj.pdescription.value; 
	
if(prodname.length>0){
	if(prodbrand.length>0){ 
		if(prodmodel.length>0){ 	
			if(prodprice.length>0){	
				if(prodcount.length>0){	
					if(prodcategory.length>0){	
						if(proddescrip.length>0){	
				
			return true;
			
				  }else{alert("Product description can't be blank"); return false;}
			     }else{alert("Product category can't be blank");return false;}
				}else{alert("Product count can't be blank");return false;}
			  }else{alert("Product price can't be blank");return false;}
			}else{alert("Product model can't be blank");return false;}
		 }else{alert("Product brand can't be blank");return false;}
     }else{alert("Product name can't be blank");return false;}
}  
function compareallchprod(){ 
	 var prodname=document.chg.pname.value;  
	 var prodbrand=document.chg.pbrand.value;  
	 var prodmodel=document.chg.pmodel.value;  
	 var prodprice=document.chg.pprice.value; 
	 var prodcount=document.chg.pcount.value; 
	 var prodcategory=document.chg.pcategory.value; 
	 var proddescrip=document.chg.pdescription.value; 
	
if(prodname.length>0){
	if(prodbrand.length>0){ 
		if(prodmodel.length>0){ 	
			if(prodprice.length>0){	
				if(prodcount.length>0){	
					if(prodcategory.length>0){	
						if(proddescrip.length>0){	
				
			return true;
			
				  }else{alert("Product description can't be blank"); return false;}
			     }else{alert("Product category can't be blank");return false;}
				}else{alert("Product count can't be blank");return false;}
			  }else{alert("Product price can't be blank");return false;}
			}else{alert("Product model can't be blank");return false;}
		 }else{alert("Product brand can't be blank");return false;}
    }else{alert("Product name can't be blank");return false;}
}  

function offerfn(){ 
	 var prodoffer=document.mar.poffer.value;  
	 var offrdays=document.mar.pdays.value;  
	 var offrhours=document.mar.phours.value;  
	 var offrminutes=document.mar.pminutes.value; 
	 var offrseconds=document.mar.pseconds.value; 

	
if(prodoffer.length>0){
	if( prodoffer!="abcd"){
	if(offrdays<365 && offrdays!=0){ 
		if(offrhours<25 && offrhours!=0){ 	
			if(offrminutes<61 && offrminutes!=0){	
				if(offrseconds<61 && offrseconds!=0){	
	
			return true;
 
				}else{alert("Offer seconds can't be greater than 60");return false;}
			  }else{alert("Offer minutes can't be greater than 60");return false;}
			}else{alert("Offer hours can't be greater than 24");return false;}
		 }else{alert("Offer days can't be greater than 365");return false;}
	 }else{alert("Offer can't be String ");return false;}
   }else{alert("Offer can't be blank ");return false;}
}  


function addadfn(){ 
	 var name=document.re.name.value;  
	 var mail=document.re.email.value;  
	 var phoneno=document.re.phoneno.value;  

	
if(name.length>0){
	if(mail.length>0){ 
		if(phoneno.length==10){ 	
			if(pv!=0){	
				
				
		this.insert();
				
			}else{alert("Email id is already registered as admin, please login or register using another email");return false;} 
			}else{alert("Phone number should be 10 digits");return false;}
		 }else{alert("Email can't be blank");return false;}
    }else{alert("Name can't be blank");return false;}
}  

var eml;
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





function removeItem(){
	var txt;
	var id=document.getElementById("drop").value;	
	var r = confirm("Are you sure you want to delete  ?");
	if (r == true) {
	 this.removeajx();
	} else {
		txt="cancelled"
		alert(txt);
		
	} 
}



function readURL(input, id) {
if (input.files && input.files[0]) {
var reader = new FileReader();
reader.onload = function (e) {
$(id).attr('src', e.target.result);
}
reader.readAsDataURL(input.files[0]);
}
}
$("#fileToUpload1").change(function(){
readURL(this, "#IMAGE1");
});




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
	
	
	
	
var request1;  
function insert()  
{  
	var name=document.re.name.value;
	var email=document.re.email.value; 
	var phoneno=document.re.phoneno.value;
	var password=document.re.pa.value; 
	var url="regupdate?name="+name+"&email="+email+"&phoneno="+phoneno+"&password="+password;
  
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
if(val.indexOf("admin")>-1){
	window.location.href = "admin.jsp";	
}
else {

	document.getElementById('dd').innerHTML=val;
} 
}  
} 






var request2;  
function table()  
{  

	var url="productTable.jsp";
  
if(window.XMLHttpRequest){  
request2=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request2=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request2.onreadystatechange=getInfo1;  
request2.open("GET",url,true);  
request2.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo1(){  
if(request2.readyState==4){  
var val=request2.responseText;  
document.getElementById('table').innerHTML=val;  
}  
} 





var request3;  
function remove()  
{  
	
	var url="modeldrop.jsp";
  
if(window.XMLHttpRequest){  
request3=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request3=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request3.onreadystatechange=getInfo2;  
request3.open("GET",url,true);  
request3.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo2(){  
if(request3.readyState==4){  
var val=request3.responseText;  
document.getElementById('dropbox').innerHTML=val; 

}  
}  





var request5;  
function remove1()  
{  
	
	var url="modeldrop.jsp";
  
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
document.getElementById('dropbox1').innerHTML=val; 
}  
}





var request6;  
function remove2()  
{  
	
	var url="modeldrop.jsp";
  
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
document.getElementById('dropbox2').innerHTML=val; 
}  
}





var request4;  
function removeajx()  
{  
	var id=document.getElementById("drop").value;
	var url="removeItem?id="+id;
  
if(window.XMLHttpRequest){  
request4=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request4=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request4.onreadystatechange=getInfo3;  
request4.open("GET",url,true);  
request4.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo3(){  
if(request4.readyState==4){  
var val=request4.responseText;  
document.getElementById('dd').innerHTML=val;  
if(val.indexOf("product removed")>-1){
	document.location.href="admin.jsp";
}
else{
	document.location.href="admin.jsp";
	
}
}  
}



var request7;  
function productchange()  
{  
	var id=document.getElementById("drop").value;
	var url="changeProduct.jsp?id="+id;
  
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
document.getElementById('up').innerHTML=val; 
}  
}

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
		window.location.href="admin.jsp"
	}
	else{
		alert("Error");}
	}}
	 
		   
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
		var request33;  
		function order()  
		{  

			var url="ordertable.jsp";
		  
		if(window.XMLHttpRequest){  
		request33=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject){  
		request33=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		  
		try{  
		request33.onreadystatechange=getInfo33;  
		request33.open("GET",url,true);  
		request33.send();  
		}catch(e){alert("Unable to connect to server");}  
		}  
		  
		function getInfo33(){  
		if(request33.readyState==4){  
		var val=request33.responseText;  
		document.getElementById('order').innerHTML=val;  
		}  
		} 



</script>
<style>

.no-js #loader { display: none;  }
.js #loader { display: block; position: absolute; left: 100px; top: 0; }
.se-pre-con {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url(images/loader-64x/Preloader_1.gif) center no-repeat #fff;
}

</style>
<script src="jquery.min.js"></script>
<script src="modernizr.js"></script>
<script>
	
	$(window).load(function() {
	
		$(".se-pre-con").fadeOut("slow");;
	});
</script>


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
<div class="se-pre-con"></div>
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
								<%String email2=(String)session.getAttribute("email");
										 session.setMaxInactiveInterval(5*60);
										if(email2!=null){%>
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
						
    <li class="active"><a data-toggle="tab" href="#home">Add New Product</a></li>  
    <li><a data-toggle="tab" href="#menu1" onclick="remove()">Remove Item</a></li>  
    <li><a data-toggle="tab" href="#menu2" onclick="remove1()">Add Offer</a></li>  
    <li><a data-toggle="tab" href="#menu3" onclick="remove2()">Change Product Details</a></li> 
    <li><a data-toggle="tab" href="#menu4">Add Admin</a></li>
    <li><a data-toggle="tab" href="#menu6" onclick="table()">Product List</a></li>
    <li><a data-toggle="tab" href="#menu7" onclick="order()" >View Orders</a></li>
    
     <li><a data-toggle="tab" href="#menu5">Logout</a></li>
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
       
       <div class="container" id="c2">
    
<form enctype="multipart/form-data" name="aj" action="addItem" method="post" >
<p class="l1"><strong>Add New Product</strong></p><br>
<p>

Product Name:<br><input type="text" name="pname"><br>
Product Brand:<br><input type="text" name="pbrand"><br>
Product Model:<br><input type="text" name="pmodel"><br>
Product Price:<br><input type="text" name="pprice"><br>
Product Image 1:<br> <img src="" id="IMAGE1" width="100px" height="70px"/>
<br> <input type="file"  name="IMAGE1" id="fileToUpload1" onchange="readURL(this,IMAGES);">
<br>
Product Image 2:<br> <img src="" id="IMAGE2" width="100px" height="70px"/>
<br> <input type="file" name="IMAGE2" id="fileToUpload2" onchange="readURL(this,IMAGES);">
<br>
Product Image 3:<br> <img src="" id="IMAGE3" width="100px" height="70px"/>
<br> <input type="file" name="IMAGE3" id="fileToUpload3" onchange="readURL(this,IMAGES);">
<br>
Product Count:<br><input type="text" name="pcount"><br>
Category:<br><input type="text" name="pcategory"><br>
description:<br><input type="text" name="pdescription"><br>
<p class="l2"><input type="submit"  value="ADD" onclick =  "return compareallprod()" ></p>
</form>
</div>
<span id="dd"></span>
    </div>  
    <div id="menu1" class="tab-pane fade">  
     <div class="container" id="c1">

<form name="regis" >

<p class="p1"><strong>Remove Item</strong></p><br>
<p class=p20>
<span id="dropbox"></span></p>

<p class="p2">
<input type="submit"  value="Remove" onclick="removeItem()"></p>

</form>
</div>

    </div>  
    <div id="menu2" class="tab-pane fade">  
      
<div class="container" id="c3">

<form  name="mar" action="addOffer" method="get">
<p class="l3"><strong>Add Offer</strong></p><br>
<p class=p20>
<span id="dropbox1"></span></p><p class=p22>
Offer:<br><input type="text" name="poffer"><br>
<p class="l2"><input type="submit"  value="Add Offer" onclick = "return offerfn()"></p>
<br><input type="hidden" name="pdays" value="2"><br>
<br><input type="hidden" name="phours" value="2"><br>
<br><input type="hidden" name="pminutes" value="2"><br>
<br><input type="hidden" name="pseconds" value="2"><br>
</p>

</form>
</div>
    </div>  
    <div id="menu3" class="tab-pane fade">  
      <div class="container" id="c22">

<form enctype="multipart/form-data" name="chg" action="changeProduct" method="post">

<p class="p1"><strong>Change Product Details</strong></p><br>
<p class=p20>
<span id="dropbox2"  onchange="productchange()"></span></p>
<p>
<span id="up">
New Product Name:<br><input type="text" name="pname"><br>
New Product Brand:<br><input type="text" name="pbrand"><br>
New Product Model:<br><input type="text" name="pmodel"><br>
New Product Price:<br><input type="text" name="pprice"><br>
New Product Image 1:<br> <img src="" id="IMAGE1" width="100px" height="70px"/>
<br> <input type="file"  name="IMAGE1" id="fileToUpload1" onchange="readURL(this,IMAGES);">
<br>
New Product Image 2:<br> <img src="" id="IMAGE2" width="100px" height="70px"/>
<br> <input type="file" name="IMAGE2" id="fileToUpload2" onchange="readURL(this,IMAGES);">
<br>
New Product Image 3:<br> <img src="" id="IMAGE3" width="100px" height="70px"/>
<br> <input type="file" name="IMAGE3" id="fileToUpload3" onchange="readURL(this,IMAGES);">
<br>
New Product Count:<br><input type="text" name="pcount"><br>
New Category:<br><input type="text" name="pcategory"><br>
New description:<br><input type="text" name="pdescription"><br></span>
<p class="l2"><input type="submit"  value="Update" onclick = " return compareallchprod()"></p>
</form>
</div>
    </div>    
     <div id="menu4" class="tab-pane fade">  
        <div class="container" id="a1">
<form name="re" >

<p class="j1"><strong>Registration Form</strong></p><br>
<p>
<% 
pass p = new pass();
String randomPass= p.str(10).toString();


%>
Name:<span id="na"></span><br><input type="text" name="name" ><br>
Email:<span id="mailloc"></span><br><input type="email" id = "mn" name="email"onblur="emailcheck()"><br>
Phoneno:<br><input type="text" name="phoneno"><br>
password:<span id="aa"></span><br><input type="password" value="<%=randomPass %>" name="pa" id = "ps"  onkeyup="pass()" ><br>
<p class="j2">
<input type="button"  value="Register" onclick="addadfn()"></p>

</form>





</div>
<span id="registration"></span>
    
    </div>
     <div id="menu6" class="tab-pane fade">
      <span id="table"></span>
      <br>
      <a href="exl">convert to excel</a>
         </div>
          <div id="menu7" class="tab-pane fade">
      <span id="order"></span>
         </div>
    <div id="menu5" class="tab-pane fade">  
       
           <div class="container" id="k3">
<form name="ajx" action="logout" >
<p class="k4"><strong>Logout????</strong></p><br>
<p class="k5">
Are you sure to logout?</p>

<p class="k6"><input type="submit" class="l5" value="Logout" ></p>
</form>
</div>
<span id="dddd"></span>
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
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="js/main.js"></script>
		

</body>

</html>
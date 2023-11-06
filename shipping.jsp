<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*"%>
       <%@ page import="pass.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
						String fname=null;
						String email=null;
						String address=null;
						String city=null;
						String country=null;
						String lname=null;
						String state=null;
						int zip=0;
						String phone=null;
						connection con= new connection();
						
						
						try{
							
							String uemail=(String)session.getAttribute("email"); 
							 session.setMaxInactiveInterval(5*60);
							
				
							 	PreparedStatement ps=con.getPreparedstatement("select fname,email,address,city,county,zip,phone,lname,state from addresstable where useremail=?");
							 	ps.setString(1,uemail);
							 	ResultSet rs=ps.executeQuery();
							 	while(rs.next()){
							 		fname=rs.getString(1);
							 		email=rs.getString(2);
							 		address=rs.getString(3);
							 		city=rs.getString(4);
							 		country=rs.getString(5);
							 		zip=rs.getInt(6);
							 		phone=rs.getString(7);
							 		lname=rs.getString(8);
							 		state=rs.getString(9);
							 		
							 	}}
						 catch(Exception e){
					 			out.print(e);}
					 			if(fname!=null){ 
					 			%>
		<div class="billing-details">
							<div class="section-title">
								<h3 class="title">Shiping address </h3>
							</div>
							<div class="form-group">
										<input class="input" type="text" name="firstname" Value="<%=fname%>" readonly="readonly">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="lastname" Value="<%=lname%>" readonly="readonly">
									</div>
									
									<div class="form-group">
										<input class="input" type="email" name="email" value="<%=email%>" readonly="readonly"> 
									</div>
									<div class="form-group">
									<input class="input" type="text" name="address" value="<%=address%>" readonly="readonly">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="city" value="<%=city%>" readonly="readonly">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="state" value="<%=state%>" readonly="readonly">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="country" value="<%=country%>" readonly="readonly">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="zip" value="<%=zip%>" readonly="readonly">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="tel" value="<%=phone%>" readonly="readonly">
									</div>
									</div>
									<%}else{ %>
									<P style="color:red;font-size:20px;">Please add  a valid shipping address...<p>
						<% }%>
						<!-- /Billing Details -->

						<!-- Shiping Details -->
												
							 	<% if(email!=null){%>
						<div class="shiping-details">
							<div class="section-title">
								<h3 class="title"> Update Shiping address</h3>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="shiping-address">
								<label for="shiping-address">
									<span></span>
								 View/Update Shipping address?
								</label>
								<div class="caption">
								<form name="cart">
									<div class="form-group">
									First Name:<input class="input" type="text" name="firstname" Value="<%=fname%>">
									</div>
									<div class="form-group">
									Last Name:<input class="input" type="text" name="lastname" Value="<%=lname%>">
									</div>
									
									
									<div class="form-group">
										Email:<input class="input" type="email" name="email" value="<%=email%>">
									</div>
									<div class="form-group">
									 Address:<input class="input" type="text" name="address" value="<%=address%>">
									</div>
									<div class="form-group">
										City:<input class="input" type="text" name="city" value="<%=city%>">
									</div>
									<div class="form-group">
										State:<input class="input" type="text" name="state" value="<%=state%>">
									</div>
									<div class="form-group">
										Country:<input class="input" type="text" name="country" value="<%=country%>">
									</div>
									<div class="form-group">
										Zip code:<input class="input" type="text" name="zip" value="<%=zip%>">
									</div>
									<div class="form-group">
										Phone number:<input class="input" type="text" name="tel" value="<%=phone%>">
									</div>
									<input type="submit" value="Update" onclick="shipupdatevalidate()">
									</form>
								</div>
							</div>
						</div>
						<%}else{ %>
							<div class="shiping-details">
							<div class="section-title">
								<h3 class="title"> Add Shiping address</h3>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="shiping-address">
								<label for="shiping-address">
									<span></span>
								 Add Shipping address?
								</label>
								<div class="caption">
								<form name="cart">
							<div class="form-group">
								<input class="input" type="text" name="firstname" placeholder="First Name">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="lastname" placeholder="Last Name">
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
								<input class="input" type="text" name="state" placeholder="states">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="country" placeholder="Country">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="zip" placeholder="ZIP Code">
							</div>
							<div class="form-group">
								<input class="input" type="tel" name="tel" placeholder="Phone Number">
							</div>
							<input type="submit" value="Add" onclick="shipvalidate()">
							</form>
						</div>
						</div>
						</div>
						<%} %>
</body>
</html>
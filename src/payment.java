

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pass.connection;

/**
 * Servlet implementation class payment
 */
@WebServlet("/payment")
public class payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public payment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		String uemail=(String)request.getSession().getAttribute("email"); 
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String country=request.getParameter("country");
		String zip=request.getParameter("zip");
		String phone=request.getParameter("phone");
		String state=request.getParameter("state");
		String acno=request.getParameter("acno");
		connection con= new connection();
		System.out.println(acno +" "+ acno.length());
		
		String cvv=request.getParameter("cvv");
		String expdate=request.getParameter("expdate");
		String total=request.getParameter("total");
		System.out.println(total);
		PreparedStatement ps5=null,ps6=null;
		String last4=null;
		
		if(acno.length()>4) {
			last4=acno.substring(acno.length()-4);
			System.out.println(acno);
			System.out.println(last4);}
		
		System.out.println(acno);
	
		Float to=Float.parseFloat(total);
		Double t=Double.parseDouble(total);
		
		String apiLoginID="44kGTQt24";
		String transactionKey="24GAyugHV84f2R2e";
		int loid=0;
		String order="";
		int id=0;	 
		int q=0;
		 String oname=null;
			int oquty=0;
			int pqut=0;
			int proid=0;
			int quty=0;
			int updated_prod_count=0;
		
		
		String afname=null,alname=null,acity=null,astate=null,aaddress=null,aphone=null,acountry=null,azip=null;
		
		
		 try{
			 	
				
	 PreparedStatement ps1=con.getPreparedstatement("select loid from Login where loemail =?");	 
	 ps1.setString(1, uemail);
	 ResultSet rs=ps1.executeQuery();  	
	 while(rs.next()) {
			loid = rs.getInt(1);
	 }
		
			 	
				
	PreparedStatement ps2=con.getPreparedstatement("select fname,lname,address,city,county,zip,phone,state from addresstable where useremail =?");	 
	ps2.setString(1, uemail);
	ResultSet rs1=ps2.executeQuery(); 
	while(rs1.next()) {
		afname= rs1.getString(1);
		alname= rs1.getString(2);
		aaddress= rs1.getString(3);
		acity= rs1.getString(4);
		acountry= rs1.getString(5);
		azip= (String)rs1.getString(6);
		aphone= rs1.getString(7);
		astate= rs1.getString(8);
 }
	
			
		String Customer_profile_ID = CreateCustomerProfile.run(apiLoginID, transactionKey, email, acno, expdate);
		
		String Customer_payment_profile_ID= CreateCustomerPaymentProfile.run(apiLoginID,transactionKey, Customer_profile_ID, fname, lname, address, email, city, state, zip, country, phone, acno, expdate, cvv);
		
		String Customer_shipping_ID= CreateCustomerShippingAddress.run(apiLoginID, transactionKey, Customer_profile_ID, afname, alname, aaddress, email,acity, astate, azip, acountry, aphone);		
		
	
	
	java.util.Date date=new java.util.Date();
	
	
	long timestamp = date.getTime() ;// 25 July 2018 10:59:59 UTC
	Date dt = new Date(timestamp);
	
	String tdate=dt.getDate()+"/"+ (dt.getMonth()+1)+"/"+ (dt.getYear()+1900);
	String ttime=dt.getHours()+":"+ dt.getMinutes()+":"+dt.getSeconds();

	
	
	

	PreparedStatement ps3=con.getPreparedstatement("insert into Custpayment(cpid,cpcpid,tstatus,loidfk,cshpid) values(?,?,?,?,?)");
	ps3.setString(1,Customer_profile_ID);
	ps3.setString(2,Customer_payment_profile_ID);
	ps3.setInt(3,1);
	ps3.setInt(4,loid);
	ps3.setString(5,Customer_shipping_ID);
	int i=ps3.executeUpdate(); 
	
	

	if(i>0) {
		System.out.println("customer table success");
	
		
	int p=ChargeCustomerProfile.run(apiLoginID, transactionKey, Customer_profile_ID, Customer_payment_profile_ID, to);
	System.out.println(p);

	if(p>0) {
		
		 ps5=con.getPreparedstatement("select id from Custpayment where loidfk=?");
		
		 ps5.setInt(1, loid);
		 ResultSet rs5=ps5.executeQuery();  
		 while(rs5.next()) {
			 id=rs5.getInt(1);
		 }
		 
		 if(id>0) {

		
			ps6=con.getPreparedstatement("insert into Transactiontable (tdate,ttime,tamount,tstatus,cpidfk,cardnumber) values(?,?,?,?,?,?)");
			ps6.setString(1, tdate);
			ps6.setString(2, ttime);
			ps6.setDouble(3,t);
			ps6.setInt(4,1);
			ps6.setInt(5, id);
			ps6.setString(6,"xxxx-xxxx-xxxx-"+last4);
			int k=ps6.executeUpdate();

			if(k>0) {
				PreparedStatement ps9=con.getPreparedstatement("update producttable set procount=? where proid=?");
				PreparedStatement ps4=con.getPreparedstatement("select producttable.proname,carttable.cproqut,producttable.procount,producttable.proid from carttable inner join producttable on carttable.cproid=producttable.proid inner join Login on carttable.cuseremail=  Login.loid WHERE Login.loid=? GROUP BY cid order by cid ");	
				ps4.setInt(1, loid);
				ResultSet rs4=ps4.executeQuery();  	
				while(rs4.next()) {
					oname=rs4.getString(1);
					System.out.println(oname);
					oquty=rs4.getInt(2);
					System.out.println("cart qty"+oquty);
					pqut=rs4.getInt(3);
					System.out.println("pro qty"+pqut);
					proid=rs4.getInt(4);
					System.out.println("prod id"+proid);
					order=order+oname+"("+oquty+"),";
					updated_prod_count=pqut-oquty;
					System.out.println("updated count"+updated_prod_count);

					if(updated_prod_count!=0) {
						 ps9.setInt(1, updated_prod_count);
						 ps9.setInt(2, proid);
						 q=ps9.executeUpdate();
						 System.out.println(q);
						 if(q>0) {
						 
							ps5=con.getPreparedstatement("insert into ordertable(userloid,products,pdate,price) values(?,?,?,?)");	 
							ps5.setInt(1,loid);
							ps5.setString(2, order);
							ps5.setString(3,tdate+" "+ttime);
							ps5.setDouble(4, to);
							int o=ps5.executeUpdate();
							if(o>0) {
								System.out.println("inserted to order table");
								ps6=con.getPreparedstatement("delete from carttable where cuseremail=?");
								ps6.setInt(1, loid);
								int d=ps6.executeUpdate();
								if(d>0) {
								 
										System.out.println("deleted from carttable");
										response.sendRedirect("pdfnew.jsp");
								}
								else {
										out.print("delete error");
								}

							}else {
								System.out.println("order table insertion failure");
							}
						 }
						 else {
							 System.out.println("count updation error");
						 }
					
					
					}
			}
		 }
		 }
		 else {
			 System.out.println("trans table insertion  error");	 
		 }
	}
	else {
		System.out.println("customer id fetch error");	 
		 }
	}
	else {
		System.out.println("payment id error");
	}
	
		 
/*
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * System.out.println(tdate+" "+ ttime);
	ps5=con.getPreparedstatement("insert into ordertable(userloid,products,pdate,price) values(?,?,?,?)");	 
		ps5.setInt(1,loid);
		ps5.setString(2, order);
		ps5.setString(3,tdate+" "+ttime);
		ps5.setDouble(4, to);
		 int o=ps5.executeUpdate();
		 if(o>0) {System.out.println("inserted to order table");
			 ps6=con.getPreparedstatement("delete from carttable where cuseremail=?");
			 ps6.setInt(1, loid);
			int d=ps6.executeUpdate();
		 if(d>0) {
			 
		System.out.println("deleted from carttable");
			 response.sendRedirect("pdfnew.jsp");
		 }
		 else {out.print("delete error");
		 }
		 }else {
			 System.out.println("orderc insert error");}
		 }
		 }*/


	} 
				
				catch(Exception e){
				out.print(e);}}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

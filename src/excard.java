

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
 * Servlet implementation class excard
 */
@WebServlet("/excard")
public class excard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public excard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String uemail=(String)request.getSession().getAttribute("email"); 
		String total=request.getParameter("total");
		String acno=request.getParameter("acno");
		System.out.println(acno+" "+total);
		PreparedStatement ps5=null,ps6=null;

		String oname=null;
		int oquty=0;
		int loid=0;
		String order="";
		int id=0;	 
		int q=0;

			
			int pqut=0;
			int proid=0;
			int quty=0;
			int updated_prod_count=0;
			
		Float to=Float.parseFloat(total);
		Double t=Double.parseDouble(total);
		String apiLoginID="44kGTQt24";
		String transactionKey="24GAyugHV84f2R2e";
	
		connection con= new connection();
		
	try{
			 	
				
	PreparedStatement ps1=con.getPreparedstatement("select loid from Login where loemail =?");	 
	 ps1.setString(1, uemail);
	 ResultSet rs=ps1.executeQuery();  	
	 while(rs.next()) {
			loid = rs.getInt(1);
	 }
	 String cpid=null,cpcpid=null,cshpid=null;
	
	 PreparedStatement ps2=con.getPreparedstatement("select cpid,cpcpid,cshpid,id from Custpayment where loidfk =?");
		ps2.setInt(1, loid);
		ResultSet rs2=ps2.executeQuery();  
		 while(rs2.next()) {
			cpid =rs2.getString(1);
			cpcpid =rs2.getString(2);
			cshpid =rs2.getString(3);
			id=rs2.getInt(4);
		 }
		 
				
	
	
		 java.util.Date date=new java.util.Date();
	
	
		 long timestamp = date.getTime() ;// 25 July 2018 10:59:59 UTC
		 Date dt = new Date(timestamp);
	
		 String tdate=dt.getDate()+"/"+ (dt.getMonth()+1)+"/"+ (dt.getYear()+1900);
		 String ttime=dt.getHours()+":"+ dt.getMinutes()+":"+dt.getSeconds();


			 
		
		 int p=ChargeCustomerProfile.run(apiLoginID, transactionKey, cpid, cpcpid, to);
		 System.out.println(p);
	
		 
		 if(p>0) {
		
		
			 ps6=con.getPreparedstatement("insert into Transactiontable (tdate,ttime,tamount,tstatus,cpidfk,cardnumber) values(?,?,?,?,?,?)");
				ps6.setString(1, tdate);
				ps6.setString(2, ttime);
				ps6.setDouble(3,t);
				ps6.setInt(4,1);
				ps6.setInt(5, id);
				ps6.setString(6,acno);
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
		System.out.println("payment charge error");
	}	
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

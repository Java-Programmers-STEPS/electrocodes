

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pass.connection;

/**
 * Servlet implementation class otpsendtophone
 */
@WebServlet("/otpsendtophone")
public class otpsendtophone extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public otpsendtophone() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		int oloid=0;
		int ran=rdnm.createrdnm();
		int loid=0;
		connection con= new connection();
		 try{
			 	
				
	PreparedStatement ps1=con.getPreparedstatement("select loid from Login where loemail =?");	 
	 ps1.setString(1, email);
	 ResultSet rs=ps1.executeQuery();  	
	 while(rs.next()) {
			loid = rs.getInt(1);
	 
	 }
	 PreparedStatement ps2=con.getPreparedstatement("select loid from otp where phone=?");
	 ps2.setString(1,phone);
	 ResultSet rst2=ps2.executeQuery();
	 while(rst2.next()) {
		 oloid=rst2.getInt(1);
	 }
	 if(oloid==0) {
		 PreparedStatement ps3=con.getPreparedstatement("insert into otp(loid,uotp,phone) values(?,?,?)");
	ps3.setInt(1, loid);
	ps3.setInt(2, ran);
	ps3.setString(3, phone);
	ps3.executeUpdate();
	 }
	 else {
		 PreparedStatement ps3=con.getPreparedstatement("update otp set uotp=? where phone=?");
			ps3.setInt(1, ran);
			ps3.setString(2,phone );
			
	ps3.executeUpdate();
	
			
		}
	 SendSMS.sendsms("+91"+phone, ran);
	 out.print("otp");
		
	}
		 catch(Exception e) {System.out.println(e);}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}



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
 * Servlet implementation class otpval
 */
@WebServlet("/otpval")
public class otpval extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public otpval() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String otp=request.getParameter("otp");
		int uopt=Integer.parseInt(otp);
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		int loid=0;
		int rotp=0;
		connection con= new connection();
		 try{
			 	
				
	PreparedStatement ps1=con.getPreparedstatement("select loid from Login where loemail =?");	 
	 ps1.setString(1, email);
	 ResultSet rs=ps1.executeQuery();  	
	 while(rs.next()) {
			loid = rs.getInt(1);
	 
	 }
	 PreparedStatement ps2=con.getPreparedstatement("select uotp from otp where phone=?");
	 ps2.setString(1,phone);
	ResultSet rst=ps2.executeQuery();
	while(rst.next()) {
		rotp=rst.getInt(1);
		
	}
	System.out.println(rotp);
	System.out.println(uopt);
	System.out.println(loid);
	System.out.println(email);
		
	if(uopt==rotp) {
			
			 PreparedStatement ps6=con.getPreparedstatement("update Login set lostatus=? where loid=?");
			ps6.setInt(1,2);
			ps6.setInt(2, loid);
			int k=ps6.executeUpdate();
			 
			if(k>0) {out.print("otp");}
		}
		else {
			out.print("error");
		}
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

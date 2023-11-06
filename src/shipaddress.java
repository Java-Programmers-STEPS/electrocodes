

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pass.connection;

/**
 * Servlet implementation class shipaddress
 */
@WebServlet("/shipaddress")
public class shipaddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public shipaddress() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
	
 
		HttpSession session=request.getSession(false); 
		String uemail=(String)session.getAttribute("email"); 
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String country=request.getParameter("country");
		String zip=request.getParameter("zip");
		String phone=request.getParameter("phone");
		String state=request.getParameter("state");
		int zipc=Integer.parseInt(zip);
		connection con= new connection();
		System.out.println("ewfuegwfuiewgfiewfgewiofhewifuew");
		 try{
			 	
				
	
				 	PreparedStatement ps=con.getPreparedstatement("insert into addresstable(fname,email,address,city,county,zip,phone,useremail,lname,state) values(?,?,?,?,?,?,?,?,?,?)");	
			 ps.setString(1,fname);
			 ps.setString(2,email);
			 ps.setString(3,address);
			 ps.setString(4,city);
			 ps.setString(5,country);
			 ps.setInt(6,zipc);
			 ps.setString(7,phone);
			 ps.setString(8,uemail);
			 ps.setString(9,lname);
			 ps.setString(10,state);
			 int i=ps.executeUpdate();
			 if(i>0) {out.print("updated");}
			 System.out.println("updated");
			 
}
		 catch(Exception e){
	 			out.print(e);}
		 }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

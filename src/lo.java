

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pass.connection;

/**
 * Servlet implementation class lo
 */
@WebServlet("/lo")
public class lo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String passk=null;
		String pass=null;
		String spassword=null;
		connection con= new connection();
		int status=0;
		int s=0;
		try{
			
		PreparedStatement str=con.getPreparedstatement("select lousertype from Login where loemail=?");
		str.setString(1,email);
		ResultSet rst=str.executeQuery();
		while(rst.next()){
			s=rst.getInt(1);
		}
		}
		catch(Exception e){
			out.print(e);
		}

			try{
			
		PreparedStatement str=con.getPreparedstatement("select lokey,lopassword,lostatus from Login where loemail=?");
		str.setString(1,email);
		ResultSet rst=str.executeQuery();
		while(rst.next()){
			passk=rst.getString(1);
			pass=rst.getString(2);
			System.out.println(pass);
			status=rst.getInt(3);
		}
			}
		catch(Exception e){
			out.print(e);
		}
			
		  try {
			  String saltd_password=password+passk;
		     spassword= Base64.getEncoder().encodeToString(saltd_password.getBytes());
		     System.out.println(spassword);
		    } 
		 catch (Exception e) {
		 
		    e.printStackTrace();
		}
		 
		 if(spassword.equals(pass)&&status==2){
			 request.getSession().setAttribute("email", email);
			 if(s==2){
				 out.print("home");
		}
			 else{out.print("admin");}
			
			 }
		else{

		out.print("incorrect email or password!");
			  }}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

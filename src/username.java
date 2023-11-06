

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
import javax.servlet.http.HttpSession;

import pass.connection;

/**
 * Servlet implementation class username
 */
@WebServlet("/username")
public class username extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public username() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");  
        PrintWriter out=response.getWriter();
		HttpSession session=request.getSession(false); 
		String email=(String)session.getAttribute("email");
		connection con= new connection();
		if(email!=null) {
		int log_id=0;
		 String name=null;
		try{
			 
		
				
			PreparedStatement str3=con.getPreparedstatement("select loid from Login where loemail=?");
			str3.setString(1,email);
			ResultSet rst=str3.executeQuery();
			while(rst.next()) {
				log_id=rst.getInt(1);
			}			
			PreparedStatement str1=con.getPreparedstatement("select uname from registration where loidfk=?");
			
			str1.setInt(1,log_id);
			ResultSet rst1=str1.executeQuery();
			while(rst1.next()) {
				name=rst1.getString(1);
			}}
			catch(Exception e){
	 			out.print(e);
	 		}
	out.print(name);}
		else {}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

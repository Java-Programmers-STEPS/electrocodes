

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
import javax.servlet.http.HttpSession;

import pass.connection;

/**
 * Servlet implementation class passchange
 */
@WebServlet("/passchange")
public class passchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public passchange() {
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
		 if(email!=null){
		    String cupass=request.getParameter("cupass"); 
		 	String npass=request.getParameter("npass");
		 	String passk=null;
		 	String pass=null;
		 	String spassword=null;
		 	String newpass=null;
		 	try{
		 		
		 		PreparedStatement str=con.getPreparedstatement("select lokey,lopassword from Login where loemail=?");
		 		str.setString(1,email);
		 		ResultSet rst=str.executeQuery();
		 		while(rst.next()){
		 			passk=rst.getString(1);
		 			pass=rst.getString(2);
		 		}
		 	}
		 	catch(Exception e){
		 		out.print(e);
		 	}
		 	 try {
		 		  String saltd_password=cupass+passk;
		 	     spassword= Base64.getEncoder().encodeToString(saltd_password.getBytes());
		 	     
		 	    } 
		 	 catch (Exception e) {
		 	 
		 	    e.printStackTrace();
		 	} 
		 	if(spassword.equals(pass)){
		 		try{
		 	
		 			
		 	PreparedStatement str=con.getPreparedstatement("update Login set lopassword=? where loemail=?");
		 	try {
				  String saltd_password=npass+passk;
			    newpass= Base64.getEncoder().encodeToString(saltd_password.getBytes());
			     
			    } 
			 catch (Exception e) {
			 
			    e.printStackTrace();
			} 
		 	str.setString(1,newpass);
		 	str.setString(2,email);
		 	int i=str.executeUpdate();
		 	
		 	if(i>0){
		 	out.print("updated"); 
		 
		 	}
		 	else {    
		 out.print("error!"); 
		 
		 	}}
		 		
		 		
		 	catch(Exception e){
		 		out.print(e);
		 	}
		 		
		 }
		 	else {
		 	
		 	out.print("password incorrect!");
		 	
		}
		     }
		     else{
		     
		     out.print("please login first!");
		    
		     	}
		     
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

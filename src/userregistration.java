

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Base64;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pass.connection;

/**
 * Servlet implementation class userregistration
 */
@WebServlet("/userregistration")
public class userregistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userregistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");System.out.println(name);
		String email=request.getParameter("email"); 
		String phone=request.getParameter("phoneno");
		String password=request.getParameter("password");
		String key=null;
		String spassword=null;
		connection con= new connection();

		 int type=2;
		 try {
			
		    UUID uuid=UUID.randomUUID();
		     key=uuid.toString();
		     String saltd_password=password+key;
		     spassword= Base64.getEncoder().encodeToString(saltd_password.getBytes());
		     
		    
		   		 
		} catch (Exception e) {
		 
		    e.printStackTrace();
		} 
		 try{
				
			PreparedStatement str1=con.getPreparedstatement("INSERT INTO Login(loemail,lokey,lopassword,lousertype,lostatus)VALUES(?,?,?,?,?)");
			str1.setString(1,email);
			str1.setString(2,key);
			str1.setString(3,spassword);
			str1.setInt(4,type);
			str1.setInt(5, 1);
			int j=str1.executeUpdate();
			
			if(j>0) {
			
			
			
				int log_id=0;
			
			
			PreparedStatement str=con.getPreparedstatement("select loid from Login where loemail=?");
			str.setString(1,email);
			
			ResultSet rst=str.executeQuery();
			while(rst.next()) {
				log_id=rst.getInt(1);
			}
			PreparedStatement str2=con.getPreparedstatement("INSERT INTO registration(uname,uphone,loidfk)VALUES(?,?,?)");
			str2.setString(1, name);
			str2.setString(2, phone);
			str2.setInt(3, log_id);
			int k=str2.executeUpdate();
				if(k>0) {
					
						response.sendRedirect("enteremail.jsp?name="+name);  
					    
					      
					  
					}
						
						
					
					
					
		
		
			else{
				out.print("Registration Error!!.."); 
			}
			
		
			
			}else {
				System.out.println("login table insertion error");
			}
			
			
			
			}
			catch(Exception e){
				out.print(e);
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

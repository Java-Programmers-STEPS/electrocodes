

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
 * Servlet implementation class cartnumber
 */
@WebServlet("/cartnumber")
public class cartnumber extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartnumber() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession(false); 
		String email=(String)session.getAttribute("email"); 
		connection con= new connection();
		int loid=0;
		int count=0;
 if(email!=null){
			 
			 try{
				 	
					
		PreparedStatement ps1=con.getPreparedstatement("select loid from Login where loemail =?");	 
		 ps1.setString(1, email);
		 ResultSet rs=ps1.executeQuery();  	
		 while(rs.next()) {
				loid = rs.getInt(1);
		 
		 }
		 PreparedStatement ps2=con.getPreparedstatement("select count(cproid) from carttable where cuseremail =?");
		 ps2.setInt(1,loid);
		 ResultSet rs1=ps2.executeQuery();  
		 while(rs1.next()) {
				count = rs1.getInt(1);
		 
		 }
	}
			 catch(Exception e){
				 out.print(e);
			 }
			 out.print(count);}
 else{out.print("0");}
	}
			 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

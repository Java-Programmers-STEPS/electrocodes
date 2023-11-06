

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
 * Servlet implementation class subscription
 */
@WebServlet("/subscription")
public class subscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public subscription() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String ema=request.getParameter("email"); 
		String email1= null;
		connection con= new connection();
		 try{
			 	
				
PreparedStatement ps1=con.getPreparedstatement("select semail from subscribe where semail = ?");	 
				 ps1.setString(1, ema);
				 ResultSet rs1=ps1.executeQuery();  	
				 while(rs1.next()) {
						email1 = rs1.getString(1);
					
						}
				if(email1==null|| email1=="") {
				
		PreparedStatement ps=con.getPreparedstatement("insert into subscribe (semail) values (?)");	 
		 ps.setString(1, ema);
		
		 int i=ps.executeUpdate();  
			 if(i>0) {
				 out.print("Subscribed");} }
			 else {out.print("Already subscribed");}
				
		 }catch(Exception e){
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

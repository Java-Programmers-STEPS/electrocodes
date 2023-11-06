

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
 * Servlet implementation class deletecart
 */
@WebServlet("/deletecart")
public class deletecart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deletecart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid,n=0 ;
		String pid=request.getParameter("id");
		   n=Integer.parseInt(pid);
			PrintWriter out=response.getWriter();
			connection con= new connection();
		try
	    {  
        PreparedStatement ps1=con.getPreparedstatement("select carttable.cid from carttable inner join producttable on carttable.cproid=producttable.proid  where proid =?");	 
		 ps1.setInt(1, n);
		 ResultSet rs1=ps1.executeQuery();  	
		 while(rs1.next()) {
				cid = rs1.getInt(1); 
		    System.out.println(cid);
		    
		    PreparedStatement stmt=con.getPreparedstatement("delete from carttable where cid=?");  	    
		    stmt.setInt(1, cid);
		    stmt.executeUpdate();  
		  out.print("d");
		    
		 
		 
		 }
	    }catch(Exception e){out.print(e);}}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}



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
 * Servlet implementation class removeItem
 */
@WebServlet("/removeItem")
public class removeItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public removeItem() {
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
		 if(email!=null){
			String sid=request.getParameter("id");
			int id=Integer.parseInt(sid);
			 System.out.println(id);
			
			 try{
				 	
					
			PreparedStatement str=con.getPreparedstatement("DELETE from producttable where proid=?");
			str.setInt(1,id);
			int i=str.executeUpdate();
		 	if(i>0){
		     
		    out.print("product removed");  
		}
			else{  
		  
		    out.print("Error");  
		   }
		 }
				catch(Exception e){
	 			out.print(e);}
		 }
	}
		 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

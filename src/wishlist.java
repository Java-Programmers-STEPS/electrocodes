

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
 * Servlet implementation class wishlist
 */
@WebServlet("/wishlist")
public class wishlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public wishlist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();

		String name=request.getParameter("id");  
		connection con= new connection();
		
	int l=0;
		int quty=0;
	
	
		int id=Integer.parseInt(name);
		
	int loid=0;
	int proid=0;
	HttpSession session=request.getSession(false); 
	String email=(String)session.getAttribute("email"); 
	
	
	

		 if(email!=null){
			 
			 try{
				 	
					
		PreparedStatement ps1=con.getPreparedstatement("select loid from Login where loemail =?");	 
		 ps1.setString(1, email);
		 ResultSet rs=ps1.executeQuery();  	
		 while(rs.next()) {
				loid = rs.getInt(1);
		 
		 }
	
		 PreparedStatement ps2=con.getPreparedstatement("select wproid from wishlist where wuseremail =?");
		 ps2.setInt(1,loid);
		 ResultSet rs1=ps2.executeQuery();  
		 while(rs1.next()) {
				proid = rs1.getInt(1);
				 if(id==proid) { 
					 l=1;
					 break;}
		 }
		if(l==1) {out.print("cart");}
		 else {
		PreparedStatement ps=con.getPreparedstatement("insert into wishlist (wuseremail,wproid)  values( ?,?)");	 
			 ps.setInt(1, loid);
			 ps.setInt(2, id);
			
			 
			 int i=ps.executeUpdate();  
			 
			 if(i>0) {
				out.print("updated"); 
			 }}
			 
			 }catch(Exception e){
				 out.print(e);
			 }
			 
		 }else {
			 out.print("login");
		 }
		 System.out.println("cart");
		// request.getRequestDispatcher("index.jsp").include(request, response); 
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}



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
 * Servlet implementation class wishtocart
 */
@WebServlet("/wishtocart")
public class wishtocart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public wishtocart() {
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
		int wproid=0;
		int cproid=0;
		int n=0;
		int q=1;
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
				wproid = rs1.getInt(1);
				 PreparedStatement ps3=con.getPreparedstatement("select cproid from carttable where cuseremail =?");
				 ps3.setInt(1,loid);
				 ResultSet rs3=ps3.executeQuery();
				 while(rs3.next()) {
						cproid = rs3.getInt(1);
				if(wproid==cproid) { n=1;
				break;}
				}
				if(n!=1) {
					n=0;
					PreparedStatement ps=con.getPreparedstatement("insert into carttable (cuseremail,cproid,cproqut)  values( ?,?,?)");	 
					 ps.setInt(1, loid);
					 ps.setInt(2, wproid);
					 ps.setInt(3, q);
					 ps.executeUpdate();  
				}
				else {
					n=0;
				}
					
				}
		 PreparedStatement ps3=con.getPreparedstatement("delete from wishlist where wuseremail=?");
				 ps3.setInt(1,loid);
				int i=ps3.executeUpdate(); 
				if(i>=0) {out.print("up");}
			 }
				 
			 catch(Exception e){
					out.print(e);
			}
		 
		 
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

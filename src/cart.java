

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
 * Servlet implementation class cart
 */
@WebServlet("/cart")
public class cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out=response.getWriter();

		String name=request.getParameter("id");  
		String qut=request.getParameter("qut");
		System.out.println(qut+"dsfdsfdsf");
		connection con= new connection();
		int procount=0;
		int y=0;
	int l=0;
		int quty=0;
	
	if(qut!=null) {	quty=Integer.parseInt(qut);}
		int id=Integer.parseInt(name);
		System.out.println(id);
	int loid=0;
	int proid=0;
	HttpSession session=request.getSession(false); 
	String email=(String)session.getAttribute("email"); 
	int q  = 0;	
	if(qut==null) {q  = 1;}
	else {q=quty;}

		 if(email!=null){
			 
			 try{
				 
				 PreparedStatement ps7=con.getPreparedstatement("select procount from producttable where proid =?");
				 ps7.setInt(1,id );
				 ResultSet rs7=ps7.executeQuery(); 
				 while(rs7.next()) {
						procount = rs7.getInt(1);
						if(procount<q) {
							
						y=1;
						
						}
				 
				 }
				 
				 
				 
				 
		PreparedStatement ps1=con.getPreparedstatement("select loid from Login where loemail =?");	 
		 ps1.setString(1, email);
		 ResultSet rs=ps1.executeQuery();  	
		 while(rs.next()) {
				loid = rs.getInt(1);
		 
		 }
		
		 PreparedStatement ps2=con.getPreparedstatement("select cproid from carttable where cuseremail =?");
		 ps2.setInt(1,loid);
		 ResultSet rs1=ps2.executeQuery();  
		 while(rs1.next()) {
				proid = rs1.getInt(1);
				

				 if(id==proid) { 
					 l=1;
					 break;}
		 }
		if(l==1 || y==1) {out.print("cart");}
		 else {
		PreparedStatement ps=con.getPreparedstatement("insert into carttable (cuseremail,cproid,cproqut)  values( ?,?,?)");	 
			 ps.setInt(1, loid);
			 ps.setInt(2, id);
			 ps.setInt(3, q);
			 
			 int i=ps.executeUpdate();  
			 
			 if(i>0) {
				out.print("updated"); 
			 }}
			 
			 }catch(Exception e){
				 out.print(e);
			 }
			 
		 }
		 else {
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

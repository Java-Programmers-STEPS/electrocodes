

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
 * Servlet implementation class addqty
 */
@WebServlet("/addqty")
public class addqty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addqty() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cid,n=0 ;
		int y=0;
		int procount=0;
		int m=0;
		String pid=request.getParameter("id");
		String z=request.getParameter("quantity");
		   n=Integer.parseInt(pid); 
		   y=Integer.parseInt(z);
		PrintWriter out=response.getWriter();
		connection con= new connection();
		try{
		
			
			PreparedStatement ps7=con.getPreparedstatement("select procount from producttable where proid =?");
			 ps7.setInt(1,n );
			 ResultSet rs7=ps7.executeQuery(); 
			 while(rs7.next()) {
					procount = rs7.getInt(1);
					if(procount<y) {
						
					m=1;
					
					}
			 
			 }
			
if(m!=1) {
	
		PreparedStatement str=con.getPreparedstatement("update carttable  set cproqut=? where cproid=? ");
	str.setInt(1, y);
	str.setInt(2, n);

	int i=str.executeUpdate(); 
	if(i>0) {
	
	  out.print("d");
	}}
else {
	 out.print("Maximum quantity ="+procount);
}

	
}catch(Exception e){
			out.print(e);}
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

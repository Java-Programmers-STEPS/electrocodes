

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pass.connection;

/**
 * Servlet implementation class image3
 */
@WebServlet("/image3")
public class image3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public image3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
String pid = request.getParameter("id");
int id=Integer.parseInt(pid);
		  
        
        java.sql.Blob image1 =null; 
      
  byte[ ] imgData1 = null ;

  ResultSet rs = null;
	connection con= new connection();
  try{
		
		PreparedStatement ps =con.getPreparedstatement("select proimage3 from producttable  where proid =?"); 
	ps.setInt(1, id);
	try {
	
	    rs = ps.executeQuery();
     while(rs.next()) {
   image1 = rs.getBlob(1);
  
     }}
    
	catch (Exception e1) {e1.printStackTrace();}

	  if(image1!=null) {

		try {
			imgData1 = image1.getBytes(1,(int)image1.length());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	

	response.setContentType("image/jpg");
	OutputStream o =response.getOutputStream();
   o.write(imgData1);
   
   o.flush();
   o.close();
	  }
	  else {  
		  System.out.println("pic not uploaded");}
	  
   }catch(Exception e) {System.out.println(e);}}
	  
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

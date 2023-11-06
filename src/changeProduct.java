

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import pass.connection;

/**
 * Servlet implementation class changeProduct
 */
@WebServlet("/changeProduct")
@MultipartConfig
public class changeProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changeProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession(false); 
		String email=(String)session.getAttribute("email"); 
		connection con= new connection();
		 if(email!=null){
			 String pid=request.getParameter("sel");
			 int id=Integer.parseInt(pid);
			 String name=request.getParameter("pname"); 
			 	String brand=request.getParameter("pbrand");
				String model=request.getParameter("pmodel");
				String rs=request.getParameter("pprice");
				int price=Integer.parseInt(rs);
			 InputStream inputStream1 = null; 
			InputStream inputStream2 = null;
			InputStream inputStream3 = null;
			 Part IMAGE1 = request.getPart("IMAGE1"); 
			 Part IMAGE2 = request.getPart("IMAGE2"); Part IMAGE3 =
			  request.getPart("IMAGE3");
			 
			
				try {
					if (IMAGE1 != null ) {
						inputStream1=IMAGE1.getInputStream();
					}
				
				 if (IMAGE2 != null ) { inputStream2=IMAGE2.getInputStream(); } if (IMAGE3 !=
				 null ) { inputStream3=IMAGE3.getInputStream(); }
				
						
			}
				catch(Exception e){
					out.print(e);
			}
				
				String pcount=request.getParameter("pcount");
				int count=Integer.parseInt(pcount);
				String category=request.getParameter("pcategory");
				String description=request.getParameter("pdescription");
				
				try{
				 	
					
			PreparedStatement str=con.getPreparedstatement("update producttable set proname=?,proprice=?,pbrand=?,procategory=?,promodel=?,prodescription=?,proimage1=?,proimage2=?,proimage3=?,procount=? where proid=?");
			str.setString(1,name);
		 	str.setInt(2,price);
		 	str.setString(3,brand);
		 	str.setString(4,category);
		 	str.setString(5,model);
		 	str.setString(6,description);
				 str.setBlob(7,inputStream1);
				
			str.setBlob(8,inputStream2); 
			str.setBlob(9,inputStream3);
			
		 	str.setInt(10,count);
		 	str.setInt(11, id);
		 	int i=str.executeUpdate();
		 	if(i>0){request.getRequestDispatcher("admin.jsp").include(request, response);   
		    out.println("<p style='color:red;'>");    
		    out.print("product updated");  
		    out.println("</p>"); }
			else{request.getRequestDispatcher("admin.jsp").include(request, response);   
		    out.println("<p style='color:red;'>");    
		    out.print("Error");  
		    out.println("</p>"); }
		 }
				catch(Exception e){
	 			out.print(e);}
				}
}}

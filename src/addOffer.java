

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
 * Servlet implementation class addOffer
 */
@WebServlet("/addOffer")
public class addOffer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addOffer() {
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
			 String pid=request.getParameter("sel");
			 int id=Integer.parseInt(pid);
			 String offe=request.getParameter("poffer");
			 int offer=Integer.parseInt(offe);
			 String pdays=request.getParameter("pdays");
			 String phours=request.getParameter("phours");
			 String pminutes=request.getParameter("pminutes");
			 String pseconds=request.getParameter("pseconds");
			 int hours=Integer.parseInt(phours);
			 int minutes=Integer.parseInt(pminutes);
			 int seconds=Integer.parseInt(pseconds);
			 int days=Integer.parseInt(pdays);
			 int currentprice = 0;int offer1;int newprice=0;
			 try{
				 	
					
		
					 	PreparedStatement ps=con.getPreparedstatement("select proprice from producttable where proid=?");	
				 ps.setInt(1,id);
				   ResultSet rs = ps.executeQuery(); 
				 while(rs.next()){
					    currentprice=rs.getInt(1);	
				}	if(offer>0) {
					 offer1 = 100-offer ;
					 newprice = currentprice*offer1/100;  
				 }
		
					
					PreparedStatement str=con.getPreparedstatement("update producttable set prooffr=?,offerhours=?,offerminutes=?,offerseconds=?,offerdays=?,discountprice=? where proid=?");
			str.setInt(1,offer);
		 	str.setInt(2,hours);
		 	str.setInt(3,minutes);
		 	str.setInt(4,seconds);
		 	str.setInt(5,days);
		 	str.setInt(6,newprice);
		 	str.setInt(7,id);
		 	int i=str.executeUpdate();
			if(i>0){request.getRequestDispatcher("admin.jsp").include(request, response);   
		    out.println("<p style='color:red;'>");    
		    out.print("offer added ");  
		    out.println("</p>"); }
			else{request.getRequestDispatcher("admin.jsp").include(request, response);   
		    out.println("<p style='color:red;'>");    
		    out.print("Error");  
		    out.println("</p>"); }
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

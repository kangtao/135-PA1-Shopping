package login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

import register.*;
@WebServlet("/hello-world")
/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet 
{

	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			           throws ServletException, java.io.IOException 
	{
		HttpSession session = request.getSession(true);
	    session.setAttribute("currentSessionUserName",null); 
	    session.setAttribute("currentSessionUserRole",null); 
	    session.setAttribute("currentSessionUserID",null); 
	    session.setAttribute("currentIllegalSessionUserName",null); 
		session.setAttribute("insertProductFailure",null); 


		try
		{	    
			User user = new User();
			user.setUname(request.getParameter("uname"));
			user = LoginDAO.login(user);
	   		    
		if (user.isValid())
		{
	        
          //HttpSession session = request.getSession(true);
          String name = user.getUname();
          String role = user.getUrole();
          String id = user.getUID();
          //System.out.print("ROLE!@@@@"+ role);
          session.setAttribute("currentSessionUserName",name); 
          session.setAttribute("currentSessionUserRole",role); 
          session.setAttribute("currentSessionUserID",id); 
          System.out.println("ID!!!!!!!$$$!"+id);
          session.setAttribute("currentIllegalSessionUserName",null); 
          session.setAttribute("cart", new ArrayList<ArrayList<String>>());
          response.sendRedirect("Home.jsp"); //logged-in page      		
		}
	        
     else 
     {
    	 //HttpSession session = request.getSession(true);
		 session.setAttribute("currentIllegalSessionUserName",request.getParameter("uname")); 
         response.sendRedirect("Login.jsp"); //error page 
          
     }
} 
		
		
catch (Throwable theException) 	    
{
     System.out.println(theException); 
}
       }
	}

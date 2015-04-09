package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import register.*;
@WebServlet("/hello-world")
/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {

	 
public void doGet(HttpServletRequest request, HttpServletResponse response) 
			           throws ServletException, java.io.IOException {
	System.out.print("get int oservlts");
try
{	    

     User user = new User();
     user.setUname(request.getParameter("uname"));
     user = LoginDAO.login(user);
	   		    
     if (user.isValid())
     {
	        
          HttpSession session = request.getSession(true);	    
          session.setAttribute("currentSessionUser",user); 
          response.sendRedirect("userLogged.jsp"); //logged-in page      		
     }
	        
     else 
          response.sendRedirect("invalidLogin.jsp"); //error page 
} 
		
		
catch (Throwable theException) 	    
{
     System.out.println(theException); 
}
       }
	}

package login;
import java.text.*;
import java.util.*;
import java.sql.*;
import register.*;
public class LoginDAO 
{
	 static Connection currentCon = null;
     static ResultSet rs = null;  
	
	 public static User login(User bean) 
	 {
	
        //preparing some objects for connection 
        Statement stmt = null;    
        String username = bean.getUname();    
	    String searchQuery = "select * from users where name='"+ username + "'";         
	    try 
	    {
	    	//connect to DB 
	    	currentCon = ConnectionManager.getConnection();
	    	stmt=currentCon.createStatement();
	    	rs = stmt.executeQuery(searchQuery);	        
	    	boolean more = rs.next();
	    	if (!more) 
	    	{
	    		bean.setValid(false);
	    	} 
	        
	    	else if (more) 
	    	{
	    		String role = rs.getString("role");
	    		String id = rs.getString("id");
	    		bean.setUID(id);
	    		bean.setUrole(role);
	    		bean.setValid(true);
	    	}
	    }	 
	    catch (Exception ex) 
	    {
	    	System.out.println("Log In failed: An Exception has occurred! " + ex);
	    } 
	    
	    //some exception handling
	    finally 
	    {
	    	if (rs != null)	
	    	{
	    		try 
	    		{
	    			rs.close();
	    		} 
	    		catch (Exception e) {}
	    		rs = null;
	    	}
	    	if (stmt != null) 
	    	{
	    		try 
	    		{
	    			stmt.close();
	    		} 
	    		catch (Exception e) {}
              stmt = null;
	    	}
	    	if (currentCon != null) 
	    	{
	    		try 
	    		{
	    			currentCon.close();
	    		} catch (Exception e) {}
	    		currentCon = null;
	    	}
	    }

	    return bean;
	
	 }	
}



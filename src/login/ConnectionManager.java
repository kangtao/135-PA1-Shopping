package login;

import static register.Provider.CONNECTION_URL;
import static register.Provider.DRIVER;
import static register.Provider.PASSWORD;
import static register.Provider.USERNAME;
import java.sql.*;


public class ConnectionManager 
{

   static Connection con;
   static String url;
         
   public static Connection getConnection()
   {
	   try
	   {
		   Class.forName(DRIVER);
		   try
		   {            	
			   con = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD); 

		   }
		   catch (SQLException ex)
		   {
			   ex.printStackTrace();
		   }
       }
	   catch(ClassNotFoundException e)
	   {
		   System.out.println(e);
	   }

	   return con;
   }
}
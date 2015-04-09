package login;

import static register.Provider.CONNECTION_URL;
import static register.Provider.DRIVER;
import static register.Provider.PASSWORD;
import static register.Provider.USERNAME;

import java.sql.*;
import java.util.*;

import register.*;

public class ConnectionManager {

   static Connection con;
   static String url;
         
   public static Connection getConnection()
   {
     
      try
      {
         //String url = "jdbc:odbc:" + "DataSource"; 
         // assuming "DataSource" is your DataSource name

         Class.forName(DRIVER);
         
         try
         {            	
            con = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD); 
             								
         // assuming your SQL Server's	username is "username"               
         // and password is "password"
              
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
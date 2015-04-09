package register;

import java.sql.*;

public class RegisterDao {

	public static int register(User u){
		int status=0;
		try{
				Connection con=ConnectionProvider.getCon();
				PreparedStatement ps=con.prepareStatement("insert into e1 values(?,?,?,?)");
				ps.setString(1,u.getUname());
				ps.setString(2,u.getUrole());
				ps.setInt(3,u.getUage());
				ps.setString(4,u.getUstate());
			
				status=ps.executeUpdate();
				}
		catch(Exception e)
		{
			System.out.print("!!!");
			
		}
		
		return status;
	}
	
}

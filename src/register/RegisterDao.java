package register;

import java.sql.*;

public class RegisterDao {

	public static int register(User u){
		int status=0;
		try{
				Connection con=ConnectionProvider.getCon();
				con.setAutoCommit(false);
				PreparedStatement ps=con.prepareStatement("insert into users(name,role,age,state) values(?,?,?,?)");
				//s.setInt(1,0);
				ps.setString(1,u.getUname());
				ps.setString(2,u.getUrole());
				ps.setInt(3,Integer.parseInt(u.getUage()));
				ps.setString(4,u.getUstate());
				status=ps.executeUpdate();
				//ps.executeUpdate();
				con.commit();
				
				}
		catch(Exception e)
		{
			
			System.out.print(e);
			
		}
		
		return status;
	}
	
}

package Query;

import java.sql.*;
import NewUser.*;

public class PerfromQuery 
{
	public static Connection con;
	
	public PerfromQuery(Connection con)
	{
		this.con=con;
	}
	
	public static boolean isRegister(User u) throws SQLException
	{
		boolean f=false;
		
		PreparedStatement pst=con.prepareStatement("insert into UserDeatils (name,email,phone,password) values(?,?,?,?)");
		
		pst.setString(1, u.getUserName());
		pst.setString(2, u.getEmail());
		pst.setString(3, u.getPhno());
		pst.setString(4, u.getPassword());
		
		int n=pst.executeUpdate();
		
		if(n!=0) f=true;
		
		
		
		return f;
	}
	
	public static boolean isValid(int id , String password) throws SQLException
	{
		
		boolean f=false;
		//System.out.println("valid "+id+password);
		
		String sql="select * from UserDeatils where id=? and password=?";
		
		PreparedStatement pst=con.prepareStatement(sql);
		pst.setInt(1, id);
		pst.setString(2, password);
		ResultSet rs=pst.executeQuery();
		
		while(rs.next())
		{
			f=true;
		}
		
		return f;
		
	}
	
	public static boolean updateUser(User us) throws SQLException
	{
		boolean f=false;
		
		String sql="update UserDeatils set name=?,email=?,phone=? where  password=?";
		
		PreparedStatement pst=con.prepareStatement(sql);
		
		pst.setString(1,us.getUserName());
		pst.setString(2, us.getEmail());
		pst.setString(3, us.getPhno());
		
		pst.setString(4, us.getPassword());
		
		int n=pst.executeUpdate();
		
		if(n!=0)
		{
			f=true;
		}
		return f;
	}
	
	

}

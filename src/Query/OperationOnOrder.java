package Query;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import NewUser.*;

public class OperationOnOrder 
{
	
	private static Connection con;
	
	public OperationOnOrder(Connection con)
	{
		this.con=con;
	}
	
	
	public static boolean placeOrder(OrederEntity o) throws SQLException
	{
		boolean f=false;
		try
		{
			String sql="insert into Orders(bid,cid,bookname,price,username,email,phone,pin,city,state) values(?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement pst=con.prepareStatement(sql);
			
			
			pst.setInt(1, o.getBid());
			pst.setInt(2, o.getCid());
			pst.setString(3, o.getBookname());
			pst.setString(4,o.getPrice());
			pst.setString(5, o.getUsername());
			pst.setString(6,o.getEmail());
			pst.setString(7,o.getPhone());
			pst.setInt(8, o.getPin());
			pst.setString(9, o.getCity());
			pst.setString(10, o.getState());
			
			int n=pst.executeUpdate();
			
			if(n!=0) f=true;
			
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		finally
    	{
    		con.commit();
    		//con.close();
    	}
		return f;
		
	}
	
	
	 public ArrayList<OrederEntity> getOrderedBooks(int id) throws SQLException
	    {
	    	ArrayList<OrederEntity> ar=new ArrayList<>();
	    	
	    	OrederEntity nb=null;
	    	try
	    	{
	    		String sql="select * from Orders where cid=?";
	    		
	    		PreparedStatement pst=con.prepareStatement(sql);
	    		pst.setInt(1, id);
	    		
	    		ResultSet rs=pst.executeQuery();
	    		
	    		while(rs.next())
	    		{
	    			nb=new OrederEntity();
	    			
	    			
	    			//System.out.println(rs.getInt(1));
	    			nb.setBid(rs.getInt(2));
	    			nb.setBookname(rs.getString(4));
	    			nb.setPrice(rs.getString(5));
	    			nb.setPin(rs.getInt(9));
	    			nb.setCity(rs.getString(10));
	    			nb.setState(rs.getString(11));
	    			
	    			
	    			ar.add(nb);
	    		}
	    		
	    		
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    	}
	    	finally
	    	{
	    		con.commit();
	    		//con.close();
	    	}
	    	return ar;
	    }
	 
	 
	 public boolean deleteOrder(int id,String cid) throws SQLException
	    {
	    	boolean f=false;
	    	
	    	try
	    	{
	    		
	    		
	    		String sql="delete from Orders where bid = ? and email=?";
	    		
	    		PreparedStatement pst=con.prepareStatement(sql);
	    		pst.setInt(1, id);
	    		pst.setString(2, cid);
	    		
	    		int i=pst.executeUpdate();
	    		
	    		System.out.println(i+" "+id+" "+cid);
	    		if(i>0)
	    		{
	    			
	    			f=true;
	    		}
	    		
	    		
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    	}
	    	finally
	    	{
	    		con.commit();
	    		//con.close();
	    	}
	    	return f;
	    }


	 
	 public ArrayList<OrederEntity> getAllOrderedBooks() throws SQLException
	    {
	    	ArrayList<OrederEntity> ar=new ArrayList<>();
	    	
	    	OrederEntity nb=null;
	    	try
	    	{
	    		String sql="select * from Orders order by oid desc";
	    		
	    		PreparedStatement pst=con.prepareStatement(sql);
	    	
	    		
	    		ResultSet rs=pst.executeQuery();
	    		
	    		while(rs.next())
	    		{
	    			nb=new OrederEntity();
	    			
	    			
	    			//System.out.println(rs.getInt(1));
	    			nb.setBid(rs.getInt(2));
	    			
	    			nb.setBookname(rs.getString(4));
	    			nb.setPrice(rs.getString(5));
	    			nb.setUsername(rs.getString(6));
	    			nb.setEmail(rs.getString(7));
	    			nb.setPhone(rs.getString(8));    			
	    			nb.setPin(rs.getInt(9));
	    			nb.setCity(rs.getString(10));
	    			nb.setState(rs.getString(11));
	    			
	    			
	    			ar.add(nb);
	    		}
	    		
	    		
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    	}
	    	finally
	    	{
	    		con.commit();
	    		//con.close();
	    	}
	    	return ar;
	    }	 
}

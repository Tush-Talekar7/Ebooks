package Query;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import NewUser.CartEntity;
import NewUser.NewBook;

public class OperationsOnCart 
{
	private Connection con;
	public OperationsOnCart(Connection con)
	{
		this.con=con;
	}
	
	public boolean addCart(CartEntity c)
	{
		boolean f=false;
		
		try
		{
			String s="select * from cart where bid=? and u_id=?";
			PreparedStatement pst1=con.prepareStatement(s);
			pst1.setInt(1, c.getBid());
			pst1.setInt(2, c.getUid());
			
			ResultSet rs=pst1.executeQuery();
			
			 if(!rs.next())
			 {
					String sql="insert into cart(bid,u_id,bookname,author,price,total_price,photo) values(?,?,?,?,?,?,?)";
					
					PreparedStatement pst=con.prepareStatement(sql);
					pst.setInt(1, c.getBid());
					pst.setInt(2, c.getUid());
					pst.setString(3, c.getBookName());
					pst.setString(4, c.getAuthor());
					pst.setString(5,c.getPrice());
					pst.setString(6, c.getTotalPrice());
					pst.setString(7, c.getPhoto());
					
					int i=pst.executeUpdate();
					
					if(i==1)
					{
						f=true;
						
					}
					
			
			}
			
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return f;
	}

	public ArrayList<NewBook> getBooksInCart(int id)
	{
		ArrayList<NewBook> ar=new ArrayList<>();
		
		NewBook nb=null;
		
		try
		{
			String sql="select * from cart where u_id=? order by cid desc";
			
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1, id);
			
			ResultSet rs=pst.executeQuery();
			
			while(rs.next())
			{
				nb=new NewBook();
				nb.setId(rs.getInt(2));
				nb.setBookName(rs.getString(4));
				nb.setPrice(rs.getString(6));
				nb.setPhoto(rs.getString(8));
				nb.setAuthor(rs.getString(5));
				
				
				ar.add(nb);
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return ar;
	}

	public boolean deleteBook(int id,String cid) throws SQLException
    {
    	boolean f=false;
    	
    	try
    	{
    		
    		String sql="delete from Cart where bid = ? and u_id=?";
    		
    		PreparedStatement pst=con.prepareStatement(sql);
    		pst.setInt(1, id);
    		pst.setString(2, cid);
    		
    		int i=pst.executeUpdate();
    		
    		
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


}

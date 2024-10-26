package Query;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.io.File;
import java.io.IOException;

import NewUser.NewBook;
import NewUser.Review;

public class OperationOnBooks {

    private Connection con;

    public OperationOnBooks (Connection con) {
        this.con = con;
    }

    public boolean addBooks(NewBook book) throws SQLException {
        boolean f = false;

        try {
            String sql = "insert into Books(bookname,author,price,category,photo,use_email) values(?,?,?,?,?,?)";

            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, book.getBookName());
            pst.setString(2, book.getAuthor());
            pst.setString(3, book.getPrice());
            pst.setString(4, book.getCategory());
            pst.setString(5, book.getPhoto());
            pst.setString(6, book.getEmail());

            int n = pst.executeUpdate();

            if (n > 0) {
                f = true;
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally
    	{
    		con.commit();
    		//con.close();
    	}
        return f;
    }
    
    public ArrayList<NewBook> getAllBooks() throws SQLException
    {
    	ArrayList<NewBook> ar=new ArrayList<>();
    	
    	NewBook nb=null;
    	try
    	{
    		String sql="select * from Books";
    		
    		PreparedStatement pst=con.prepareStatement(sql);
    		
    		ResultSet rs=pst.executeQuery();
    		
    		while(rs.next())
    		{
    			nb=new NewBook();
    			
    			nb.setId(rs.getInt(1));
    			//System.out.println(rs.getInt(1));
    			nb.setBookName(rs.getString(2));
    			nb.setAuthor(rs.getString(3));
    			nb.setPrice(rs.getString(4));
    			nb.setCategory(rs.getString(5));
    			nb.setPhoto(rs.getString(6));
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

    public boolean deleteBook(int id) throws SQLException
    {
    	boolean f=false;
    	
    	try
    	{
    		
    		String sql="delete from Books where id = ? ";
    		
    		PreparedStatement pst=con.prepareStatement(sql);
    		pst.setInt(1, id);
    		
    		 //Path path = Paths.get("E:/DATA STRUCTURE/JSP/WebContent/"+photo);

    	       
    	            // Delete the file
//    	      Files.delete(path);
//    	      System.out.println("File deleted successfully.");
    	        
    		
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

    public ArrayList<NewBook> getNewBooks() throws SQLException
    {
    	ArrayList<NewBook> ar=new ArrayList<>();
    	NewBook nb=null;
    	
    	try
    	{
			String sql="select * from Books where category=? order by id desc";
			
			PreparedStatement pst=con.prepareStatement(sql);
			
			pst.setString(1, "New");
			
			ResultSet rs=pst.executeQuery();
			int i=0;
			while(rs.next() && i<4)
			{
				nb=new NewBook();
				
				nb.setId(rs.getInt(1));
				//System.out.println(rs.getInt(1));
				nb.setBookName(rs.getString(2));
				nb.setAuthor(rs.getString(3));
				nb.setPrice(rs.getString(4));
				nb.setCategory(rs.getString(5));
				nb.setPhoto(rs.getString(6));
				ar.add(nb);
				i++;
			}
			//System.out.println("Ar="+i);
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
    
    public ArrayList<NewBook> getOldBooks() throws SQLException
    {
    	ArrayList<NewBook> ar=new ArrayList<>();
    	NewBook nb=null;
    	
    	try
    	{
			String sql="select * from Books where category=? order by id desc";
			
			PreparedStatement pst=con.prepareStatement(sql);
			
			pst.setString(1, "Old");
			
			ResultSet rs=pst.executeQuery();
			int i=0;
			while(rs.next() && i<4)
			{
				nb=new NewBook();
				
				nb.setId(rs.getInt(1));
				//System.out.println(rs.getInt(1));
				nb.setBookName(rs.getString(2));
				nb.setAuthor(rs.getString(3));
				nb.setPrice(rs.getString(4));
				nb.setCategory(rs.getString(5));
				nb.setPhoto(rs.getString(6));
				ar.add(nb);
				i++;
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

    public ArrayList<NewBook> getRecentBooks() throws SQLException
    {
    	ArrayList<NewBook> ar=new ArrayList<>();
    	NewBook nb=null;
    	
    	try
    	{
			String sql="select * from Books order by id desc";
			
			PreparedStatement pst=con.prepareStatement(sql);
			
			
			
			ResultSet rs=pst.executeQuery();
			int i=0;
			while(rs.next() && i<4)
			{
				nb=new NewBook();
				
				nb.setId(rs.getInt(1));
				System.out.println(rs.getInt(1));
				nb.setBookName(rs.getString(2));
				nb.setAuthor(rs.getString(3));
				nb.setPrice(rs.getString(4));
				nb.setCategory(rs.getString(5));
				nb.setPhoto(rs.getString(6));
				ar.add(nb);
				i++;
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

    public ArrayList<NewBook> getAllRecentBooks() throws SQLException
    {
    	ArrayList<NewBook> ar=new ArrayList<>();
    	NewBook nb=null;
    	
    	try
    	{
			String sql="select * from Books order by id desc";
			
			PreparedStatement pst=con.prepareStatement(sql);
			
			
			
			ResultSet rs=pst.executeQuery();
			
			while(rs.next())
			{
				nb=new NewBook();
				
				nb.setId(rs.getInt(1));
				//System.out.println(rs.getInt(1));
				nb.setBookName(rs.getString(2));
				nb.setAuthor(rs.getString(3));
				nb.setPrice(rs.getString(4));
				nb.setCategory(rs.getString(5));
				nb.setPhoto(rs.getString(6));
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
    
    public ArrayList<NewBook> getAllNewBooks() throws SQLException
    {
    	ArrayList<NewBook> ar=new ArrayList<>();
    	NewBook nb=null;
    	
    	try
    	{
			String sql="select * from Books where category=? order by id desc";
			
			PreparedStatement pst=con.prepareStatement(sql);
			
			pst.setString(1,"New");

			ResultSet rs=pst.executeQuery();
			
			while(rs.next() )
			{
				nb=new NewBook();
				
				nb.setId(rs.getInt(1));
				//System.out.println(rs.getInt(1));
				nb.setBookName(rs.getString(2));
				nb.setAuthor(rs.getString(3));
				nb.setPrice(rs.getString(4));
				nb.setCategory(rs.getString(5));
				nb.setPhoto(rs.getString(6));
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

    public ArrayList<NewBook> getAllOldBooks() throws SQLException
    {
    	ArrayList<NewBook> ar=new ArrayList<>();
    	NewBook nb=null;
    	
    	try
    	{
			String sql="select * from Books where category=? order by id desc";
			
			PreparedStatement pst=con.prepareStatement(sql);
			
			pst.setString(1, "Old");
			
			ResultSet rs=pst.executeQuery();
			
			while(rs.next())
			{
				nb=new NewBook();
				
				nb.setId(rs.getInt(1));
				nb.setBookName(rs.getString(2));
				nb.setAuthor(rs.getString(3));
				nb.setPrice(rs.getString(4));
				nb.setCategory(rs.getString(5));
				nb.setPhoto(rs.getString(6));
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

    public NewBook getBookDetails(int id) throws SQLException
    {
    	
    	
    	NewBook nb=null;
    	try
    	{
    		String sql="select * from Books where id = ?";
    		
    		PreparedStatement pst=con.prepareStatement(sql);
    		pst.setInt(1, id);
    		
    		ResultSet rs=pst.executeQuery();
    		
    		while(rs.next())
    		{
    			nb=new NewBook();
    			
    			nb.setId(rs.getInt(1));
    			nb.setBookName(rs.getString(2));
    			nb.setAuthor(rs.getString(3));
    			nb.setPrice(rs.getString(4));
    			nb.setCategory(rs.getString(5));
    			nb.setPhoto(rs.getString(6));
    			
    		}
    		
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	finally
    	{
    		con.commit();
    	}
    	return nb;
    }

	public boolean addReview(Review review) throws SQLException
	{
		
		String sql="insert into Reviews values(?,?,?,?)";
		
		PreparedStatement pst=con.prepareStatement(sql);
		pst.setInt(1, review.getUid());
		pst.setInt(2, review.getBid());
		pst.setInt(3,review.getRating());
		pst.setString(4, review.getReview());
		//System.out.println("jk="+review.getReview());
		
		int n=pst.executeUpdate();
		con.commit();
		
		if(n>=1) return true;
		
		else return false;
	}
	
	public HashMap<String ,String> getReviews(int bid) throws SQLException
	{
		HashMap<String ,String> reviews=new HashMap<>();
		
		String sql="select * from reviews where bid="+bid;
		
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		
		//rs.next();
		
		
		while(rs.next())
		{
			//System.out.println("ID= "+rs.getInt(1)+" "+rs.getString(4));
			
			String sql2="select * from userdeatils where id="+rs.getInt(1);
			
			Statement st=con.createStatement();
			ResultSet rs1=st.executeQuery(sql2);
			if(rs1.next())			
			 reviews.put(rs1.getString(2), rs.getString(4));
		}
		
		
		return reviews;
		
	}
    
 
}

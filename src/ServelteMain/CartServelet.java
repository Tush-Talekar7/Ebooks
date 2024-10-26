package ServelteMain;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MakeConnection.GetConnection;
import NewUser.CartEntity;
import NewUser.NewBook;
import Query.OperationOnBooks;
import Query.OperationsOnCart;

@WebServlet("/Cart")
public class CartServelet extends HttpServlet
{
	public void doGet(HttpServletRequest req,HttpServletResponse res)
	{
		try
		{
			PrintWriter ps=res.getWriter();
			int uid=Integer.parseInt(req.getParameter("uid"));
			int bid=Integer.parseInt(req.getParameter("bid"));
			
			OperationOnBooks b=new OperationOnBooks(GetConnection.getConnection());
			NewBook book=b.getBookDetails(bid);
			
			CartEntity cart=new CartEntity();
			cart.setBid(bid);
			cart.setUid(uid);
			cart.setAuthor(book.getAuthor());
			cart.setBookName(book.getBookName());
			cart.setPrice(book.getPrice());
			cart.setTotalPrice(book.getPrice());
			cart.setPhoto(book.getPhoto());
			
			OperationsOnCart cp=new OperationsOnCart(GetConnection.getConnection());
			
			boolean f=cp.addCart(cart);
			
			if(f)
			{
				String s = "Added to cart Sucessfully";
			    ps.println("<script>alert('" + s + "'); window.location='user_cart.jsp';</script>");
			}
			else
			{
				String s = "Book Already Exist in Cart";
			    ps.println("<script>alert('" + s + "'); window.location='user_cart.jsp';</script>");
				
			}
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}
}

package ServelteMain;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MakeConnection.GetConnection;
import Query.OperationOnOrder;
import Query.OperationsOnCart;


@WebServlet("/deleteOrder")
public class deleteOrder extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		PrintWriter ps=res.getWriter();
		int id=Integer.parseInt(req.getParameter("id"));
		String cid=req.getParameter("cid");
		int c=Integer.parseInt(req.getParameter("c"));
		
		if(c==1) {
				try
				{
					
					
					OperationOnOrder op=new OperationOnOrder(GetConnection.getConnection());
					boolean f=op.deleteOrder(id,cid);
					
					if(f)
					{
					    String s = "Order Deleted Succesfully";
					    ps.println("<script>alert('" + s + "'); window.location='allOrderedBooks.jsp';</script>");
					}
					else
					{
		
					    String s = "Something went wrong";
					    ps.println("<script>alert('" + s + "'); window.location='allOrderedBooks.jsp';</script>");
					}
				}
				catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		else
		{
			try
			{
				
				
				OperationsOnCart op=new OperationsOnCart(GetConnection.getConnection());
				boolean f=op.deleteBook(id,cid);
				
				if(f)
				{
				    String s = "Item Deleted Succesfully";
				    ps.println("<script>alert('" + s + "'); window.location='user_cart.jsp';</script>");
				}
				else
				{
	
				    String s = "Something went wrong";
				    ps.println("<script>alert('" + s + "'); window.location='user_cart.jsp';</script>");
				}
			}
		
			catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
 }
}

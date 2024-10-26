package ServelteMain;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin_servelet.BooksAdd;

import MakeConnection.GetConnection;
import NewUser.NewBook;
import NewUser.OrederEntity;
import NewUser.User;
import Query.OperationOnOrder;

@WebServlet("/OrderServelet")
public class OrderServelet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		PrintWriter ps=res.getWriter();
		int bid=Integer.parseInt(req.getParameter("book"));
		int cid=Integer.parseInt(req.getParameter("us"));
		
		String username=req.getParameter("userName");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String bookname=req.getParameter("bookname");
		String price=req.getParameter("price");
		String city=req.getParameter("city");
		String state=req.getParameter("state");
		int pin=Integer.parseInt(req.getParameter("pin"));
		
		OrederEntity o=new OrederEntity();
		o.setBid(bid);
		o.setBookname(bookname);
		o.setCid(cid);
		o.setCity(city);
		o.setEmail(email);
		o.setPhone(phone);
		o.setPin(pin);
		o.setPrice(price);
		o.setState(state);
		o.setUsername(username);
		
		try {
			
			OperationOnOrder or=new OperationOnOrder(GetConnection.getConnection());
			boolean f=or.placeOrder(o);
			
			if(f)
			{
			    String s = "Order Placed Succesfully";
			    ps.println("<script>alert('" + s + "'); window.location='user_Order.jsp';</script>");
			}
			else
			{

			    String s = "Something went wrong";
			    ps.println("<script>alert('" + s + "'); window.location='User_Order_place.jsp';</script>");
			}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}

	

}

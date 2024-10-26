package ServelteMain;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MakeConnection.GetConnection;
import NewUser.Review;
import Query.*;
@WebServlet("/rv")
public class reviewServelet extends HttpServlet
{
	public void doGet(HttpServletRequest res,HttpServletResponse rep) throws IOException
	{
		try {
		String review=res.getParameter("review");
		int uid=Integer.parseInt(res.getParameter("uid"));
		int bid=Integer.parseInt(res.getParameter("bid"));
		int rating=Integer.parseInt(res.getParameter("rating"));
		
		Review reviewBook=new Review();
		
		PrintWriter ps=rep.getWriter();
		OperationOnBooks bk;
		
			bk = new OperationOnBooks(GetConnection.getConnection());
		 
		reviewBook.setBid(bid);
		reviewBook.setRating(rating);
		reviewBook.setReview(review);
		reviewBook.setUid(uid);
		System.out.println(review);
		
		boolean added=bk.addReview(reviewBook);
		
		if(added)
		{
			String s = "Review Added Successfully";
			ps.println("<script>alert('" + s + "'); window.location='BookDetails.jsp?id="+bid+"';</script>");
		}
		else
		{
			
			String s = "Something Went Wrong";
			ps.println("<script>alert('" + s + "'); window.location='.jsp';</script>");
		
		}
	   }
	catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
		
		
		
	}

}

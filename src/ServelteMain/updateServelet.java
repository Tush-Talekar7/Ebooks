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
import NewUser.User;
import Query.PerfromQuery;

/**
 * Servlet implementation class updateServelet
 */
@WebServlet("/updateServelet")
public class updateServelet extends HttpServlet {
	
	

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		PrintWriter ps=res.getWriter();
		String UserName=req.getParameter("userName");
		String Email=req.getParameter("email");
		String Phone=req.getParameter("phone");
		String password=req.getParameter("password");
		//System.out.println("IDInUp:"+req.getParameter("Id")+password);
		int id=Integer.parseInt(req.getParameter("Id"));
		//int id=3;
		User us=new User();
		
		us.setUserName(UserName);
		us.setEmail(Email);
		us.setPhno(Phone);
		us.setPassword(password);
		us.setId(id);
		
		try 
		{
			PerfromQuery p=new PerfromQuery(GetConnection.getConnection());
			
			boolean f=PerfromQuery.isValid(id, password);
			if(f)
			{
				if(p.updateUser(us))
				{
				    String s = "Details updated Succesfully";
				    ps.println("<script>alert('" + s + "'); window.location='Edit.jsp';</script>");
				}
				else
				{

				    String s = "Something went wrong";
				    ps.println("<script>alert('" + s + "'); window.location='Edit.jsp';</script>");
				}
			}
			else
			{
				
				 String s = "Wrong Password";
				 ps.println("<script>alert('" + s + "'); window.location='Edit.jsp';</script>");
				
			}
			
		} 
		catch (ClassNotFoundException | SQLException e)
		{
			e.printStackTrace();
			
		}
		
		
	}

}

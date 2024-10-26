package ServelteMain;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MakeConnection.GetConnection;
import NewUser.User;
import Query.PerfromQuery;


@WebServlet("/userDeatailsServelte")
public class userDeatailsServelte extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		
		String UserName=req.getParameter("userName");
		String Email=req.getParameter("email");
		String Phone=req.getParameter("phone");
		String Password=req.getParameter("password");
		
		User us=new User();
		
		us.setUserName(UserName);
		us.setEmail(Email);
		us.setPhno(Phone);
		us.setPassword(Password);
		HttpSession session=req.getSession();
		PrintWriter ps=res.getWriter();
		
		try 
		{
			PerfromQuery pq=new PerfromQuery(GetConnection.getConnection());
			
			boolean k=pq.isRegister(us);
			session.setAttribute("isRegisterd", k);
			session.setAttribute("j",true);
			
			if (k) {
			    String s = "User Registerd Sucessfully";
			    ps.println("<script>alert('" + s + "'); window.location='register.jsp';</script>");
			}
			else
			{
				String s = "Failed To Register";
			    ps.println("<script>alert('" + s + "'); window.location='register.jsp';</script>");
			}
		} 
		catch (Exception e) 
		{
			
			e.printStackTrace();
		}
		
		
		
		
	}

}

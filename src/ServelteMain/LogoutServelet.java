package ServelteMain;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")

public class LogoutServelet 
{
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException  
	{
		HttpSession session=req.getSession();
		
		try {
		session.removeAttribute("usObj");
		
		res.sendRedirect("Login.jsp");
		}
		catch(Exception e)
		{
			res.sendRedirect("Login.jsp");
		}
	}
}

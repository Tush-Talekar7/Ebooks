package ServelteMain;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/lg")
public class lg extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
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

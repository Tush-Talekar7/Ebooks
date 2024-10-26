package ServelteMain;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.catalina.connector.Request;

import MakeConnection.GetConnection;
import NewUser.User;

@WebServlet("/LoginServelet")
public class LoginServelet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String Username=req.getParameter("username");
		String Password=req.getParameter("password");
		
		HttpSession session=req.getSession();

		
		
		try {
			Connection con=GetConnection.getConnection();
			
			PreparedStatement pst=con.prepareStatement("select * from UserDeatils where email=? and password=?");
			pst.setString(1, Username);
			pst.setString(2, Password);
			ResultSet rs=pst.executeQuery();
			
			if(Username.equals("Admin") && Password.equals("Admin@123"))
			{
				User us=new User();
				us.setId(0);
				us.setUserName(Username);
				session.setAttribute("usObj", us);
			
				res.sendRedirect("Admin_Home.jsp");
			}
			else if(rs.next())
			{
				//System.out.println("rs "+rs);
				User us=new User();
				us.setId(rs.getInt(1));
				us.setUserName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				session.setAttribute("usObj", us);
				res.sendRedirect("index.jsp");
			}
			else 
			{
				PrintWriter ps = res.getWriter();
				
					String s = "User Does NOT Exist";
				    ps.println("<script>alert('" + s + "'); window.location='Login.jsp';</script>");
				
				
				
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
	}

}

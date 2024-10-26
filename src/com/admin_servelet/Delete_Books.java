package com.admin_servelet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MakeConnection.GetConnection;
import Query.OperationOnBooks;

@WebServlet("/delete")
public class Delete_Books extends HttpServlet
{
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String sp=req.getParameter("id");
		//String photo=req.getParameter("photo");
		int n=Integer.parseInt(sp);
		
		//System.out.println(n);
		
		PrintWriter ps=res.getWriter();
		try {
			OperationOnBooks book=new OperationOnBooks(GetConnection.getConnection());
			
			boolean b=book.deleteBook(n);
			
			if (b) {
				
				
			    String s = "Book Deleted Succesfully";
			    ps.println("<script>alert('" + s + "'); window.location='Admin_allBooks.jsp';</script>");
			}
			
			else
			{
				String s = "Failed ";
			    ps.println("<script>alert('" + s+ "'); window.location='Admin_allBooks.jsp';</script>");
			
			}
			
			
		}
		catch (ClassNotFoundException e)
		{
			
			e.printStackTrace();
		} 
		catch (SQLException e)
		{
			
			e.printStackTrace();
		}
		
	}

}

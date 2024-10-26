package com.admin_servelet;



import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import MakeConnection.GetConnection;
import NewUser.NewBook;
import Query.OperationOnBooks;


@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {
	
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException 
	{
		PrintWriter ps=res.getWriter();
		try
		{
			
			String bookName=req.getParameter("Bookname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String category=req.getParameter("category");
			Part part=req.getPart("photo");
			String filename=part.getSubmittedFileName();
			
			
			NewBook b=new NewBook(bookName,author,price,category,filename,"admin@gmail");
			
			OperationOnBooks book=new OperationOnBooks(GetConnection.getConnection());
			
			
			
			
			Boolean bk=book.addBooks(b);
			
			if (bk) {
				
				String path=getServletContext().getRealPath("")+"Images";
				File file=new File(path);
				part.write("E:/DATA STRUCTURE/JSP/WebContent"+File.separator+filename);
			    String s = "Book Added Succesfully";
			    ps.println("<script>alert('" + s + "'); window.location='Admin_addBooks.jsp';</script>");
			}
			
			else
			{
				String s = "Failed";
			    ps.println("<script>alert('" + s + "'); window.location='Admin_addBooks.jsp';</script>");
			
			}
				
			
			
			
		}
		
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
	}
	

}

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.*" %>
<%@ page import="Query.*"%>
<%@ page import="MakeConnection.*"%>
<%@ page import="NewUser.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@ include file="allComponent.jsp" %>

<style>
	.cn
	{
		margin-top:3rem;
		padding:2rem;
		margin-bottom:11.5rem;
	}
	tr
	{
		text-align:center;
	}
</style>
</head>
<body>
<%@ include file="WEB-INF/Admin_navbar.jsp" %>

	<table class="table table-striped bg-light cn ">
		<thead class="thead-dark">
			<tr >
				
				<th scope="col">Id</th>
				<th scope="col">Bookname</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Category</th>
				
				<th scope="col">Action</th>
				
			</tr>
		</thead>
		
		
		<tbody>
		<%
		
		OperationOnBooks books=new OperationOnBooks(GetConnection.getConnection());
		
			ArrayList<NewBook> ar=books.getAllBooks();
			int cnt=0;
			for (NewBook book : ar)
			{
				cnt++;
			%>
			    <tr>
			        <td><%= cnt %></th>
			        <td><%= book.getBookName() %></td>
			        <td><%= book.getAuthor() %></td>
			        <td><%= book.getPrice() %></td>
			        <td><%= book.getCategory() %></td>
			        
			        
			        <td><a href="delete?id=<%= book.getId() %>&photo=<%=book.getPhoto() %>" class="btn btn-danger">Delete</a></td>
			    </tr>
			<%
			//System.out.println(book.getPhoto());
			}
			%>

		</tbody>
	</table>




<%@ include file="Footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="MakeConnection.*" %>
<%@ page import="Query.*" %>
<%@ page import="MakeConnection.*" %>
<%@ page import="NewUser.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Order</title>
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
				
				
				
				<th scope="col">Sr no.</th>
				<th scope="col">BookName</th>
				<th scope="col">Price</th>
				<th scope="col">PIN</th>
				<th scope="col">City</th>
				<th scope="col">State</th>
				<th scope="col">Payment Type</th>
				<th scope="col">Action</th>
				
			</tr>
		</thead>
		<tbody>
		<%
			User us=(User)session.getAttribute("usObj");
			int id=us.getId();
			OperationOnOrder op=new OperationOnOrder(GetConnection.getConnection());
			int cnt=0;
			ArrayList<OrederEntity> ar=op.getOrderedBooks(id);
			
			for(OrederEntity book:ar)
			{
				cnt++;
			
		%>
			 <tr>
			        <td><%= cnt %></th>
			        <td><%= book.getBookname() %></td>
			        <td><%= book.getPrice() %></td>
			        <td><%= book.getPin() %></td>
			        <td><%= book.getCity() %></td>
			        <td><%= book.getState() %></td>
			        <td>Cash On Delivery</td>
			        <td><a href="deleteOrder?id=<%=book.getBid()%>&cid=<%=book.getEmail() %>&c=<%=1 %>" class="btn btn-danger">Delete</a></td>
			        
			    </tr>
			<%
			}
			%>
			
		</tbody>
	</table>




<%@ include file="Footer.jsp" %>
</body>
</html>
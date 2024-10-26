<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@ include file="allComponent.jsp" %>

<style type="text/css">

	.mainBody
	{
		width:100%;
		heigh:70vh;
		background-color:#FFF4EC;
		
	}
	.container
	{
		margin-top:2rem;
		width:100%;
		height:50vh;
		
		display:flex;
		flex-direction:row;
		justify-content:space-evenly;
		align-items:center;
		
		margin-bottom:8rem;
	}
	

	
	.items
	{
		padding:1rem 2rem;
		text-align:center;
		background-color:#FAD0B0;
		border-radius:5px;
		
	}
	a
	{
		text-decoration:none;
		color:black;
	}
	a:hover
	{
		text-decoration:none;
		color:black;
	}
</style>
</head>
<body>
<%@ include file="WEB-INF/Admin_navbar.jsp" %>
	<div class="mainBody">
		<div class="container">
			<a href="Admin_addBooks.jsp">
				<div class="items">
					<i class="fas fa-plus-square fa-3x text-primary" ></i>
					
					<h4>Add Books</h4>
				</div>
			</a>
			
			<a href="Admin_allBooks.jsp">
				<div class="items">
					<i class="fas fa-book-open fa-3x text-danger "></i>
					<h4>All Books</h4>
				</div>
			</a>
			
			<a href="allOrderedBooks.jsp">
				<div class="items">
					<i class="fas fa-box-open fa-3x text-warning"></i>
					<h4>Order</h4>
				</div>
			</a>
			
		</div>
	</div>
<%@ include file="Footer.jsp" %>
</body>
</html>
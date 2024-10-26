<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="NewUser.*" %>
<%@ page import="ServelteMain.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Setting</title>
<%@ include file="allComponent.jsp" %>

<style>
	body
	{
		background-color:#d6af771a;
	}
	
	.mainOpt
	{
		    width: 100%;
		    display: flex;
		    flex-direction: column;
		    gap: 1rem;
		    background-color:#d6af771a;
		    border-radius: 10px;
		    padding: 0.5rem;
		
	}
	.firstRow
	{
		
		display:flex;
		flex-direction:row;
		align-items:center;
		justify-content:space-around;
		gap:2rem;
		padding:1rem;
		width:100%;
		
		
	}
	.sellBook
	{
		width:20%;
		height:15%;
		display:flex;
		flex-direction:column;
		align-items:center;
		justify-content:space-around;
		gap:1.2rem;
		padding:1.5rem;
		box-shadow: 1px 2px 2px 1px darkslategray;
		background-color:#FEF9F5;
		border-radius:10px;
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

<%@ include file="WEB-INF/navbar.jsp" %>


<div class="container text-center mt-4 mb-4">
	
	<%User us=(User)session.getAttribute("usObj"); %>
	<div class="mainOpt pt-1">
	<h4>Hello <%= us.getUserName() %> </h4>
		<div class="firstRow">
		
			<a href="sell.jsp" class="sellBook">
				
					<i class="fas fa-plus-square fa-2x text-primary" ></i>
					
					<h5>Sell Book</h5>	
			</a>
	
			<a href="Edit.jsp" class="sellBook">
				
					<i class="fa-solid fa-user-pen fa-2x text-primary" ></i>
					
					<h5>Edit</h5>	
			</a>
		</div>
		
		<div class="firstRow">
			
			
			<a href="user_Order.jsp" class="sellBook">
				
					<i class="fas fa-box-open fa-2x text-danger" ></i>
					
					<h5>Orders</h5>	
			</a>
			
		</div>
	</div>
</div>

<%@ include file="Footer.jsp" %>

</body>
</html>
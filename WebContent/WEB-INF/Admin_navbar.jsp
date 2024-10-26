<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="NewUser.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
	body
	{
		background-color:white;
	}
	nav
	{
		background-color:#FA7C1C;
		width:100%;
	}
</style>
</head>
<body>



	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-3">
				<h3>BookQuest</h3>
			</div>
		
		
		<div class="col-md-6">
				
		</div>
		
		<%
			User u=(User)session.getAttribute("usObj");
		%>
		<div class="col-md-3">
		<%
			if(u==null)
			{
		%>
		
			<a href="Login.jsp" class="btn" style="font-family:monospace; background-color:#FB3E09;color:white;">Login</a>
		<a href="register.jsp" class="btn " style="font-family:monospace; background-color:#F24305;color:white;">Register</a>
		
		<% }
			else {%>
			
		<a href="Login.jsp" class="btn" style="font-family:monospace; background-color:#FA740E;color:white;"><%= u.getUserName() %></a>
		<a href="lg" class="btn " style="font-family:monospace; background-color:#F24305;color:white;">Logout</a>
		<%} %>
		
		
	  </div>
	</div>

	<nav class="navbar navbar-expand-lg navbar-dark "> 
		<a class="navbar-brand" href="#"><i class="fas fa-home"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active">
				<a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
				</a>
			</li>
			</li>
		</ul>
	</div>
	</nav>
</body>
</html>
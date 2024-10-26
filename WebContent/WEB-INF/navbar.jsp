<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="NewUser.*"%>
<%@ page import="ServelteMain.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
nav {
	background-color: #FA7C1C;
	width: 100%;
}


</style>
</head>
<body>



	<div class="container-fluid p-3 " style="background-color: #eaf4f4">
		<div class="row">
			<div class="col-md-3">
				<h3>
					<i class="fa-solid fa-book"></i> BookQuest
				</h3>
			</div>


			<div class="col-md-6"></div>
			<%
				User u = (User) session.getAttribute("usObj");
			%>
			<div class="col-md-3">
				<%
					if (u == null) {
				%>

				<a href="Login.jsp" class="btn  "
					style="font-family: monospace;  background: linear-gradient(to bottom, #ffcc99 0%, #ff6600 78%); color: white;">
					<i class="fa-solid fa-right-to-bracket"></i> Login
				</a> 
					
				<a href="register.jsp" class="btn " style="font-family: monospace;  background: linear-gradient(to bottom, #ffcc99 0%, #ff6600 78%); color: white;">
				      Register
				</a>

				<%
					} else if(u.getUserName().equals("Admin")){
				%>
				

				 <a href="Login.jsp" class="btn "
					style="font-family: monospace; background-color: #FA7603; color: white;"><%=u.getUserName()%></a>
				<a href="lg" class="btn "
					style="font-family: monospace; background-color: #FA7603; color: white;">Logout</a>
				<%
					}
					else{
				%>
				<a href="user_cart.jsp" class="btn btn-light"
					style="color: gray; padding: .4rem 1rem; margin-right: .4rem; font-size: 1.4rem">
					<i class="fa fa-cart-plus " aria-hidden="true"></i>
				</a> <a href="Login.jsp" class="btn "
					style="font-family: monospace; background-color: #FA7603; color: white;"><%=u.getUserName()%></a>
				<a href="lg" class="btn "
					style="font-family: monospace; background-color: #FA7603; color: white;">Logout</a>
				
				<%} %>




			</div>
		</div>
	</div>

	<nav class="navbar navbar-expand-lg navbar-dark bg-orange"> <a href="index.jsp"
		class="navbar-brand" href="#"><i class="fas fa-home"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="AllRecentBooks.jsp"><i class="fas fa-book-open"></i>
					Recent Book</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="AllNewBooks.jsp"><i class="fas fa-book-open"></i> New
					Book</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="AllOldBooks.jsp"><i class="fas fa-book-open"></i> Old Book</a></li>


			</li>
		</ul>

		<form class="form-inline my-2 my-lg-0 ">

			<%
				if (u == null) {
			%>
			<a href="Login.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i
				class="fas fa-cog p-1"></i>Profile</a>
			<%
				}

				else if (u.getUserName().equals("Admin")){
			%>
			<a href="Admin_Home.jsp" class="btn btn-light my-2 my-sm-0"
				type="submit"><i class="fas fa-cog p-1"></i>Profile</a>
			<%
			//System.out.println(u);
				}
			
				else {
			%>
			<a href="Setting.jsp" class="btn btn-light my-2 my-sm-0"
				type="submit"><i class="fas fa-cog p-1"></i>Profile</a>
				
				<%
				System.out.println(u);
				} %>
			

			<a href="AboutUs.jsp" class="btn btn-light my-2 my-sm-0 ml-1"
				type="submit"><i class="fas fa-phone-square p-1"></i>About Us</a>
		</form>

	</div>
	</nav>
</body>
</html>
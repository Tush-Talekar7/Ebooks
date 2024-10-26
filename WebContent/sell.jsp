<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="NewUser.*" %>
<%@ page import="ServelteMain.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%@ include file="allComponent.jsp" %>

<style>
	.container
	{
		padding:.7rem;
		display:flex;
		justify-content:center;
		flex-direction:column;
		align-items:center;
		
		
	}
	
	.main_Contenet
	{
		display:flex;
		justify-content:center;
		flex-direction:column;
		align-items:center;
		
		padding:.6rem;
		border:1px solid black;
		border-radius:7px;
		background-color:ghostwhite;
		margin-bottom:.4rem;
		
	}
	.formElements
	{
		
		
	}
</style>
</head>
<body>

<%@ include file="WEB-INF/navbar.jsp" %>

<% User us=new User();
	us=(User)session.getAttribute("usObj");
	System.out.println("sell"+us);
%>
	<div class="container">
		<div class="main_Contenet">
			<h4>Add Book</h4>
			
			<div>
				<form  action="user_add_books" method="post" enctype="multipart/form-data" class="formElements">
				
				<input type="hidden" value=<%=us.getEmail() %> name="userName">
				<div class="form-group">
					<label for="exampleInputPassword1">Book Name</label> <input
						type="text" class="form-control" id="exampleInputPassword1"
						required="required"	name="Bookname">
				</div>
				
				<div class="form-group">
					<label for="exampleInputEmail1">Author Name</label> <input
						type="text" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" required="required" name="author"> 
				</div>
				
				<div class="form-group">
					<label for="exampleInputPassword1">Price</label> <input
						type="number" class="form-control" id="exampleInputPassword1"
						required="required" name="price">
				</div>
				
				<div class="form-group">
					<label for="exampleFormCotrolFile1">Upload Photo</label> <input
						type="file" class="form-control-file" id="exampleFormCotrolFile1"
						 name="photo"> 
				</div>
				<button type="submit" class="btn btn-primary m-1">Sell</button>
			</form>
			</div>
		</div>
	</div>

<%@ include file="Footer.jsp" %>

</body>
</html>
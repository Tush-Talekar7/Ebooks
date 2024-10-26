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
		width:30%;
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
<%
	User us=(User)session.getAttribute("usObj");
	//System.out.println("Edit:"+us);
%>

	<div class="container">
		<div class="main_Contenet">
			<h4>Update</h4>
			
			<div>
				<form  action="updateServelet" method="post" class="formElements">
				
				<input type="hidden" value=<%=us.getId() %>  name="Id">
				<div class="form-group">
					<label for="exampleInputPassword1">Username</label> <input
						type="text" class="form-control" value=<%=us.getUserName() %> id="exampleInputPassword1"
						required="required"	name="userName">
				</div>
				
				<div class="form-group">
					<label for="exampleInputEmail1">Email</label> <input
						type="text" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" value=<%=us.getEmail() %> required="required" name="email"> 
				</div>
				
				<div class="form-group">
					<label for="exampleInputPassword1">Phone</label> <input
						type="number" class="form-control" id="exampleInputPassword1"
						required="required" value=<%=us.getPhno() %> name="phone">
				</div>
				
			
				
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label> <input
						type="password" class="form-control" id="exampleInputPassword1"
						required="required" name="password">
				</div>
				<button type="submit" class="btn btn-primary m-1">Update</button>
			</form>
			</div>
		</div>
	</div>

<%@ include file="Footer.jsp" %>

</body>
</html>
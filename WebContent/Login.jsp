<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@ include file="allComponent.jsp" %>

<style>
	.cn
	{
		height:72.3vh;
		padding:.7rem;
		display:flex;
		justify-content:center;
		flex-direction:column;
		align-items:center;
		background-color:#f2f2f2;
	}
	.card_body
	{
		
		
		display:flex;
		justify-content:center;
		flex-direction:column;
		align-items:center;
		width:25%;
		padding:.6rem;
		
		border-radius:7px;
		background-color:#ffffff;
		transition: all 2s ease;
	}
	.card_body
	{
		box-shadow: 1px 4px 3px 2px  lightgray;
	}
	.formElements
	{
		gap:.5rem;
	}
</style>
</head>
<body>
	<%@ include file="WEB-INF/navbar.jsp" %>
	<div class="container-fluid cn">
		<div class="card_body">
			<h5>Login</h5>
			<form action="LoginServelet" method="post">
				<div class="form-group">
					<label for="exampleInputPassword1">Username</label> <input type="text"
						class="form-control" id="exampleInputPassword1" required="required"
						name="username">
				</div>
			
				<div class="form-group">
					<label for="exampleInputEmail1">Password</label> <input
						type="password" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" required="required" name="password">
				</div>
				<button type="submit" class="btn btn-primary m-1">Login</button>
				
				<p>If you don't Have Account <a href="register.jsp">Create</a></p>
			</form>
		</div>
	</div>
	<%@ include file="Footer.jsp" %>

</body>
</html>
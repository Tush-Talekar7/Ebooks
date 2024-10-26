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
		transition: all 4s ease;
		box-shadow:2px 4px 4px 2px lightgray;
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
		<div class="card_body ">
			<h5>Register</h5>
			<%-- <%! static  boolean j=false;  %>
			
			<% 
			 
			if(j)
			{
				j=false;
				Boolean isRegistered = (Boolean) session.getAttribute("isRegisterd");
				if (isRegistered != null && isRegistered) {
				    // Your code here
					out.print("<p> Registreion success</p>");
				}

			  else
				out.print("<p> Registreion Failed</p>"); 
			}
			else
			  j=true;
			%> --%>
			
			
			<form  action="userDeatailsServelte" method="post" class="formElements ">
				<div class="form-group">
					<label for="exampleInputPassword1">Username</label> <input
						type="text" class="form-control" id="exampleInputPassword1"
						required="required"	name="userName">
				</div>
				
				<div class="form-group">
					<label for="exampleInputEmail1">Email address</label> <input
						type="email" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" required="required" name="email"> 
				</div>
				
				<div class="form-group">
					<label for="exampleInputPassword1">Mobile</label> <input
						type="number" class="form-control" id="exampleInputPassword1"
						required="required" name="phone">
				</div>
				
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label> <input
						type="password" class="form-control" id="exampleInputPassword1"
						required="required" name="password">
				</div>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="exampleCheck1" required="required">
					<label class="form-check-label" for="exampleCheck1" name="name">Check
						me out</label>
				</div>
				<button type="submit" class="btn btn-primary m-1">Submit</button>
			</form>

		</div>
		
	</div>
	
	<%@ include file="Footer.jsp" %>
	
</body>
</html>
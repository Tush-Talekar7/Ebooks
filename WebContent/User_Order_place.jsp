<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="Query.*" %>
<%@ page import="MakeConnection.*" %>
<%@ page import="NewUser.*" %>
<%@ page import="ServelteMain.*" %>
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
		background-color:ghostwhite;
	}
	.card_body
	{
		
		display:flex;
		justify-content:center;
		flex-direction:column;
		align-items:center;
		width:25%;
		padding:.6rem;
		border:1px solid black;
		border-radius:7px;
		background-color:azure;
	}
	.gh
	{
		display:flex;
		flex-direction:colomn;
		justify-content:center;
		alighn-items:center;
		background-color:white;
		
		width:100%;
	}
	.formElements
	{
		width:40%;
		text:center;
	}
</style>
</head>
<body>

<%@ include file="WEB-INF/navbar.jsp" %>

	<%
		int id=Integer.parseInt(request.getParameter("id"));
		System.out.println(session.getAttribute("usObj")+" "+id);
		User us=(User)session.getAttribute("usObj");
		OperationOnBooks op=new OperationOnBooks(GetConnection.getConnection());
		
		NewBook book=op.getBookDetails(id);
		System.out.println(book);
	%>
	<div class="gh">
		<form  action="OrderServelet"  class="formElements">
			<input type="hidden" name="us" value=<%=us.getId() %>>
			<input type="hidden" name="book" value=<%=book.getId() %>>
				<div class="form-group">
					<label for="exampleInputPassword1">Username</label> <input
						type="text" class="form-control" id="exampleInputPassword1"
						required="required" value=<%=us.getUserName() %>	name="userName">
				</div>
				
				<div class="form-group">
					<label for="exampleInputEmail1">Email address</label> <input
						type="email" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" value=<%=us.getEmail() %> required="required" name="email"> 
				</div>
				
				<div class="form-group">
					<label for="exampleInputPassword1">Mobile</label> <input
						type="number" class="form-control" id="exampleInputPassword1"
						required="required" name="phone" value=<%= us.getPhno() %>>
				</div>
				
				<div class="form-group">
					<label for="exampleInputPassword1">Bookname</label> <input
						type="text" class="form-control" id="exampleInputPassword1"
						required="required" name="bookname" value=<%=book.getBookName() %>>
				</div>
				
				
				<div class="form-group">
					<label for="exampleInputPassword1">Price</label> <input
						type="text" class="form-control" id="exampleInputPassword1"
						required="required" name="price" value=<%=book.getPrice() %>>
				</div>
				
				<div class="form-group">
					<label for="exampleInputPassword1">PIN</label> <input
						type="text" class="form-control" id="exampleInputPassword1"
						required="required"  name="pin">
				</div>
				
				<div class="form-group">
					<label for="exampleInputPassword1">City</label> <input
						type="text" class="form-control" id="exampleInputPassword1"
						required="required"  name="city">
				</div>
				
				<div class="form-group">
					<label for="exampleInputPassword1">State</label> <input
						type="text" class="form-control" id="exampleInputPassword1"
						required="required"  name="state">
				</div>

				<button type="submit" class="btn btn-primary m-1">Place Order</button>
			</form>

		</div>
		
	</div>
	</div>
	
	<%@ include file="Footer.jsp" %>

</body>
</html>
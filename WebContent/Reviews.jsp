<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.*" %>
<%@ page import="Query.*"%>
<%@ page import="MakeConnection.*"%>
<%@ page import="NewUser.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reviews</title>
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
		width:17rem;
		gap:.5rem;
	}
</style>
</head>
<body>
	<%@ include file="WEB-INF/navbar.jsp" %>
	
	<%
		User us=(User)session.getAttribute("usObj");
		int uid=us.getId();
		int bid=Integer.parseInt(request.getParameter("id"));
		//System.out.println(bid);
	%>
	
	<div class="container-fluid cn">
		<div class="card_body ">
			<h5>FeedBack</h5>
			
			
			<form  action="reviewServelet" method="post" class="formElements ">
			
				<input type="hidden" name="uid" value=<%=uid %>>
				<input type="hidden" name="uid" value=<%=bid %>>
				<div class="form-group">
					<label for="exampleInputPassword1">Rating</label> <input
						type="text" class="form-control" id="exampleInputPassword1"
						required="required"	name="rating" placeholder="Give Rating between 1-5">
				</div>
				
				<div class="form-group">
				
					<label for="w3review">Review of W3Schools:</label>

					<textarea id="review" name="w3review" rows="4" cols="35">
						
					</textarea>
				</div>
				
				
				<button type="submit" class="btn btn-primary m-1">Submit</button>
			</form>

		</div>
		
	</div>
	
	<%@ include file="Footer.jsp" %>
	
</body>
</html>
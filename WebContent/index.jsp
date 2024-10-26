 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="Query.*" %>
<%@ page import="MakeConnection.*" %>
<%@ page import="NewUser.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BookQuest</title>
<%@ include file="allComponent.jsp" %>



<style>
	.back-img
	{
		background:url("Images/main_BackgroundImage.jpg");
		height:57vh;
		width:100%;
		background-repeat:no-repeat;
		background-size:cover;
	
	}
	
	.cn
        {
            width:100%;
            text-align:center;
            display:flex;
            flex-direction:column;
            justify-content:center;
            background-color:#F5F5F5;	
        }
        
       .cardbody
       {
       	transition: all 1s ease;
       	background-color:#FFFFFF;
       	border:none;
      
		
		box-shadow: 1px 4px 3px 2px lightgray;
		}
		
		.cardbody:hover
		{
			transform: scale(1.01);
		}
		#name
		{
			color:Purple;
			font-size:1.2rem;
		}
		.df {
 				 text-shadow: 2px 2px 4px #ffffff;
			}
			.books
			{
				padding-bottom:.7rem;
			}

		
</style>
</head>

<body>

	
	<%@ include file="WEB-INF/navbar.jsp" %>
	
	<div class="container-fluid back-img">
		<h2 class="text-center p-2 df"> BookQuest </h2>
	</div>
	
	 <div class="cn ">
		<h3  class="p-2 m-2 text-center " style="font-family:cursive;">Recent Books</h3>
		
		
		<div class="books m-2" style="float:left">
		<%
			OperationOnBooks bf=new OperationOnBooks(GetConnection.getConnection());
			ArrayList<NewBook> arRecent=bf.getRecentBooks();

			User us=(User)session.getAttribute("usObj");
			
			for(NewBook bk:arRecent){
				//System.out.println(bk.getPhoto());
				
		%>
		
				<div class="cardbody ">
	
					<img src="<%=bk.getPhoto() %>" class="img1">
	
		
					<div class="details">
						<p id="name"><%= bk.getBookName()%></p>
						<p>Author: <%= bk.getAuthor() %></p>
						<p>Category: <%=bk.getCategory() %></p>
						<p><i class="fa fa-inr" aria-hidden="true"></i> <%= bk.getPrice() %>
					</div>
	
					<div class="btns">
					
					<%if (us==null)
					{
						
					%>
						<a href="Login.jsp" class="btn btn-success">
							<i class="fa fa-cart-plus " aria-hidden="true"></i> Add to Cart
						</a>
					<%} else { %>
						<a href="Cart?bid=<%=bk.getId() %>&&uid=<%=us.getId() %>" class="btn btn-success">
							<i class="fa fa-cart-plus " aria-hidden="true"></i> Add to cart
						</a>
					<%} %>
						 <a href="BookDetails.jsp?id=<%= bk.getId() %>"class="btn btn-secondary">view</a> 
						 

					</div>
				</div>
			
			
		<%
			}	
		%>
		</div>
		</div>
	
	
	
	 
	 <div class="cn">
		<h3  class="p-2 m-2 text-center " style="font-family:cursive;">New Books</h3>
		
		
			<div class="books " style="float:left">
		<%
			OperationOnBooks book=new OperationOnBooks(GetConnection.getConnection());
			ArrayList<NewBook> ar=book.getNewBooks();
			
		
			
			for(NewBook bk:ar){
				//System.out.println("user"+us);
				
		%>
		
				<div class="cardbody ">
	
					<img src="<%=bk.getPhoto() %>" class="img1">
	
		
					<div class="details">
						<p id="name"><%= bk.getBookName()%></p>
						<p><%= bk.getAuthor() %></p>
						<p>Category: <%=bk.getCategory() %></p>
						<p><i class="fa fa-inr" aria-hidden="true"></i> <%= bk.getPrice() %>
					</div>
					<div class="btns">
					<%if (us==null)
					{
						
					%>
						<a href="Login.jsp" class="btn btn-success"><i class="fa fa-cart-plus " aria-hidden="true"></i> Add to Cart</a>
					<%} else { %>
						<a href="Cart?bid=<%=bk.getId() %>&&uid=<%=us.getId() %>" class="btn btn-success">
						 	<i class="fa fa-cart-plus " aria-hidden="true"></i> Add to Cart
						 </a>
					<%} %>
		
						<a href="BookDetails.jsp?id=<%= bk.getId() %>" class="btn btn-secondary">view</a> 
						
	
					</div>
				</div>
			
		<%
			}	
		%>
		</div>
		</div>
		
		
	
	

	 <div class="cn">
		<h3  class="p-2 m-2 text-center" style="font-family:cursive;">Old Books</h3>
		
		
			<div class="books " style="float:left">
		<%
			OperationOnBooks b=new OperationOnBooks(GetConnection.getConnection());
			ArrayList<NewBook> arOld=b.getOldBooks();
			

			
			for(NewBook bk:arOld){
				//System.out.println(bk.getPhoto());
				
		%>
		
				<div class="cardbody ">
	
					<img src="<%=bk.getPhoto() %>" class="img1">
	
		
					<div class="details">
						<p id="name"><%= bk.getBookName()%></p>
						<p><%= bk.getAuthor() %></p>
						<p>Category: <%=bk.getCategory() %></p>
						<p><i class="fa fa-inr" aria-hidden="true"></i> <%= bk.getPrice() %>
					</div>
	
					<div class="btns">
						<%if (us==null)
					{
						
					%>
						<a href="Login.jsp" class="btn btn-success"> <i class="fa fa-cart-plus " aria-hidden="true"></i> Add to Cart</a>
					<%} else { %>
						<a href="Cart?bid=<%=bk.getId() %>&&uid=<%=us.getId() %>" class="btn btn-success">
						 	<i class="fa fa-cart-plus " aria-hidden="true"></i> Add to Cart
						 </a>
					<%} %>
		
						 <a href="BookDetails.jsp?id=<%= bk.getId() %>" class="btn btn-secondary">view</a>
						 
	
					</div>
				</div>
			
			
		<%
			}	
		%>
		</div>
		</div>
	
	
	
	<%@ include file="Footer.jsp" %>

</body>
</html>
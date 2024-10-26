<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="Query.*"%>
<%@ page import="MakeConnection.*"%>
<%@ page import="java.util.*"%>
<%@ page import="NewUser.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%@ include file="allComponent.jsp"%>

<style>
.scroll-container {
	width: 100vw; /* Set the width of the container */
	overflow-x: auto; /* Enable horizontal scrolling */
	white-space: nowrap; /* Prevents the content from wrapping */
	border: 1px solid #ccc;
	/* Optional: Adds a border for better visibility */
	background-color:whitesmoke;
}

.scroll-item {
	display: inline-block; /* Makes sure items are in a row */
	width: 20vw; /* Set width for each item */
	height: 250px; /* Set height for each item */
	margin-right: 10px; /* Optional: Adds some space between items */
	background-color: #f0f0f0;
	/* Optional: Background color for visibility */
	border: 1px solid #ccc;
	/* Optional: Adds a border for better visibility */
	vertical-align: top; /* Align items at the top */
	padding: 5px; /* Add padding for better spacing */
	box-sizing: border-box; /* Ensure padding is included in width */
	border-radius:10px;
	padding-top:.4rem;
}

.review {
	display: flex;
	flex-direction: column;
	gap: 1rem;
	justify-content: flex-start;
	align-items: center;
}

.fees {
	display: flex;
	align-items: center;
	gap: .5rem;
	font-weight:500;
}

.fee {
	display: flex;
	flex-direction: row;
	align-items: center;
	gap: .5rem;
	font-weight:500;
}

textarea {
	resize: none; /* Prevent resizing */
}

p {
	padding: 0px;
	font-weight: 650;
	font-size:1.2rem;
	text-align: center;
	text-transform: capitalize;
}

.rev
{
	font-size:.9rem;
}

.fedd {
	display: flex;
	padding-left: 1rem;
	padding-right: 1rem;
}

.container {
	width: 50%;
	height: 100%;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	padding: .1rem;
}

.main {
	width: 80%;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	padding: 1rem;
	background-color: whitesmoke;
}

.left {
	width: 40%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	gap: 1rem;
	padding: 1.4rem;
}

.right {
	display: flex;
	flex-direction: column;
	justify-content: left;
	align-items: left;
	gap: 1rem;
	padding: 1rem;
}

img {
	height: 150px;
	width: 120px;
}

.detail {
	font-weight: 500;
	font-size: 1rem
}

.rating {
	display: flex;
	flex-direction: row;
	gap: .4rem;
	color: #ffc107;
}

.formElements {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	gap: .4rem;
	padding-top: 1.7rem;
}

.frm
{

	display: flex;
	flex-direction: column;
	gap: 1rem;
	justify-content: flex-start;
	align-items: center;
}

button 
{
	background-color:orange;
}
</style>

</head>
<body>
	<%@ include file="WEB-INF/navbar.jsp"%>

	<div class="container mb-0 mt-2">

		<div class="main">

			<%
				OperationOnBooks b = new OperationOnBooks(GetConnection.getConnection());
				int id = Integer.parseInt(request.getParameter("id"));

				User us = (User) session.getAttribute("usObj");
				NewBook book = b.getBookDetails(id);
				int bid = book.getId();
				int uid=us.getId();
				//System.out.println("Uid ="+uid);
				//int uid = 10;
				HashMap<String, String> reviews = b.getReviews(bid);
				
				

				//ArrayList<String> rev=b.getReview(us.getId(), id);
				//String ratin=(String)rev.get(0);
				//int rating=Integer.parseInt(ratin);
				int rating = 4;
			%>
			<div class="left">
				<img src="<%=book.getPhoto()%>">

				<p>
					<strong>Book Name:</strong>
					<%=book.getBookName()%></p>

				<p>
					<strong>Author name: </strong><%=book.getAuthor()%></p>

			</div>

			<div class="right">
				<p class="">
					<Strong>Rs.</Strong>
					<%=book.getPrice()%>/-
				</p>

				<p class="detail">
					This
					<%=book.getBookName()%>
					book will enrich your computer science knowledge.
				</p>
				

				<%
					if (us != null) {
				%>
				<div class="btns ">
					<a href="Cart?bid=<%=book.getId()%>&&uid=<%=us.getId()%>"
						class="btn btn-success">Add to cart</a> <a
						href="User_Order_place.jsp?id=<%=book.getId()%>"
						class="btn btn-dark">Buy</a><br> <br>

					
				</div>
				<%
					} else {
				%>

				<div class="btns ">
					<a href="Login.jsp" class="btn btn-success">Add to cart</a> <a
						href="Login.jsp" class="btn btn-dark">Buy</a>
				</div>

				<%
					}
				%>

			</div>
		</div>
	</div>
	<div class="fedd">
		<div class="scroll-container">
			<div class="scroll-item">
				<p>Review</p>
				<div class="review">
					<form action="rv?uid=<%=uid%>&bid=<%=bid%>" method="get" class="frm">
						<input type="hidden" name="uid" value="<%=uid%>"> <input
							type="hidden" name="bid" value="<%=bid%>">
						<div class="fees">
							<label for="rating" >Select Rating</label> <input type="text"
								id="rating" name="rating" placeholder="Give rating between 1-5">
						</div>
						<div class="fee">
							<label for="feedback">Feedback</label>
							<textarea id="feedback" name="review" rows="4" cols="25"></textarea>
						</div>
						<button type="submit">Add Review</button>
					</form>
				</div>
			</div>

			<%
				for (String username : reviews.keySet()) {
					//System.out.println("HAshMap" + username);
			%>
			<div class="scroll-item">

				<p><%=username%></p>
				<p class="rev"><%=reviews.get(username)%></p>
			</div>
			<%
				}
			%>
			
			

		</div>
	</div>



	<%@ include file="Footer.jsp"%>
</body>
</html>
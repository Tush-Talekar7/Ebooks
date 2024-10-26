<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="MakeConnection.*" %>
<%@ page import="Query.*" %>
<%@ page import="java.util.*" %>
<%@ page import="NewUser.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>

    <style>
        *
        {
            margin:0px;
            padding:0px;
            box-sizing:border-box;
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

        .books {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .cardbody {
            width: 23%; /* Adjust as needed, considering margins and padding */
            margin: 1%; /* Adjust as needed */
        
	       	transition: all 1s ease;
	       	background-color:#FFFFFF;
	       	border:none;
	
			box-shadow: 1px 4px 3px 2px lightgray;
		}
		
		.cardbody:hover
		{
			transform: scale(1.01);
		}
		.books
		{
			padding-bottom:.7rem;
			margin-bottom:1.9rem;
		}
    </style>

    <%@ include file="allComponent.jsp" %>
</head>
<body>
    <%@ include file="WEB-INF/navbar.jsp" %>
    <div class="container-fluid">
        <div class="cn">
            
            
            <div class="books">
                <%
                    OperationOnBooks b = new OperationOnBooks(GetConnection.getConnection());
                    ArrayList<NewBook> arOld = b.getAllNewBooks();
                    User us=(User)session.getAttribute("usObj");
                    int cnt = 0;
                    for (NewBook bk : arOld) {
                        
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
						<%
							if (us==null) {
						%>
						<a href="Login.jsp" class="btn btn-success"><i class="fa fa-cart-plus " aria-hidden="true"></i> Add to Cart</a>
						<%
							} else {
						%>
						<a href="Cart?bid=<%=bk.getId()%>&&uid=<%=us.getId()%>"
							class="btn btn-success"><i class="fa fa-cart-plus " aria-hidden="true"></i> Add to Cart</a>
						<%
							}
						%>
						<a href="BookDetails.jsp?id=<%= bk.getId() %>" class="btn btn-secondary">view</a>
                                    
                                </div>
                            </div>
                <%
                        
                    }
                %>
            </div>
        </div>
    </div>
    <%@ include file="Footer.jsp" %>
</body>
</html>

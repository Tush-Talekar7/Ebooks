<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="Query.*" %>
 <%@ page import="java.util.*" %>
 <%@ page import="NewUser.*" %>
 <%@ page import="MakeConnection.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@ include file="allComponent.jsp" %>

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
            background-color:#c0c0c0;	
        }

        .books {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .cardbody {
            width: 23%; /* Adjust as needed, considering margins and padding */
            margin: 1%; /* Adjust as needed */
        }
        .btns
        {
        	display:flex;
        	flex-direction:row;
        	justify-content:right;
        	align-items:center;
        	padding:1rem;
        	gap:1rem;
        }
        
        .delete
        {
        	background: linear-gradient(to bottom, #ffcccc 20%, #ff6600 78%);
        	color:black;
        }
    </style>

</head>
<body>
<%@ include file="WEB-INF/navbar.jsp" %>

 		<div class="cn">
            <h3 style="background-color:azure" class="p-2 m-2 text-center"><i class="fa fa-cart-plus" aria-hidden="true"></i> Cart</h3>
            
            <div class="books">
                <%
                    OperationsOnCart b = new OperationsOnCart(GetConnection.getConnection());
                
            		User us=(User)session.getAttribute("usObj");
            		
                    ArrayList<NewBook> arOld = b.getBooksInCart(us.getId());
                    int cnt = 0,tp=0;
                    for (NewBook bk : arOld) {
                    	/* cnt++;
                    	if(cnt<4){ */
                    		tp+=Integer.parseInt(bk.getPrice());
                        
                %>
                            <div class="cardbody">
                                <img src="<%=bk.getPhoto() %>" class="img1">
                                <div class="details">
                                    <p id="name"><%= bk.getBookName()%></p>
                                    <p><%= bk.getAuthor() %></p>
                                    
                                </div>
                                <div class="btns">
                                    <a href="BookDetails.jsp?id=<%= bk.getId() %>" class="btn btn-secondary">view</a>
                                    <a href="" class="btn btn-dark"><i class="fa fa-inr" aria-hidden="true"></i> <%= bk.getPrice() %></a>
                                     <a href="deleteOrder?id=<%=bk.getId() %>&cid=<%=us.getId() %>&c=<%=2 %>" class="btn delete">Delete</a>
                                </div>
                            </div>
                <%
                        
                /*    }
                else{
                	//System.out.print("tp"+tp);
                	tp+=Integer.parseInt(bk.getPrice());
                } */
                    }
                	%>
            </div>
        </div>
    </div>
	<div class="btns p-2">
		<a href="" class="btn btn-success "> <i class="fa fa-inr" aria-hidden="true"></i> <%= tp %> </a>
		<!-- <a href="" class="btn btn-warning "> <i class="fa fa-inr" aria-hidden="true"></i> View All </a>
		 -->
	</div>
<%@ include file="Footer.jsp" %>

</body>
</html>
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
		margin-top:3rem;
		padding:2rem;
		margin-bottom:11.5rem;
	}
	tr
	{
		text-align:center;
	}
</style>
</head>
<body>
<%@ include file="WEB-INF/Admin_navbar.jsp" %>

	<table class="table table-striped bg-light cn ">
		<thead class="thead-dark">
			<tr >
				
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No</th>
				<th scope="col">Bookname</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
				
				
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>Mark</td>
				<td>Otto</td>
				<td>@mdo</td>
				<td>Mark</td>
				<td>Otto</td>
				<td>Mark</td>
				<td>Otto</td>
				<td>@mdo</td>
				
				
			</tr>
			<tr >
				<th scope="row">2</th>
				<td>Jacob</td>
				<td>Thornton</td>
				<td>@fat</td>
				<td>Mark</td>
				<td>Otto</td>
				
				<td>Mark</td>
				<td>Otto</td>
				<td>@mdo</td>
				
				
			</tr>
			<tr >
				<th scope="row">3</th>
				<td>Larry</td>
				<td>the Bird</td>
				<td>@twitter</td>
				<td>Mark</td>
				<td>Otto</td>
				
				<td>Mark</td>
				<td>Otto</td>
				<td>@mdo</td>
				
				
			</tr>
		</tbody>
	</table>




<%@ include file="Footer.jsp" %>
</body>
</html>
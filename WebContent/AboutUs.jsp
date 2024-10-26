<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@ include file="allComponent.jsp" %>
<style>
	.content
	{
		width:70%;
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
		gap:.1rem;
		
		margin-left:13rem;
	}
	body
	{
		background-color:#eaf4f4;
	}
</style>
</head>
<body>

	<%@ include file="WEB-INF/navbar.jsp"%>

	<p class="text-center ">
		<div class="content">
		<strong> Welcome to E-Book
		Management System </strong> Designed to revolutionize your reading experience.
		At Suraj Solutions, we understand the transformative power
		of digital literature and the need for a seamless platform that caters
		to both avid readers and aspiring authors.<br>
		
		 <strong >Our Mission: </strong>At the heart
		of our mission is the commitment to create a dynamic and user-friendly
		environment that connects book enthusiasts, providing them with a
		one-stop solution for buying and selling e-books. We strive to empower
		users to explore, engage, and contribute to the ever-evolving world of
		digital literature.
		
		<br>
		<b> What Sets Us Apart:</b><br> 
		<div> 
		 <strong>1. Comprehensive Catalog:</strong>
			Dive into an extensive catalog of e-books, carefully curated to cater
			to diverse tastes and preferences. Whether you're a fan of fiction,
			non-fiction, or niche genres, our platform has something for everyone.
		</div>
		<br>
		
		<div>
			<b>2. Secure Transactions:</b> 
			Your trust and security are our top
			priorities. Experience worry-free transactions through our secure
			payment gateways, ensuring a seamless and protected buying and selling
			process.
		</div><br>
		 
		
		<div><b>3. Empowering Authors:</b> 
		Aspiring authors can leverage our
		platform to showcase and sell their literary creations. We provide a
		space for writers to connect with readers directly, fostering a
		community that celebrates creativity. </div> <br> 
		
		<div><b>4. User-Centric Design:</b> 
		
		 Our user interface is designed with you in mind. Enjoy a hassle-free and
		intuitive experience, whether you're browsing the catalog, managing
		your e-book inventory, or tracking your transactions.</div><br>
		  
		<div> <b> 5. Innovative Features:</b> 
			 Explore innovative features such as personalized
			dashboards, real-time transaction tracking, and recommendation
			algorithms that enhance your overall interaction with digital
			literature.
			</div>
		</div>
		 <br>
		 
		 <div class="content"><i><u><b>How We Work:</b></u></i>Operates on a
		foundation of transparency, innovation, and a passion for literature.
		We believe in continuous improvement, and user feedback is invaluable
		to us. Your experience with our platform matters, and we are dedicated
		to evolving and adapting to meet your needs.<br> 
		<i><u>
		<b>Join us</b>
		</i></u> 
		In the journey of
		exploring, sharing, and celebrating the world of e-books.</div>

	<%@ include file="Footer.jsp"%>
</body>
</html>
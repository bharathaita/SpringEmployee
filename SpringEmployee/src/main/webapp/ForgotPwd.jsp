<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot password</title>
<style type="text/css">
	body
	{
		background-image:url("https://cdn.pixabay.com/photo/2023/04/09/14/43/ocean-7911654_1280.jpg");
		background-size:cover;
	}
	input
	{
		padding:10px;
		width:170px;
		border:none;
		border-bottom:2px solid black;
		
		background: transparent;
		color: white;
	}
	#btn
	{
		padding:5px;
		border-radius:5px;
		border:none;
		background-color:MidnightBlue;
		font-weight:bold;
		color:white;
	}
	#btn:hover
	{
		background-color:Teal;
		border-color:Teal;
	}
	#home
	{
		position:fixed;
		left:87%;
		top:4%;
		padding:7px;
		background-color: ;
		border:none;
		border-radius:5px;
		font-weight:bold;
	}
	#home:hover
	{
		background-color: DarkSeaGreen;
		color:white;
	}
	h2
	{
		text-align:center;
		color: white;
	}
	form
	{
		padding-top:2%;
	}
	::placeholder 
	{
  		color: white;
  		opacity: 0.5; 
	}
</style>
</head>
<body>
<header>
	<h2>Forgot Password</h2>
	<a href="http://localhost:8080/SpringEmployee/Login.jsp"><button id="home">LOGIN</button></a>
</header>

	<center>
		
		<form action="sendEmail" method="post">
			<input type="email" placeholder="Enter Email Id" name="emailId" required> 
			<button id="btn">Submit</button>
		</form>
	</center>
</body>
</html>
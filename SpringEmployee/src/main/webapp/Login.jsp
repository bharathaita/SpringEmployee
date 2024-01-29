<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style type="text/css">
	body
	{
		background: linear-gradient(to right,PeachPuff,white);
		
	}
	#myForm
	{
		padding-top:2%;
		background:transparent;
		border:2px solid;
		padding-bottom:40px;
		width:30%;
		background-image: url("https://cdn.pixabay.com/photo/2023/04/24/10/16/architecture-7947724_640.jpg");
		background-size:cover;
		border-radius:10px;
	}
	input
	{
		padding:10px;
		width:170px;
		border:none;
		border-bottom:2px solid black;
		background: transparent;
		color:white;
	}
	#lBtn
	{
		padding:7px;
		border-radius:5px;
		border:none;
		background-color:DarkSalmon;
		font-weight:bold;
	}
	#rBtn
	{
		margin-left:10px;
		padding:7px;
		border-radius:5px;
		border:none;
		background-color:Peru;
		font-weight:bold;
	}
	#lBtn:hover
	{
		background-color:YellowGreen;
		color:white;
	}
	#rBtn:hover
	{
		background-color:SteelBlue;
		
		color:white;
	}
	#btnR
	{
		padding:5px;
		border-radius:5px;
		border:none;
		background-color:MidnightBlue;
		font-weight:bold;
		color:white;
	}
	h2
	{
		font-family: "Lucida Console", "Courier New", monospace;
		color:white;
	}
	p
	{
		font-weight:bold;
	}
	#btnR:hover
	{
		background-color:Teal;
		border-color:Teal;
	}
	::placeholder 
	{
  		color: white;
  		opacity: 1; 
	}
	a
	{
		background-color:blue;
		color:white;
		decoration:none;
		
		padding:2px;
	}
</style>
</head>
<body>
	<center>
		<form action="" id="myForm" onsubmit="loginForm(event)">
			<h2>Employee Login</h2>
			<input type="text" name="eId" placeholder="Enter EmailId / EmpId" > <br> <br>
			<input type="password" name="password" placeholder="Enter Password" id="password" required> <br> <br>
			<button type="submit" id="lBtn" >LOGIN</button>
			<button id="rBtn" type="reset">RESET</button> <br> <br>
			<a href="http://localhost:8080/SpringEmployee/ForgotPwd.jsp" target="blank">
			Forgot Password?</a>
		</form>
 		<p>Don't Have an Account? <form action="register">
		<button id="btnR">REGISTER</button>
		</form></a></p> 	
		
		<div style="color:red" id="err"></div>
	</center>
	<script type="text/javascript">
		
		function encrypt()
		{
			var pass=document.getElementById('password').value;
			var hash = CryptoJS.MD5(pass);
			document.getElementById('password').value=hash;
		}
		
		function loginForm(event) 
		{
		    event.preventDefault();
		    const formData = new FormData(event.target);
		    const data = new URLSearchParams(formData);
		    //Encrypt pwd
		    const password = data.get("password");
			const encryptedPassword = CryptoJS.MD5(password).toString();
			data.set("password", encryptedPassword);
		    let xhr = new XMLHttpRequest();
		    xhr.open('POST', '/SpringEmployee/loginEmp');
		    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		    xhr.onload = function() 
		    {
		        if (xhr.status === 200) 
		        {
		        	const redirectUrl = xhr.responseText;
		            alert("Logged in successfully");
		            window.location.href = redirectUrl;
		        } 
		        else 
		        {
		            alert("Invalid Details.Please Re-Login");
		        }
		    };
		    xhr.send(data);
		}
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
</body>
</html>
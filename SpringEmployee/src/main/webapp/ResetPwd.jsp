<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset Password</title>
<style type="text/css">
	body
	{
		background: linear-gradient(to right,white,lightgray); 
	}
	input
	{
		padding:10px;
		width:170px;
		border:none;
		border-bottom:2px solid black;
		border-radius:5px;
		background: transparent;
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
	#btnR:hover
	{
		background-color:Teal;
		border-color:Teal;
	}
	form
	{
		padding:20px;
		border:2px solid;
		border-radius:5px;
		width:20%;
		margin-top:5%;
		box-shadow:5px 5px 2px;
	}
	h2
	{
		color:FireBrick;
		font-family: Garamond, serif;  
  		text-shadow: 3px 3px 3px #ababab;
	}
</style>
</head>
<body>
<%String emailId = request.getParameter("emailId"); 
  System.out.println("ResetPwd "+emailId);%>
	<center>
		<form id="myForm" onsubmit="submitForm(event)">
		<h2>Reset Password</h2>
			<input type="email" name="emailId" value="<%=emailId%>" required readonly="readonly"> <br> <br>
			<input type="password" name="password" placeholder="Enter New Password" id="pwd"> <br> <br>
			<input type="password" name="cPassword" placeholder="Confirm New Password" id="cPwd"> <br> <br>
			<button id="btnR" >Change Password</button> 
		</form>
	</center>
	
	<script>
		function submitForm(event) 
		{
		  	event.preventDefault();
		  	const formData = new FormData(event.target);
		  	const data = new URLSearchParams(formData);
		  	
		  	const password = data.get("password");
		  	const encryptPassword = CryptoJS.MD5(password).toString();
		  	data.set("password", encryptPassword);
			
		  	let xhr = new XMLHttpRequest();
		  	xhr.open('POST','/SpringEmployee/resetPwd');
		  	xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		  	xhr.onload = function()
		  	{
				 alert("Password Updated Successfully");
				 window.location.href="http://localhost:8080/SpringEmployee/Login.jsp";
		  	}
		  	xhr.send(data.toString());	
		}
		
		var password = document.getElementById("password");
		var confirmPassword = document.getElementById("confirmPassword");
		function validate()
		{
			 if(password.value != confirmPassword.value)
			 {
			 	confirmPassword.setCustomValidity("Passwords Don't Match");
			 }
			 else
			 {
			 	confirmPassword.setCustomValidity('');
			 }
		 }
		password.onchange = validate;
		confirmPassword.onkeyup = validate;
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>home</title>
<style type="text/css">
	body
	{
		background-image: url("https://citius.com.br/wp-content/uploads/2017/02/aluguel-de-escritorio-virtual-ou-proprio-qual-vale-mais-a-pena-1.jpg");
		
		background-size:cover;
	}
	input,select
	{
		padding:10px;
		font-size:15px;
		width:200px;
	}
	#btn
	{
		padding:5px;
		font-weight:bold;
	}
	select
	{
		width:225px;
	}
	#wlcm
	{
		text-align:center;
		position:relative;
		left:71%;
		top:250px;
		border:2px solid;
		padding:25px;
		width:250px;
		padding-bottom:40px;
	}
	
	h2
	{
		color:white;
		font-family:Georgia, serif;
	}
	button
	{
		padding:5px;
		border-radius:5px;
		font-weight:bold;
		margin:2px;
	}
	button:hover
	{
		background-color:aquamarine;
		border:aquamarine;
		
	}
	header
	{
		background-color:Bisque;
		position:relative;
		top:-22px;
		width:100%;
		height:60px;
	}
	h1
	{
		text-align:center;
		position:relative;
		top:10px;
	}
</style>
</head>
<body>
	<header>
		<h1>e-Services</h1>
	</header>
	<div id="wlcm">
		<h2>Welcome to Home</h2>
		<div id="btns">
		<a href="http://localhost:8080/SpringEmployee/Login.jsp" target="blank"><button>LOGIN</button></a>
		<form action="register">
		<button>REGISTER</button>
		</form>
		<form action="jobDetails">
		<button>Job Details</button>
		</form>
		</div>
		
	</div>
	
	
	<script type="text/javascript">
		function submitForm(event) 
		{
		  	
		  	event.preventDefault();
		  	const formData = new FormData(event.target);
		  	const data = {};
			formData.forEach((value, key) => (data[key] = value));
			const jsonString = JSON.stringify(data);
			console.log(data);
			  	
			var json = JSON.parse(jsonString);
		  	let xhr = new XMLHttpRequest();
		  	xhr.open('POST','/SpringEmployee/create');
		  	xhr.setRequestHeader('Content-Type','application/json');
		  	xhr.onload = function()
		  	{
			  	if(xhr.status === 200)
			   	{
				  	console.log("Data Saved");
			   	}
		  	}
		  	xhr.send(jsonString);
		}
		
		var password = document.getElementById("pwd");
		var confirmPassword = document.getElementById("cPwd");
	
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
		
		function encrypt()
		{
			var pass=document.getElementById('pwd').value;
			var hide=document.getElementById('cPwd').value;
			if(pass=="")
			{
				document.getElementById('err').innerHTML='Error:Password is missing';
				return false;
			}
			else
			{
				document.getElementById("cPwd").value = document.getElementById("pwd").value;
				var hash = CryptoJS.MD5(pass);
				document.getElementById('pwd').value=hash;
				document.getElementById('cPwd').value=hash;
				return true;
			}
		}
		
		function register()
		{	 
			var xhttp =  new XMLHttpRequest();
			xhttp.onreadystatechange = function()
			{
				if(this.readyState == 4 && this.status === 200) 
				{
					document.getElementById("demo").innerHTML = xhttp.responseText;
				}
			};
			
			xhttp.open("GET","http://localhost:8080/SpringEmployee/register");
			
			xhttp.send();
		}
		
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
	<div id="demo"></div>
</body>
</html>
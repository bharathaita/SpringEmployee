<%@page import="com.aita.emp.JobRole"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<style type="text/css">
	body
	{
		background:linear-gradient(to right,black,white);
	}
	form
	{
		margin-top:30px;
		padding-bottom:30px;
		border:2px solid #6D7781;
		border-radius:10px;
		width:40%;
		background-image: url("https://cdn.pixabay.com/photo/2023/03/29/19/01/fern-7886160_640.jpg");
		background-size:cover;
		
	}
	input,select
	{
		width: 300px;
	    padding: 20px 0px;
	    background: transparent;
	    border: 0;
	    border-bottom: 1px solid #B0C4DE;
	    outline: none;
	    color: white;
	    font-size: 16px;
	}
	#btn1,#btn2
	{
		padding:10px;
		font-weight:bold;
		border-radius:5px;
	}
	#btnL
	{
		padding:7px;
		font-weight:bold;
		border-radius:5px;border:none;
	}
	#btnL:hover
	{
		background-color:ForestGreen;
		color: white;
		border:ForestGreen;
		text-shadow:2px 2px 5px black;
	}
	#btn1:hover
	{
		background-color:CornflowerBlue;
		color: white;
		border:CornflowerBlue;
	}
	#btn2:hover
	{
		background-color:grey;
		color:white;
		border:grey;
	}
	h2
	{
		color: white;
	  	font-family: 'Sofia', cursive;
	  	font-size: 10px;
	  	font-weight: bold;
	  	font-size: 2.1em;
	  	text-align: center;
	  	margin-bottom: 20px;
	}
	::placeholder 
	{
  		color: white;
  		opacity: 1; 
	}
	select
	{
		color:black;
		background-color: transparent;
	}
	p
	{
		color:white;
	}
</style>

</head>
<body>
<%List<JobRole> jobRole =(List<JobRole>) session.getAttribute("jobRole"); %>
	<center>
		<form action="" onsubmit="submitForm(event)" id="myForm">
			<h2>Employee Registration</h2>
			<input type="hidden" name="id" ><br>
			<input type="text" name="fullName" placeholder="Enter Full Name"> <br> <br>
			<input type="email" name="emailId" placeholder="Enter EmailId" required> <br> <br>
			<input type="" name="empId" onkeyup="validateNum(this)" placeholder="Enter EmpId" required> <br> <br>
<!-- 		<input type="text" name="jobRole" placeholder="Enter JobRole"> <br> <br>  -->
					
			<select name="jobId">
				<option >Job Role</option>
				<%for(JobRole job : jobRole){  %>
				<option value="<%=job.getJobId()%>"><%=job.getJobRole()%></option>
				<%
				//System.out.println("Job ID is "+job.getJobId());
				}
				
					%>
			</select> <br> <br>
				
			<input type="password" name="password" placeholder="Enter Password" id="pwd"> <br> <br>
			<input type="password" name="cPassword" placeholder="Confirm Password" id="cPwd"> <br> <br>
			<button id="btn1"  >Register</button>
			<button id="btn2" type="reset">Reset</button>
		</form>
		<p>Already Have an Account.
		<a href="http://localhost:8080/SpringEmployee/Login.jsp" target="blank" ><button id="btnL">LOGIN</button></a></p>
		<div style="color:red" id="err"></div>
	</center>
	
	<script type="text/javascript">
		function validateNum(input) 
		{
		  var value = input.value;

		  // Check if the input is numeric
		  if (typeof value === 'number') 
		  {
		    console.log("Input is numeric");
		  } 
		  else if (!isNaN(value)) 
		  {
		    console.log("Input is numeric");
		  } 
		  else 
		  {
		    alert("EmpId should be numeric");
		  }
		}
		
		function submitForm(event) 
		{
		  	event.preventDefault();
		  	const formData = new FormData(event.target);
		  	const data = {};
			formData.forEach((value, key) => 
			{
				   if (key === "password") 
				   {
				     value = CryptoJS.MD5(value).toString();
				   }
				   data[key] = value;
			});
			const jsonString = JSON.stringify(data);
			// Log the data.
			console.log(data);
			let eId = data.empId;	
			var json = JSON.parse(jsonString);
			//console.log(json);
		  	let xhr = new XMLHttpRequest();
		  	xhr.open('POST','/SpringEmployee/create');
		  	xhr.setRequestHeader('Content-Type','application/json');
		  	xhr.onload = function()
		  	{
			  	if(xhr.status === 200)
			   	{
				  	alert("Registration Done Successfully");
				  	window.location.href="http://localhost:8080/SpringEmployee/Login.jsp";
			   	}
			  	
			  	else
			  	{
			  		alert("Registration Failed due to Duplicate Entries")
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
		
		function login()
		{	 
			var xhttp =  new XMLHttpRequest();
			xhttp.onreadystatechange = function()
			{
				if(this.readyState == 4 && this.status === 200) 
				{
					document.getElementById("demo").innerHTML = xhttp.responseText;
				}
			};
			
			xhttp.open("GET","http://localhost:8080/SpringEmployee/Login.jsp");
			
			xhttp.send();
		}
		
		function check()
		{
			console.log("check is called");
			if(typeof empId != 'number')
			{
				alert("EmpId should be numeric");
			}
		}
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
	<div id="demo"></div>
</body>
</html>
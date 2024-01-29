<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Skills</title>
<style>
	body
	{
		background-image: url("https://cdn.pixabay.com/photo/2016/10/11/21/43/geometric-1732847_640.jpg");
		background-size:cover;
	}
	#btn
	{
		padding:8px;
		background-color:NavajoWhite;
		border:none;
		border-radius:4px;
		font-weight:bold;
	}
	#btn:hover
	{
		background-color:ForestGreen;
		border:2px ForestGreen;
		color:white;
	}
	h2
	{
		font-family:  "Audiowide", sans-serif;
		color:;
		text-shadow:3px 3px 5px white;
		padding-top:30px;
	}
	#home
	{
		position:fixed;
		left:87%;
		top:4%;
		padding:5px;
		background-color: DarkSeaGreen;
		border:none;
		border-radius:5px;
		font-weight:bold;
	}
	#home:hover
	{
		background-color: IndianRed;
		color:white;
	}
	a
	{
		color:white;
		text-decoration:none;
	}
</style>
</head>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<body>
<header>
	<a href="http://localhost:8080/SpringEmployee/JobDetails.jsp" target="blank">Job Details</a>
	<a href="http://localhost:8080/SpringEmployee/"><button id="home">LOGOUT</button></a>
</header>
	<center>
	<h2>Welcome to Your Profile</h2>
<!--	<td><%=session.getAttribute("emp.fullname") %></td>
 ${param.empId} -->	
	<form action="viewSkill" method="post" onsubmit="submit(event)">
		<input type="hidden" value="${param.empId}" name="eId">
		<button id="btn">View Skills</button>
	</form> <br>
	<a href="http://localhost:8080/SpringEmployee/GetAllEmp.jsp" target="blank">Get All Emp Data</a>
<!--	<form action="viewEmp" method="post">
		<input type="hidden" value="${param.empId}" name="eId">
		<button id="btn">View Employee</button>
	</form>-->	
	</center>
	<script type="text/javascript">
		function view(id)
		{	 
			console.log(id);
			var xhttp =  new XMLHttpRequest();
			xhttp.onreadystatechange = function()
			{
				if(this.readyState == 4 && this.status === 200) 
				{
					document.getElementById("demo").innerHTML = xhttp.responseText;
				}
			};
			
			xhttp.open("GET","http://localhost:8080/SpringEmployee/viewSkill?id="+id);
			
			xhttp.send();
		}
		
		function add()
		{	 
			var xhttp =  new XMLHttpRequest();
			xhttp.onreadystatechange = function()
			{
				if(this.readyState == 4 && this.status === 200) 
				{
					document.getElementById("demo").innerHTML = xhttp.responseText;
				}
			};
			
			xhttp.open("GET","http://localhost:8080/SpringEmployee/AddSkill.jsp");
			
			xhttp.send();
		}
		function submit(event) 
		{
		  	console.log("hey");
		  	event.preventDefault();
		  	const formData = new FormData(event.target);
		  	// Submit the data.
		  	const data = {};
			formData.forEach((value, key) => (data[key] = value));
			const jsonString = JSON.stringify(data);
			// Log the data.
			console.log(data);
			  	
			var json = JSON.parse(jsonString);
			//console.log(json);
		  	let xhr = new XMLHttpRequest();
		  	xhr.open('POST','/SpringEmployee/viewSkill');
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
	</script>
	<div id="demo"></div>
</body>
</html>
<%@page import="com.aita.emp.Skills"%>
<%@page import="java.util.List"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Skills</title>
<style type="text/css">
	body
	{
		background-image: url("https://cdn.pixabay.com/photo/2019/02/14/22/06/table-3997521_640.jpg");
		background-size:cover;
		font-family:"Trebuchet MS", Helvetica, sans-serif;
	}
	table
	{
		position:relative;
		top:30px;
		border-collapse:collapse;
	}
	td,th
	{
		padding:10px;
	}
	#demo
	{
		padding-top:30px;
	}
	#addBtn
	{
		padding:8px;
		font-weight:bold;
		background-color:Orange;
		border-radius:5px;
		border:none;
	}
	#addBtn:hover
	{
		background-color:Green;
		color:white;
	}
	#edt
	{
		padding:5px;
		background-color:CornflowerBlue;
		font-weight:bold;
		border:none;
		border-radius:4px;
	}
	#dlt
	{
		padding:5px;
		background-color:FireBrick;
		font-weight:bold;
		border:none;
		border-radius:4px;
	}
	#dlt:hover
	{
		color:white;
	}
	#edt:hover
	{
		color:white;
	}
	h1
	{
		font-family:Copperplate, Papyrus, fantasy;
		color:black;
		text-shadow: 2px 2px 5px Aquamarine;
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
</style>
</head>
<body>

<%List<Skills> skill =(List<Skills>) session.getAttribute("skill");%>
<header>
	<a href="http://localhost:8080/SpringEmployee/"><button id="home">LOGOUT</button></a>
</header>
	<div id="view">
	<center>
	<u><h1>View Skills</h1></u>	
		
		<table border="2">
			<tr>
				<th>Skill Name</th>
				<th>Skill Level</th>
				
				<th colspan="2">Actions</th>
			</tr>
			
			<%for(Skills sk : skill){%>
			<tr>
				<td><%=sk.getSkillName()%></td>
				<td><%=sk.getSkillLevel()%></td>
				
				<td><button onclick="edit(<%=sk.getId()%>)" id="edt">Edit</button></td>
				<td><button onclick="deleteData(<%=sk.getId()%>)" id="dlt">Delete</button></td>
			</tr>
			<%} %>
			</div>
			<tr>
				<table>
					<tr>
						<td><br><button onclick="add()" id="addBtn">Add Skill</button></td>
						
					</tr>
				</table>
			</tr>
		</table>
		
	</center>
	
	<script>
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
			
			xhttp.open("POST","http://localhost:8080/SpringEmployee/AddSkill.jsp");
			xhttp.send();
		}
		
		function edit(id)
		{	 
			var xhttp =  new XMLHttpRequest();
			xhttp.onreadystatechange = function()
			{
				if(this.readyState == 4 && this.status === 200) 
				{
					document.getElementById("demo").innerHTML = xhttp.responseText;
				}
			};
			
			xhttp.open("POST","http://localhost:8080/SpringEmployee/EditSkill.jsp?id="+id);
			
			xhttp.send();
		}
		
		function submitAddData(event) 
		{
		  	event.preventDefault();
		  	const formData = new FormData(event.target);
		  	
		  	const data = {};
			formData.forEach((value, key) => (data[key] = value));
			const jsonString = JSON.stringify(data);
			
			console.log(data);
			  	
			var json = JSON.parse(jsonString);
			
		  	const xhttp = new XMLHttpRequest();
		  	xhttp.open("POST",'/SpringEmployee/addSkill');
		  	xhttp.setRequestHeader('Content-Type','application/json');
		  	xhttp.onload = function()
		  	{
		  		if(xhttp.status == 200)
			   	{
			  		alert("One Skill Added");
			  		document.getElementById("view").innerHTML = this.responseText;
			   	}
			  	else
			  	{
			  		alert("No Skill Added")
			  	}
		  	}
		  	xhttp.send(jsonString);
		}
		
		function deleteData(id)
		{	 
	
			var xhttp =  new XMLHttpRequest();
			xhttp.onreadystatechange = function()
			{
				if(this.readyState == 4 && this.status === 200) 
				{
					document.getElementById("view").innerHTML = xhttp.responseText;
				}
			};
			
			xhttp.open("GET","http://localhost:8080/SpringEmployee/deleteSkill/"+id);
			alert("Record Deleted");
			xhttp.send();
		}
		function update()
		{
			alert("Skill Updated Successfully");
		}
		
		
	</script>
	<div id="demo"></div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Skill</title>
<style>
	body
	{
		background-image: url("https://cdn.pixabay.com/photo/2019/02/14/22/06/table-3997521_640.jpg");
		background-size:cover;
	}
	
	input
	{
		padding:10px;
		width:150px;
		border:none;
		background:transparent;
		border-bottom:2px solid;
		font-size:15px;
	}
	select
	{
		padding:10px;
		width:175px;
		border:none;
		background:transparent;
		border-bottom:2px solid;	
		font-size:15px;
	}
	#box
	{
		text-align: center;
	}
	
	#h2
	{
		color:Chocolate;
		font-family:arial;
	}
	#btn
	{
		padding:7px;
		font-weight:bold;
		background-color:DarkSeaGreen;
		border-radius:5px;
		margin-left:10px;
		border:none;
	}
	#btn:hover
	{
		background-color:DarkCyan;
		color:white;
	}
</style>
</head>
<body>
	<%String empId =(String) session.getAttribute("empId");
		System.out.println(empId);%>
	<div id="box">
		<form method="post" onsubmit="submitAddData(event)">
			<h2 id="h2">Add Skills</h2>
			<input type="hidden" name="id">
			<input type="text" name="skillName" placeholder="Enter Skill" required> <br> <br> 
			<select name="skillLevel" required>
				<option>SkillLevel</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select> <br> <br>
			<input type="hidden" readonly="readonly" name="empId" value="<%=session.getAttribute("empId")%>"> <br> <br>
			<button type="submit" id="btn">ADD</button>
			<button type="reset" id="btn">RESET</button>
		</form>
	</div>
	<script type="text/javascript">
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
	    console.log(id);
	    var skill = { id: id };
	    var xhr = new XMLHttpRequest();
	    xhr.onreadystatechange = function () 
	    {
	        if (this.readyState == 4) 
	        {
	            if (this.status == 200) 
	            {
	                console.log("Skill deleted successfully");
	            } 
	            else 
	            {
	                console.log("Failed to delete skill");
	            }
	        }
	    };
	    xhr.open("DELETE", "http://localhost:8080/SpringEmployee/deleteSkill/" + id, true);
	    xhr.setRequestHeader("Content-Type", "application/json");
	    xhr.send(JSON.stringify(skill));
	}
	</script>
</body>
</html>
<%@page import="com.aita.emp.JobRole"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Jobdetails</title>
<style>
	body
	{
		background-image: url("https://cdn.pixabay.com/photo/2022/03/18/17/38/pattern-7077094_640.png");
		background-size:cover;
	}
	td,th
	{
		padding:10px;
		text-align:center;
	}
	table
	{
		border-collapse:collapse;
	}
</style>
</head>
<body>
<%List<JobRole> jobRole =(List<JobRole>) session.getAttribute("jobRole"); %>
	<center>
		<h1>Job Details</h1>
		<table border="">
			<tr>
				<th>Job Role</th>
				<th>Count</th>
			</tr>
			<%for(JobRole jr : jobRole){%>
			<tr>
				<td><%=jr.getJobRole()%></td>
				<td onclick="getEmp(<%=jr.getJobId()%>)"><%=jr.getCount()%></td>
			</tr>
			<%} %>
		</table>
	</center>
	<script type="text/javascript">
		function getEmp(jobId)
		{
			console.log(jobId);
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function()
			{
				if(this.readyState == 4 && this.status === 200)
				{
					document.getElementById("demo").innerHTML = xhttp.responseText;
				}
			};
			xhttp.open("GET","http://localhost:8080/SpringEmployee/jobEmp/"+jobId);
			xhttp.send();
			
		}
		
	</script>
	<div id="demo"></div>
</body>
</html>
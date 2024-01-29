<%@page import="com.aita.emp.Skills"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Skill</title>
<style>
	form
	{
		padding-top:30px;
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
	#updt
	{
		padding:5px;
		background-color: DimGray;
		border:none;
		border-radius:2px;
		font-weight:bold;
	}
	#updt:hover
	{
		background-color: MidnightBlue;
		color:white;
	}
</style>
</head>
<body>
	<%List<Skills> skill =(List<Skills>)session.getAttribute("skill");
	String idParam = request.getParameter("id");

	Skills skData = null;
	for (Skills sk : skill) {
	if (String.valueOf(sk.getId()).equals(idParam)) {
	       skData = sk;
	       break;
	 	}
	}%>
	<center>
		<form method="post" action="editSkill">
			<h2 id="h2">Edit Skills</h2>
			<input type="hidden" name="id" value="<%=skData.getId()%>">
			<input type="text" name="skillName" placeholder="Enter Skill" required value="<%=skData.getSkillName()%>"> <br> <br> 
			<label>SkillLevel</label><br>
			<select name="skillLevel" >
				<option value="<%=skData.getSkillLevel()%>"><%=skData.getSkillLevel()%></option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select> <br> <br>
			<button type="submit" id="updt" onclick="update()">UPDATE</button>
		</form>
	</center>
	<script>
		function update()
		{
			alert("Skill Updated");
		}
	</script>
</body>
</html>
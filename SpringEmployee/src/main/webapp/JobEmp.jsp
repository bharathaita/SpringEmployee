<%@page import="com.aita.emp.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Job Employee</title>
<style type="text/css">
	table
	{
		border-collapse:collapse;
	}
</style>
</head>
<body>
<%List<Employee> emp =(List<Employee>) session.getAttribute("employee"); %>
	<center>
		<h2>Employee Info</h2>
		<table border="">
			<tr>
				<th>Name</th>
				<th>Email Id</th>
				<th>EmpId</th>
			</tr>
			<%for(Employee em : emp) {%>
			<tr>
				<td><%=em.getFullName()%></td>
				<td><%=em.getEmailId()%></td>
				<td><%=em.getEmpId()%></td>
			</tr>
			<%} %>
		</table>
	</center>
</body>
</html>
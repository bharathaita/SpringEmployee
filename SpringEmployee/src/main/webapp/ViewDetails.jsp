<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Details</title>
</head>
<body>
<%=session.getAttribute("fullname") %>
	<%String temp =(String) session.getAttribute("empId"); 
		int empId = Integer.parseInt(temp);%>
	<h2>Employee Details</h2>
	<table border="">
		<tr>
			<th>Name</th>
			<th>Email Id</th>
			<th>Emp Id</th>
			<th>Job Role</th>
		</tr>
		<tr>
			<td><%=session.getAttribute("empName")%></td>
		</tr>
	</table>
</body>
</html>
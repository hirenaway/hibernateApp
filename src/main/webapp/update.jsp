<%@page import="com.employee.entity.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update employee</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	<style type="text/css">
		tr,td{
			padding: 10px !important;
		}
	</style>
</head>
<body>
	<%
		Employee e = (Employee) request.getAttribute("employee");
	%>
	<form name="update" action="EmployeeController" method="post">
		<table>
			<tr>
				<td><input type="hidden" name="id" value="<%=e.getId()%>"></td>
			</tr>
			<tr>
				<td>First Name:</td>
				<td><input type="text" name="firstName" value="<%=e.getFirstName()%>"></td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td><input type="text" name="lastName" value="<%=e.getLastName()%>">
				</td>
			</tr>
			<tr>
				<td>Mobile:</td>
				<td><input type="number" name="mobile" value="<%=e.getMobile()%>">
				</td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input type="email" readonly="readonly" name="email" value="<%=e.getEmail()%>"></td>
			</tr>
			<tr>
				<td>password:</td>
				<td><input type="text" name="password" value="<%=e.getPassword()%>"></td>
			</tr>
			<tr>
				<td><input type="submit" value="update" name="action" class="btn btn-primary" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
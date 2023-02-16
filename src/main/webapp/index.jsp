<%@page import="com.employee.entity.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Hibernate App</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style type="text/css">
tr, td {
	padding: 10px !important;
}
</style>
</head>
<body>
	<%
	Boolean isLogin = false;
	Employee e = null;
	if (request.getAttribute("employee") != null && request.getAttribute("isLogin") != null) {
		e = (Employee) request.getAttribute("employee");
		isLogin = (Boolean) request.getAttribute("isLogin");
	}
	String message = "Welcome to the app";
	%>
	<form method="post" action="EmployeeController">
		<td><h2>
				<%
				if (isLogin && e != null) {
				%>
				<%=message +" " + e.getFirstName() + "!"%>
				<%
				}
				%>
			</h2></td>
	</form>
	<form method="post" action="EmployeeController">
		<tr>
			<td><a href="registration.jsp"> Register an Employee </a></td>
		</tr>
	</form>
	<form method="post" action="EmployeeController">
		<tr>
			<td><a href="view-all-employee.jsp"> View all Employee </a></td>
		</tr>
	</form>
	<form method="post" action="EmployeeController">
		<tr>
			<td>
			<%
			if (isLogin) {
			%> <a href="index.jsp"> Log out </a>
			</td>
			<%
			} else {
			%>
			<a href="login.jsp"> Log in </a>
			</td>
			<%
			}
			%>
			</td>
		</tr>
	</form>
</body>
</html>
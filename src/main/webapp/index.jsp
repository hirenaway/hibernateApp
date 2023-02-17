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
	<h2> 
		<%
		Employee employee =  null;
		if(session != null){
			if(session.getAttribute("employee") != null){
				employee = (Employee) session.getAttribute("employee");
				
		%>
			<a href="registration.jsp" class="btn btn-dark" > Register an Employee </a> || <a href="logout.jsp" class="btn btn-dark"> Log out </a> || <a href="view-all-employee.jsp" class="btn btn-dark"> View All Employee </a> || <a href="reset-password.jsp" class="btn btn-dark"> Change Password </a>
		<%	
			} else{
				%>
					<a href="registration.jsp" class="btn btn-dark" > Register an Employee </a> || <a href="login.jsp" class="btn btn-dark"> Log in </a>
				<% 
			}
		} else{
			%>
				<a href="registration.jsp" class="btn btn-dark" > Register an Employee </a> || <a href="login.jsp" class="btn btn-dark"> Log in </a>
			<%
		}
		%>
	</h2> 
</body>
</html>
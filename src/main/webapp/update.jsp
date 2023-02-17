<%@page import="com.employee.entity.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="index.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update employee</title>
</head>
<body>
	<%
		Employee em = (Employee) request.getAttribute("employee");
	%>
	<form name="update" action="EmployeeController" method="post">
		<table>
			<tr>
				<td>
					<input type="hidden" name="id" value="<%=em.getId()%>">
				</td>
			</tr>
			<tr>
				<td>First Name:</td>
				<td>
					<input type="text" name="firstName" value="<%=em.getFirstName()%>">
				</td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td><input type="text" name="lastName" value="<%=em.getLastName()%>">
				</td>
			</tr>
			<tr>
				<td>Mobile:</td>
				<td><input type="text" name="mobile" value="<%=em.getMobile()%>">
				</td>
			</tr>
			<tr>
				<td>Email:</td>
				<td>
					<input type="email" readonly="readonly" name="email" value="<%=em.getEmail()%>">
				</td>
			</tr>
			<tr>
				<td>
					<input type="hidden" name="password" value="<%=em.getPassword()%>">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="update" name="action" class="btn btn-primary" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
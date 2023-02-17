<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="index.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add employee</title>
</head>
<body>
<b style="color:red;" >
	<%
	String message = "";
	if (request.getAttribute("message") != null) {
		out.println(request.getAttribute("message"));
	}
	%>
</b>
	<form name="action" action="EmployeeController" method="post">
		<table>
			<tr>
				<td>First Name:</td>
				<td>
					<input type="text" name="firstName"  required="required">
				</td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td>
					<input type="text" class="" name="lastName" required="required">
				</td>
			</tr>
			<tr>
				<td>Email:</td>
				<td>
					<input type="email" required="required" name="email" >
				</td>
			</tr>
			<tr>
				<td>Mobile:</td>
				<td>
					<input type="text" class=""  name="mobile" required="required">
				</td>
			</tr>
			<tr>
				<td>Password:</td>
				<td>
					<input type="password" name="password" required="required">
				</td>
			</tr>
			<tr>
				<td>Confirm Password:</td>
				<td>
					<input type="password" name="confirmpassword" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" name="action" value="Register" class="btn btn-primary" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
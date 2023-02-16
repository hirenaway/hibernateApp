<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add employee</title>
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
	String message = "";
	if (request.getAttribute("message") != null) {
		message = (String) request.getAttribute("message");
	}
	%>
	<form name="action" action="EmployeeController" method="post">
		<table>
			<tr>
				<td>
					<h2>
						<%
						if (StringUtils.isNoneBlank(message)) {
						%>
						<%=message%>
						<%
						}
						%>
					</h2>
				</td>
			</tr>
			<tr>
				<td>First Name:</td>
				<td><input type="text" name="firstName"  required="required"></td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td><input type="text" name="lastName" required="required"></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input type="email" required="required" name="email" ></td>
			</tr>
			<tr>
				<td>Mobile:</td>
				<td><input type="text" name="mobile" required="required"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" required="required"></td>
			</tr>
			<tr>
				<td>Confirm Password:</td>
				<td><input type="password" name="confirmpassword" required="required"></td>
			</tr>
			<tr>
				<td><input type="submit" name="action" value="insert" class="btn btn-primary" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log in</title>
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
	String message = "";
	if (request.getAttribute("loginFailed") != null) {
		message = (String) request.getAttribute("loginFailed");
	}
	%>
	<form>
	<table>
			<tr>
				<td><h2>
						<%
						if (StringUtils.isNoneBlank(message)) {
						%>
							<%=message%>
						<%
						}
						%>
					</h2></td>
			</tr>
		</table>
	</form>
	<form  method="post" action="EmployeeController">
			<tr>
				<td>Email:</td>
				<td><input type="text" name="email" required="required"></td>
			</tr>
			<tr>
				<td>password:</td>
				<td><input type="text" name="password" required="required"></td>
			</tr>
			<tr>
				<td><input type="submit" name="action" value="login" class="btn btn-primary" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
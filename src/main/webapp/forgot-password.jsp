<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ include file="index.jsp"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot password</title>
</head>
<body>
	<b style="color: red;"> <%
 if (request.getAttribute("message") != null) {
 	out.println(request.getAttribute("message"));
 }
 %>
	</b>
	<form method="post" action="EmployeeController">
		<tr>
			<td>Email:</td>
			<td>
				<input type="email" name="email" required="required">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" name="action" value="Send OTP" class="btn btn-primary" />
			</td>
		</tr>
	</form>
</body>
</html>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="index.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log in</title>
</head>
<body>
	<b style="color:blue;" >
		<%
		if (request.getAttribute("message") != null) {
			out.println(request.getAttribute("message"));
		}
		%>
	</b>
	<b style="color:red;" >
		<%
		if (request.getAttribute("loginFailed") != null) {
			out.println(request.getAttribute("loginFailed"));
		}
		%>
	</b>
	<form method="post" action="EmployeeController">
			<tr>
				<td>Email:</td>
				<td>
					<input type="text" name="email" required="required">
				</td>
			</tr>
			<tr>
				<td>password:</td>
				<td>
					<input type="password" name="password" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a href="forgot-password.jsp" class="btn btn-primary"> Forgot Password </a>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" name="action" value="login" class="btn btn-primary" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ include file="index.jsp"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset Password</title>
</head>
<body>
	<b style="color: red;"> <%
 if (request.getAttribute("passwordError") != null) {
 	out.println(request.getAttribute("passwordError"));
 }
 %>
	</b>
	<form method="post" action="EmployeeController">
		<%
		Employee emp =  null;
		if(session != null  && session.getAttribute("employee") != null){
		%>
			<tr>
				<td>Old Password:</td>
				<td>
					<input type="password" name="oldPassword" required="required">
				</td>
			</tr>
			<tr>
				<td>New Password:</td>
				<td>
					<input type="password" name="newPassword" required="required">
				</td>
			</tr>
			<tr>
				<td>Confirm New Password:</td>
				<td>
					<input type="password" name="newConfirmPassword" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" name="action" value="Change Password" class="btn btn-primary" />
				</td>
			</tr>
		<% 
			} else {
		%>
			<tr>
			<td>New Password:</td>
			<td>
				<input type="password" name="newPassword" required="required">
			</td>
		</tr>
		<tr>
			<td>Confirm New Password:</td>
			<td>
				<input type="password" name="newConfirmPassword" required="required">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" name="action" value="Change Password" class="btn btn-primary" />
			</td>
		</tr>
		<%
			}
		%>
		
		</table>
	</form>
</body>
</html>
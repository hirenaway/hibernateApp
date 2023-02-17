<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ include file="index.jsp"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OTP Authentication</title>
</head>
<body>
	<form method="post" action="EmployeeController">
		<tr>
			<td>Enter OTP:</td>
			<td>
				<input type="text" name="verifyOTP" required="required">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" name="action" value="verify OTP" class="btn btn-primary" />
			</td>
		</tr>
		</table>
	</form>
</body>
</html>
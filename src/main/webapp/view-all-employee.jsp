<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.employee.entity.Employee"%>
<%@page import="com.employee.dao.EmployeeDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of employee</title>
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
	<form method="post" action="EmployeeController">
		<table width=100% border="1" cellpadding="10px" cellspacing="10px">
			<tr>
				<td>ID</td>
				<td>First Name</td>
				<td>Last name</td>
				<td>Mobile</td>
				<td>Email</td><
				<td>Password</td>
				<td>Edit</td>
				<td>Delete</td>
			</tr>
			<%
			List<Employee> employeeList = EmployeeDao.getAllEmployee();
			if (!employeeList.isEmpty()) {
				for (Employee e : employeeList) {
			%>
			<tr>
				<td><%=e.getId()%></td>
				<td><%=e.getFirstName()%></td>
				<td><%=e.getLastName()%></td>
				<td><%=e.getMobile()%></td>
				<td><%=e.getEmail()%></td>
				<td><%=e.getPassword()%></td>
				<td>
					<form name="edit" method="post" action="EmployeeController">
						<input type="hidden" name="id" value="<%=e.getId()%>"> <input
							type="submit" name="action" value="Edit" class="btn btn-primary" />
					</form>
				</td>
				<td>
					<form name="delete" method="post" action="EmployeeController">
						<input type="hidden" name="id" value="<%=e.getId()%>"> <input
							type="submit" name="action" value="Delete"
							class="btn btn-danger" />
					</form>
				</td>
			</tr>
			<%
			}
			}
			%>

		</table>
	</form>

</body>
</html>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.employee.entity.Employee"%>
<%@page import="com.employee.dao.EmployeeDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="index.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of employee</title>
</head>
<body>
<b style="color:blue;" >
		<%
		if (request.getAttribute("message") != null) {
			out.println(request.getAttribute("message"));
		}
		%>
</b>
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
				for (Employee em : employeeList) {
			%>
			<tr>
				<td><%=em.getId()%></td>
				<td><%=em.getFirstName()%></td>
				<td><%=em.getLastName()%></td>
				<td><%=em.getMobile()%></td>
				<td><%=em.getEmail()%></td>
				<td><%=em.getPassword()%></td>
				<td>
					<form name="edit" method="post" action="EmployeeController">
						<input type="hidden" name="id" value="<%=em.getId()%>"> <input
							type="submit" name="action" value="Edit" class="btn btn-primary" />
					</form>
				</td>
				<td>
					<form name="delete" method="post" action="EmployeeController">
						<input type="hidden" name="id" value="<%=em.getId()%>"> <input
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
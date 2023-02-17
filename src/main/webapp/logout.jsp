<%
	session.removeAttribute("employee");
	session.invalidate();
	request.setAttribute("message", "Your session has ended");
	request.getRequestDispatcher("login.jsp").forward(request, response);
%>
package com.employee.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.employee.dao.EmployeeDao;
import com.employee.entity.Employee;

public class EmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Employee employee = null;
	int emailExist = 0;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if ((action.equalsIgnoreCase("insert")
				&& request.getParameter("password").equals(request.getParameter("confirmpassword")))
				|| action.equalsIgnoreCase("update")) {
			String dynamicAddorUpdate = action.equalsIgnoreCase("insert") ? "added" : "updated";
			saveEmployee(action, request, response);
			request.setAttribute("message", "Employee has been successfully " + dynamicAddorUpdate + " !");
			request.getRequestDispatcher("view-all-employee.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("edit")) {
			int id = Integer.parseInt(request.getParameter("id"));
			employee = EmployeeDao.getEmployee(id);
			request.setAttribute("employee", employee);
			request.getRequestDispatcher("update.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			EmployeeDao.deleteEmployee(id);
			request.setAttribute("message", "Employee has been successfully deleted!");
			request.getRequestDispatcher("view-all-employee.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("login")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			employee = EmployeeDao.authenticateEmailPassword(email, password);
			if (employee != null) {
				request.setAttribute("isLogin", true);
				request.setAttribute("employee", employee);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			} else {
				request.setAttribute("loginFailed", "Invalid email or password");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "Password and confirm password did not match");
			request.getRequestDispatcher("registration.jsp").forward(request, response);
		}
		doGet(request, response);
	}

	protected void saveEmployee(String action, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		Employee employee = new Employee();
		emailExist = authenticateEmail(request.getParameter("email"));
		if (action.equalsIgnoreCase("update")) {
			employee.setId(Integer.parseInt(request.getParameter("id")));
		}
		employee.setFirstName(request.getParameter("firstName"));
		employee.setLastName(request.getParameter("lastName"));
		employee.setMobile(Long.parseLong(request.getParameter("mobile")));
		if (action.equalsIgnoreCase("insert") && emailExist > 0) {
			request.setAttribute("message", "Email already exist, please try a different one");
			request.getRequestDispatcher("registration.jsp").forward(request, response);
		} else {
			employee.setEmail(request.getParameter("email"));
			employee.setPassword(request.getParameter("password"));
			EmployeeDao.saveEmployee(employee);
		}
	}

	protected int authenticateEmail(String email) {
		return emailExist = EmployeeDao.checkEmail(email);
	}

}

package com.employee.controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.employee.dao.EmployeeDao;
import com.employee.entity.Employee;
import com.employee.util.EmployeeEmailVerification;

public class EmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Employee employee = null;
	int generatedOtp;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("Register") || action.equalsIgnoreCase("update")) {
			saveEmployee(action, request, response);
		} else if (action.equalsIgnoreCase("edit")) {
			int id = Integer.parseInt(request.getParameter("id"));
			employee = EmployeeDao.getEmployee(id);
			request.setAttribute("employee", employee);
			request.getRequestDispatcher("update.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			employee = EmployeeDao.deleteEmployee(id);
			request.setAttribute("message","Employee " + employee.getFirstName() + employee.getLastName() + " has been successfully deleted!");
			request.getRequestDispatcher("view-all-employee.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("login")) {
			employee = EmployeeDao.checkEmail(request.getParameter("email"));
			logIn(employee, request, response);
		} else if (action.equalsIgnoreCase("Send OTP")) {
			employee = EmployeeDao.checkEmail(request.getParameter("email"));
			sendOTPmethod(employee, request, response);
		} else if (action.equalsIgnoreCase("verify OTP")) {
			sendToResetPassword(request, response);
		} else if (action.equalsIgnoreCase("Change Password")) {
			resetPassword(employee, request, response);
		}
	}

	protected void saveEmployee(String action, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String dynamicAddorUpdate = action.equalsIgnoreCase("Register") ? "registered" : "updated";
		employee = EmployeeDao.checkEmail(request.getParameter("email"));
		if (action.equalsIgnoreCase("Register") && employee != null) {
			request.setAttribute("message", "Email already exist, please try a different one");
			request.getRequestDispatcher("registration.jsp").forward(request, response);
		} else if (!request.getParameter("password").equals(request.getParameter("confirmpassword"))) {
			request.setAttribute("message", "Password and confirm password did not match");
			request.getRequestDispatcher("registration.jsp").forward(request, response);
		} else {
			employee = new Employee();
			if (action.equalsIgnoreCase("update")) {
				employee.setId(Integer.parseInt(request.getParameter("id")));
			}
			employee.setFirstName(request.getParameter("firstName"));
			employee.setLastName(request.getParameter("lastName"));
			employee.setMobile(Long.parseLong(request.getParameter("mobile")));
			employee.setEmail(request.getParameter("email"));
			employee.setPassword(request.getParameter("password"));
			EmployeeDao.saveEmployee(employee);
			request.setAttribute("message", "Employee has been " + dynamicAddorUpdate + " successfully!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	protected void logIn(Employee employee, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		if (employee != null && request.getParameter("password").equals(employee.getPassword())) {
			HttpSession httpSession = request.getSession();
			System.out.println(httpSession.getId());
			httpSession.setAttribute("employee", employee);
			request.setAttribute("message", "Welcome to the app " + employee.getFirstName() + " " + employee.getLastName() +"!");
			request.getRequestDispatcher("view-all-employee.jsp").forward(request, response);
		} else if (employee == null) {
			request.setAttribute("loginFailed", "Email is not registered");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
			request.setAttribute("loginFailed", "Incorrect password");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	protected void sendOTPmethod(Employee employee, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		if (employee != null) {
			setGeneratedOtp(generateOTPforForGotPassword());
			EmployeeEmailVerification.sendOtpEmail(employee.getEmail(), getGeneratedOtp());
			request.getRequestDispatcher("authenticate-otp.jsp").forward(request, response);
		} else {
			request.setAttribute("message", "Email is not registered");
			request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
		}
	}

	protected void sendToResetPassword(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		if (getGeneratedOtp() > 0 && getGeneratedOtp() == Integer.parseInt(request.getParameter("verifyOTP"))) {
			request.getRequestDispatcher("reset-password.jsp").forward(request, response);
		} else {
			request.setAttribute("message", "Incorrect OTP");
			request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
		}
	}

	protected void resetPassword(Employee employee, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		if (request.getParameter("oldPassword") != null) {
			if (employee != null && !employee.getPassword().equals(request.getParameter("oldPassword"))) {
				request.setAttribute("passwordError", "Old password is not correct");
				request.getRequestDispatcher("reset-password.jsp").forward(request, response);
			} else if (!request.getParameter("newPassword").equals(request.getParameter("newConfirmPassword"))) {
				request.setAttribute("passwordError", "new password and comfirm password does not match");
				request.getRequestDispatcher("reset-password.jsp").forward(request, response);
			} else {
				updatePassword(employee, request, response);
			}
		} else if (!request.getParameter("newPassword").equals(request.getParameter("newConfirmPassword"))) {
			request.setAttribute("message", "new password and comfirm password does not match");
			request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
		} else {
			updatePassword(employee, request, response);
		}
	}

	protected void updatePassword(Employee employee, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		if(employee != null) {
			employee.setPassword(request.getParameter("newPassword"));
			EmployeeDao.saveEmployee(employee);
			request.setAttribute("message", "Password has been reset successfully!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
			request.setAttribute("message", "Sorry, Something went wrong");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	protected int generateOTPforForGotPassword() {
		Random random = new Random();
		String s = String.format("%04d", random.nextInt(10000));
		return Integer.parseInt(s);
	}

	public int getGeneratedOtp() {
		return generatedOtp;
	}

	public void setGeneratedOtp(int generatedOtp) {
		this.generatedOtp = generatedOtp;
	}
}

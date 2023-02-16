package com.employee.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.employee.entity.Employee;
import com.employee.util.EmployeeUtil;

public class EmployeeDao {

	public static void saveEmployee(Employee employee) {
		SessionFactory sessionFactory = EmployeeUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(employee);
		session.getTransaction().commit();
		session.close();
	}

	public static List<Employee> getAllEmployee(){
		SessionFactory sessionFactory = EmployeeUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<Employee> employees = session.createQuery("from Employee").list();
		session.close();
		return employees;
	}
	
	public static Employee getEmployee(int id){
		SessionFactory sessionFactory = EmployeeUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Employee selectedEmployee = session.get(Employee.class, id);
		session.close();
		return selectedEmployee;
	}
	
	public static void deleteEmployee(int id) {
		SessionFactory sessionFactory = EmployeeUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Employee selectedEmployee = session.get(Employee.class, id);
		session.delete(selectedEmployee);
		session.getTransaction().commit();
		session.close();
	}

	public static Employee authenticateEmailPassword(String email, String password) {
		SessionFactory sessionFactory = EmployeeUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		String hql = "FROM Employee E WHERE E.email = " +"'"+ email +"'"+ "and E.password = "+"'"+ password+ "'";
		List<Employee> results = session.createQuery(hql).list();
		session.close();
		return results.get(0);
	}

	public static int checkEmail(String email) {
		SessionFactory sessionFactory = EmployeeUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		String hql = "FROM Employee E WHERE E.email = " +"'"+ email +"'";
		List<Employee> results = session.createQuery(hql).list();
		session.close();
		return !results.isEmpty() ? 1 : 0;
	}
}

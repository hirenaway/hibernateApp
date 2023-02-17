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
	
	public static Employee deleteEmployee(int id) {
		SessionFactory sessionFactory = EmployeeUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Employee selectedEmployee = session.get(Employee.class, id);
		session.delete(selectedEmployee);
		session.getTransaction().commit();
		session.close();
		return selectedEmployee;
	}

	public static Employee checkEmail(String email) {
		SessionFactory sessionFactory = EmployeeUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Employee result = (Employee) session.createQuery("FROM Employee E WHERE E.email = :e").setParameter("e", email).uniqueResult();
		session.close();
		return result;
	}
}

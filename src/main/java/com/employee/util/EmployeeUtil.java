package com.employee.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.employee.entity.Employee;

public class EmployeeUtil {
	
	public static SessionFactory sf = null;

	public static SessionFactory getSessionFactory() {
		if(sf == null) {
			sf = new Configuration()
					.configure()
					.addAnnotatedClass(Employee.class)
					.buildSessionFactory();
			return sf;
		}
		return sf;
	}

}

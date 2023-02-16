package com.employee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@Entity
@ToString
@Table(name = "employee_details")
public class Employee {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name =  "first_name")
	private String firstName;
	
	@Column(name =  "last_name")
	private String lastName;
	
	@Column(name = "mobile")
	private long mobile;
	
	@Column(name = "email", unique = true)
	private String email;
	
	@Column(name = "password")
	private String password;

}

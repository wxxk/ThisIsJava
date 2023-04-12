package ch07;

import java.util.Date;


public class Manager extends Employee {
	private String department;
	
	public Manager(String name, double salary, Date birthDate, String department) {
		super(name, salary, birthDate);
		this.department = department;
		System.out.println("Manager(name, salary, birthDate, department)");
	}
	
	public Manager(String name, String department) {
		super(name);
		this.department = department;
		System.out.println("Manager(name, department)");
	}
	
	public Manager(String department) {
		this(null, department);
		this.department = department;
		System.out.println("Manager(department)");
	}
}

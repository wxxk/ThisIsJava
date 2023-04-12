package ch07;

public class Teacher extends Person {
//	String name;
//	int age;
	protected String major;
	
	public Teacher() {
		super();
	}
	
	public Teacher(String name, int age, String major) {
		super(name, age);
		this.major = major;
	}
	
}

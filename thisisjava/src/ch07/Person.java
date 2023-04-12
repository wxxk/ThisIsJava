package ch07;

public class Person {	//extends Object 생략(자동생성)
	protected String name;
	protected int age;
	
	// 생성자는 부모의 것부터 만들어줘야함
	public Person() {
		
	}
	
	public Person(String name, int age) {
		// super(); 생략(자동생성)
		this.name = name;
		this.age = age;
	}
		
	public String getDetails() {
		return "이름: " + name + "\t나이: " + age;
	}
}

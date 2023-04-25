package ch15.sec05.exam03;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Setter @Getter
@AllArgsConstructor

public class Person implements Comparable<Person> {
	private String name;
	private int age;
	
	@Override
	public int compareTo(Person o) {
		return this.age - o.age;
	}
	
	
}

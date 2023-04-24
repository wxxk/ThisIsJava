package ch12.verify;

import java.util.HashSet;

public class StudentExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		HashSet<Student> hashSet = new HashSet<Student>();
		System.out.println(hashSet.add(new Student("1")));
		System.out.println(hashSet.add(new Student("1")));
		System.out.println(hashSet.add(new Student("2")));
		System.out.println(hashSet.size());
	}

}

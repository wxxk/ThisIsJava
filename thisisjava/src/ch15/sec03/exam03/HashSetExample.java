package ch15.sec03.exam03;

import java.util.*;

public class HashSetExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Set<String> set = new HashSet<String>();
		
		set.add("Java");
		set.add("JDBC");
		set.add("JSP");
		set.add("Spring");
		
		for(String s : set) {
			System.out.println(s);
		}
		System.out.println();
		
		set.remove("JDBC");
		
		for(String s : set) {
			System.out.println(s);
		}
	}

}

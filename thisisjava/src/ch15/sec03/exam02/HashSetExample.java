package ch15.sec03.exam02;

import java.util.*;

public class HashSetExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Set<Member> set = new HashSet<Member>();
		
		
		Member b1 = new Member("홍길동", 30);
		Member b2 = new Member("홍길동", 30);
		System.out.println(b1.hashCode());
		System.out.println(b2.hashCode());
//		set.add(new Member("홍길동", 30));
//		set.add(new Member("홍길동", 30));
		
		System.out.println("총 객체 수 : " + set.size());
	}

}

package ch03.sec06;

public class ComareExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a = 10;
		int b = 20;
		System.out.println(a == b);
		System.out.println(a != b);
		System.out.println(a>b);
		short a1 = 200;
		char a2 = 300;
		System.out.println(a1 < a2);
		System.out.println(64 < 'A');
		
		System.out.println("--------------------");
		
		String s1 = "Hello";
		String s2 = "Hello";
		String s3 = new String("Hello");
		String s4 = new String("Hello");
		System.out.println(s1 == s2);
		System.out.println(s1 == s3);
		System.out.println(s3 == s4);
		System.out.println(s1.equals(s3));
	}

}

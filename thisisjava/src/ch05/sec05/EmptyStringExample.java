package ch05.sec05;

public class EmptyStringExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String hobby = "";
		// String 변수에 빈 문자열("")을 대입 가능
		// 빈 문자열도 객체로 생성되기 때문에 변수가 빈 문자열을 참조하는지 조사하려면 equals() 메소드 사용
		
		if (hobby.equals("")) {
			System.out.println("hobby 변수가 참조하는 String 객체는 빈 문자열");
		}
		
		if (hobby == "") {
			System.out.println("hobby true");
		}
		
		String hobby2 = new String("");
		if (hobby2 == "") {
			System.out.println("new hobby true");
		}
		
		String name1 = "홍길동";
		if (name1 == "홍길동") {
			System.out.println("홍길동 true");
		}
		
		String name2 = new String("홍길동");
		if (name2 == "홍길동") {
			System.out.println("new 홍길동 true");
		}
	}	

}

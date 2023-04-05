package ch05.sec05;

public class EqualsExample2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String strVar1 = "홍길동";
		String strVar2 = "홍길동";
		// strVar1을 heap 정적 area에 담아두고 strVar2를 생성할 때 먼저 있나 확인
		// 같은 String 객체의 번지수를 가지게 된다.
		
		if (strVar1 == strVar2) {
			System.out.println("strVar1과 strVar2는 참조가 같음");
		} else {
			System.out.println("strVar1과 strVar2는 참조가 다름");
		}
		
		if (strVar1.equals(strVar2)) {
			System.out.println("strVar1과 strVar2는 문자열이 같음");
		}
		
		System.out.println("----------------------------------------");
		
		String strVar3 = new String("홍길동");
		String strVar4 = new String("홍길동");
		// new -> strVar3과 strVar4는 서로 다른 String 객체의 번지수를 가지게 된다.
		
		if (strVar3 == strVar4) {
			System.out.println("strVar3과 strVar4는 참조가 같음");
		} else {
			System.out.println("strVar3과 strVar4는 참조가 다름");
		}
		
		if (strVar3.equals(strVar4)) {
			System.out.println("strVar1과 strVar2는 문자열이 같음");
		}
		
	}

}

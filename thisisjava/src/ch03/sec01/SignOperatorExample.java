package ch03.sec01;

public class SignOperatorExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 정수 타입(byte, shor, int) 연산 결과는 int 타입
		int x = -100;
		x = -x;
		System.out.println("x: " + x);
		
		// 부호를 변경하는 것도 연산 => int 타입 변수에 대입
		byte b = 100;
		int y = -b;
		System.out.println("y: " + y);
	}

}

package ch02.sec01;

public class VariableInitializationExample {
	public static void main(String[] args) {
		// 변수 value 선언
		int value;
		value =10;
		// 연산 결과를 변수 result의 초기값으로 대입
		// 초기화 되지 않은 변수는 아직 메모리에 할당되지 않았기 때문에 변수를 통해 메모리 값을 읽을 수 없다.
		int result = value + 10;
		
		// 변수 result 값을 읽고 콘솔에 출력
		System.out.println(result);
	}
}

package ch03.sec04;

public class AccuracyExample1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 산술 계삭을 정확하게 하기 위해선 실수 타입을 사용하지 않는 것이 좋다.
		int apple = 1;
		double pieceUnit = 0.1;
		int number = 7;
		
		double result = apple - number*pieceUnit;
		System.out.println("사과 1개에서 남은 양: " + result);	// 0.29999999999999993
	}

}

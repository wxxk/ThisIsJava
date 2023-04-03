package ch02.sec05;

public class BooleanExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		boolean stop = true;
		if(stop) {
			System.out.println("중지합니다.");
		} else {
			System.out.println("시작합니다.");
		}
		
		int x = 10;
		boolean result1 = (x == 20);	// 변수 x의 값이 20인가?
		boolean result2 = (x != 20);	// 변수 x의 값이 20이 아닌가?
		boolean result3 = (x > 20);		// 변수 x의 값이 20보다 큰가?
		boolean result4 = (0 < x && x < 20);	// 변수 x의 값이 0보다 크고, 20보다 적은가?
		boolean result5 = (0 < x || x < 20);	// 변수 x의 값이 0보다 적거나, 200보다 큰가?
		
		System.out.println("result1: " + result1);
		System.out.println("result2: " + result2);
		System.out.println("result3: " + result3);
		System.out.println("result4: " + result4);
		System.out.println("result5: " + result5);
		
	}

}

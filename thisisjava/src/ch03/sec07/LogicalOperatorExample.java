package ch03.sec07;

public class LogicalOperatorExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int charCode = 'A';
		// int charCode = 'a';
		// int charCode = '5';
		
		// &&는 앞의 피연산자라 false라면 뒤의 피연산자를 평가하지 않고 바로 false 출력
		// &는 두 연산자 모두를 평가해서 산출한 결과
		// &보다 &&가 더 효율적으로 동작
		
		// ||와 |도 마찬가지
		if ( (65<=charCode) & (charCode<=90) ) {
			System.out.println("대문자이군요.");
		}
		
		if ( (97<=charCode) && (charCode<122) ) {
			System.out.println("소문자이군요.");
		}
		
		if ( (48<=charCode) && (charCode<=57) ) {
			System.out.println("0~9 숫자이군요");
		}
		
		System.out.println("--------------------------");
		
		int value = 6;
		// int value = 7;
		
		if ( (value%2==0) | (value%3==0) ) {
			System.out.println("2 또는 3의 배수이군요.");
		}
		
		boolean result = (value%2==0) || (value%3==0);
		if ( !result ) {
			System.out.println("2 또는 3의 배수가 아니군요.");
		}
	}

}

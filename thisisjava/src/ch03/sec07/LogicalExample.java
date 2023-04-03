package ch03.sec07;

public class LogicalExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a = 10;
		int b = 20;
		System.out.println(a++>10 && ++b>20);
		System.out.println(b);
		
		int x = 10;
		int y = 20;
		System.out.println(x++>10 & ++y>20);
		System.out.println(y);
		
		// ^는 제곱이 아니고 비트 베타적 XOR
		System.out.println(5^2);	// 00000101 ^ 00000010 = 00000111(7)
		
	}

}

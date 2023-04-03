package ch03.sec04;

public class AccuracyExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for(double i=0.1; i<=1.0; i=i+0.1) {
			System.out.println(i);
		}
		double a = 5/0;
		System.out.println(a);	// Infinity : 예외처리 / Infinity 여부 체크
	}

}

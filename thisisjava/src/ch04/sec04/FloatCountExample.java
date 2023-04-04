package ch04.sec04;

public class FloatCountExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// for문을 작성할 때 초기화식에서 부동 소수점을 하용하면 안된다!!
		for (float x=0.1f; x <=1.0f ; x+=0.1f) {
			System.out.println(x);
		}
	}

}

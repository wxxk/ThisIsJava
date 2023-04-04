package ch04.sec04;

public class GuGuExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for (int i = 1; i < 10; i++) {
			for (int j = 2; j < 10; j++) {
				System.out.printf("%d X %d = %2d | ", j, i, i*j);
			}
			System.out.println();
		}
	}

}

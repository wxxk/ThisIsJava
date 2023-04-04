package ch04.sec04;

public class MultiplicationTableExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for (int i = 2; i < 10; i++) {
			System.out.println("*** " + i + "단 ***");
			for (int j = 1; j <10; j++) {
				System.out.printf("%d x %d = %2d", i, j, i*j);
				System.out.println();
			}
		}
	}
}

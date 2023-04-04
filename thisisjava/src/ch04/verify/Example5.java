package ch04.verify;

public class Example5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for (int i = 0; i < 11; i++) {
			for (int j = 0; j < 11; j++) {
				if ((4 * i) + (5 * j) == 60) {
					System.out.printf("(%d,%d)", i, j);
					System.out.println();
				}
			}
		}
	}
}

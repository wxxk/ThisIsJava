package ch04.verify;

public class Example6 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int row = 5;
		for (int i = 0; i<row; i++) {
			for (int j = 0; j<i+1; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}

}

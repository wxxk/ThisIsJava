package ch04.verify;

public class Example4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		while (true) {
			int i = (int)(Math.random() * 6) + 1;
			int j = (int)(Math.random() * 6) + 1;
			
			if ( (i+j) == 5 ) {
				System.out.printf("(%d, %d) 합: %d", i, j, i+j);
				break;
			}

			System.out.printf("(%d, %d)", i, j);
			System.out.println();
		}
		
	}

}

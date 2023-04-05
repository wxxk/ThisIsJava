package problem;

import java.util.Scanner;

public class Ex0404 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		int t = scanner.nextInt();
		
		for (int i = 0; i < t; i++) {
			System.out.print("#" + (i+1) + " ");
			int n = scanner.nextInt();
			int sum = 0;
			for (int j = 0; j < n; j++) {
				int num = scanner.nextInt();
				sum += num;
			}
			System.out.println(sum);
		}
		scanner.close();
	}

}

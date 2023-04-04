package ch04.verify;

import java.util.Scanner;

public class Example7 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		int money;
		int account = 0;
		while (true) {
			System.out.println("-------------------------------");
			System.out.println("1.예금 | 2. 출금 | 3. 잔고 | 4. 종료");
			System.out.println("-------------------------------");
			System.out.print("선택> ");
			String select = scanner.nextLine();

			if (select.equals("1")) {
				System.out.print("예금액>");
				money = scanner.nextInt();
				scanner.nextLine();
				account += money;
			} else if (select.equals("2")) {
				System.out.print("출금액>");
				money = scanner.nextInt();
				scanner.nextLine();
				account -= money;
			} else if (select.equals("3")) {
				System.out.println("잔고>" + account);
			} else {
				System.out.println("프로그램 종료");
				break;
			}
			System.out.println();
		}
	}

}

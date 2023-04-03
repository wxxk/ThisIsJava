package ch04.sec01;

import java.util.Scanner;

public class IfExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int score = 93;
		
		if (score >= 90) {
			System.out.println("점수가 90보다 큽니다.");
			System.out.println("등급은 A입니다.");
		}
		if (score < 90) {
			System.out.println("점수가 90보다 작습니다.");
		}
		System.out.println("등급은 B입니다.");	// 들여쓰기 오류 : if 문과는 상관없는 실행문
		
		System.out.println("-----------------------------");
		
		Scanner scanner = new Scanner (System.in);
		int score2 = scanner.nextInt();
		if (score2 > 100 || score < 0) {
			System.out.println("점수를 잘못 입력했습니다."	);
		} else {
			if (score2 >= 90) {
				if (score2 >= 95) {
					System.out.println("A+");
				} else {
					System.out.println("A");
				}
			}
		}
		scanner.close();
		
	}
}

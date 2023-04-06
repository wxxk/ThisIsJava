package ch05.verify;

import java.util.Scanner;

public class Example9 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner (System.in);
		int[] scores = null;
		int studentCount = 0;
		
		while (true) {
			System.out.println("--------------------------------------------------");
			System.out.println("1. 학생수 | 2. 점수입력 | 3. 점수리스트 | 4. 분석 | 5. 종료");
			System.out.println("--------------------------------------------------");
			System.out.print("선택> ");
			int select = sc.nextInt();
			
			if (select == 1) {
				System.out.print("학생수> ");
				studentCount = sc.nextInt();
			} else if (select == 2) {
				scores = new int[studentCount];
				for (int i = 0; i < studentCount; i++) {
					System.out.print("scores[" + i + "]>");
					scores[i] = sc.nextInt();
				}
			} else if (select == 3) {
				for (int i = 0; i < studentCount; i++) {
					System.out.println("scores[" + i + "]: " + scores[i]);
				}
			} else if (select == 4) {
				int maxScores = 0;
				int totalScores = 0;
				for (int i = 0; i < scores.length; i++) {
					if (scores[i] > maxScores) {
						maxScores = scores[i];
					}
					totalScores += scores[i];
				}
				System.out.println("최고 점수: " + maxScores);
				double totalAvg = (double) totalScores / scores.length;
				System.out.println("평균 점수: " + totalAvg);
			} else {
				System.out.println("프로그램 종료");
				break;
			}
			
		}
		sc.close();
	}

}

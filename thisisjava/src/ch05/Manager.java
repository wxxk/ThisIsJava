package ch05;

import java.util.Scanner;

public class Manager {
	
	static final int ROW = 100;
	static final int COL = 3;
	static String[][] dataList = new String[ROW][COL];
	static String[] inputList = {"번호", "이름", "닉네임"};
	static int index = -1;
	static int count = 0;
	
	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		while (true) {
			System.out.print("1. 추가 | 2. 삭제 | 3. 조회");
			System.out.print("메뉴 : ");
			int menu = sc.nextInt(); 
			
			switch(menu) {
			case 1:
				System.out.println("번호 | 이름 | 닉네임");
				for (int i = 0; i < COL; i++) {
					switch(i) {
					case 1:
						System.out.print(inputList[i] + ": ");
						dataList[count][i] = sc.next();
						break;
					case 2:
						System.out.print(inputList[i] + ": ");
						dataList[count][i] = sc.next();
						break;
					default:
						dataList[count][i] = String.valueOf(count+1);
					}		
				}	// end for
				count++;
				break;
				
			case 3:
				for (int i = 0; i < count; i++) {
					for (int j = 0; j < COL; j++) {
						System.out.printf("%s: %s", inputList[j], dataList[i][j]);
						System.out.println();
					}
					System.out.println();
				}
				break;
			}	// end switch
		}
	}

}

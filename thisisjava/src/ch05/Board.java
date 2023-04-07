package ch05;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class Board {
	static final int ROW = 100;
	static final int COL = 5;
	static String[][] board = new String[ROW][COL];
	static String[] inputList = { "글 번호", "제목", "내용", "날짜", "글쓴이" };

	static int index = -1;
	static int count = 0;

	static Scanner sc = new Scanner(System.in);

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		while (true) {
			System.out.println("===================BOARD===================");
			System.out.println("(1) 작성");
			System.out.println("(2) 수정");
			System.out.println("(3) 삭제");
			System.out.println("(4) 조회");
			System.out.println("(5) 전체조회");
			System.out.println("(6) 프로그램 종료");
			System.out.println("=========================================");
			System.out.print("메뉴를 입력해주세요: ");
			String menu = sc.next();

			switch (menu) {
			// 글 쓰기
			case "1":
				createBoardData();
				System.out.println();
				break;

				// 글 수정
			case "2":
				// 글이 없는 경우
				if(count <= 0) {
					System.out.println("작성된 글이 없습니다.");
				} else {
					System.out.print("수정할 글 번호: ");
					index = sc.nextInt();
					index -=1;
					updateBoardData(index);
					System.out.println();
					break;
				}
			
			// 글 삭제
			case "3":
				if (count <= 0) {
					System.out.println("작성된 글이 없습니다.");
				} else {
					System.out.print("삭제할 글 번호: ");
					index = sc.nextInt();
					index -= 1;
					deleteBoardData(index);
					System.out.println();
					break;
				}

			// 글번호 또는 글쓴이로 검색하여 조회
			case "4":
				if(count <= 0) {
					System.out.println("작성된 글이 없습니다.");
				} else {
					System.out.println("'글번호' 또는 '글쓴이' 중 하나를 입력해주세요 ");
					System.out.print(">>>");
					String res = sc.next();
					search(res);
					System.out.println();
					break;
				}

			// 전체 작성글 조회
			case "5": 
				if (count <= 0) {
					System.out.println("작성된 글이 없습니다.");
				} else {
					System.out.println("전체 작성글을 조회합니다.\n");
					for (int i=0; i<count; i++) {
						System.out.println(inputList[0] + ": " + board[i][0]);
						System.out.println(inputList[1] + ": " + board[i][1]);
						System.out.println(inputList[4] + ": " + board[i][4]);
					}
				}
				System.out.println();
				break;

			// 프로그램 종료
			case "6": 
				System.out.println("프로그램을 종료합니다.");
				sc.close();
				System.exit(0);
				break;

			// 메뉴 외 입력했을 때
			default:
				System.out.println("잘못 입력하였습니다.");
				System.out.println();
				break;

			}

		}
	}	

	public static void createBoardData() {
		System.out.println();
		System.out.println("*****글 쓰기*****");
		for (int i = 0; i < COL; i++) {
			switch (i) {
			case 1:
				System.out.print(inputList[i] + ": ");
				sc.nextLine();
				board[count][i] = sc.nextLine();
				break;
			case 2:
				System.out.print(inputList[i] + ": ");
				board[count][i] = sc.nextLine();
				break;
			case 3:
				board[count][i] = board[count][i] = new SimpleDateFormat("HH:mm").format(new Date());
				break;
			case 4:
				System.out.print(inputList[i] + ": ");
				board[count][i] = sc.next();
				break;
			default:
				board[count][i] = String.valueOf(count+1);
			}
		}
		count++;
		sc.nextLine();
	}

	public static void updateBoardData(int index) {
		System.out.print("수정할 제목: ");
		sc.nextLine();
		board[index][1] = sc.nextLine();
		System.out.print("수정할 내용: ");
		board[index][2] = sc.nextLine();
	}

	public static void deleteBoardData(int index) {
		for (int i = index; i < count - 1; i++) {
			board[i] = board[i+1];
		}
		count--;
	}

	static void search (String res) {
		System.out.println("검색어: " + res + "\n");
		for (int i=0; i<count; i++) {
			if (board[i][4].equals(res)) {
				for (int j = 0; j < COL; j++) {
					System.out.printf("%s : %s", inputList[j], board[i][j]);
					System.out.println();
					index = i; // 조회한 작성글의 인덱스 저장					
				}
			} else if (board[i][0].equals(res)) {
				for (int j = 0; j < COL; j++) {
					System.out.printf("%s : %s", inputList[j], board[i][j]);
					System.out.println();
					index = i; // 조회한 작성글의 인덱스 저장					
				}
				break;
			} else {
				System.out.println("찾는 작성글이 없습니다.");
			}
		}
	}

}
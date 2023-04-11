package ch06;

import java.util.Scanner;

public class FoodManager3 {
	static final int MAX = 100;
	static Food2[] foodList = new Food2[MAX];
	static int index = -1;
	static int count = 0;
	
	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		while (true) {
			System.out.println("메뉴를 입력하세요.");
			System.out.println("---------------------------------------");
			System.out.println("1.추가 | 2.목록보기 | 3.수정 | 4.삭제 | 0.종료");
			System.out.println("---------------------------------------");
			System.out.print("메뉴: ");
			int menu = sc.nextInt();
			
			switch(menu) {
			case 1:
				System.out.println();
				System.out.println("새로운 식자재를 추가합니다.");
				insertFood();
				System.out.println();
				break;
			case 2:
				System.out.println();
				System.out.println("식자재 목록을 출력합니다.");
				printFoodList();
				System.out.println();
				break;
			case 3:
				System.out.println();
				System.out.println("식자재 정보를 수정합니다.");
				updateFoodList();
				System.out.println();
				break;
			case 4: 
				System.out.println();
				System.out.println("식자재 정보를 삭제합니다.");
				deleteFood();
				System.out.println();
				break;
			case 0:
				System.out.println();
				System.out.println("식자재 관리 프로그램을 종료합니다.");
				System.exit(0);
				System.out.println();
			default:
				System.out.println();
				System.out.println("잘못된 메뉴입니다.");
				System.out.println();
				break;
			}	// end switch
		}	// end while
	}	// end main
	
	private static void insertFood() {
		Food2 food = new Food2();
		System.out.print("식품이름: ");
		food.setName(sc.next());
		System.out.print("수량: ");
		food.setCount(sc.nextInt());
		System.out.print("유통기한: ");
		food.setExpDate(sc.next());
		System.out.print("설명: ");
		food.setEtc(sc.next());
		foodList[count++] = food;
	} // end insertFood
	
	private static void printFoodList() {
		System.out.println("------------------------------");
		System.out.println("이름\t수량\t유통기한\t설명");
		System.out.println("------------------------------");
		for (int i = 0; i < count; i++) {
			System.out.printf("%s\t%d\t%s\t%s", foodList[i].getName(), foodList[i].getCount(), foodList[i].getExpDate(), foodList[i].getEtc());
			System.out.println();
		}
		System.out.println("------------------------------");
	} // end printFoodList
	
	private static void deleteFood() {
		System.out.print("삭제할 식자재 이름을 입력하세요: ");
		String food = sc.next();
		for (int i = 0; i < count; i++) {
			if (food.equals(foodList[i].getName())) {
				for (int j = i; j < count-1; j++) {
					foodList[j] = foodList[j+1];
				}
				count--;
				return;
			}
		}
		System.out.println("삭제할 식자재가 없습니다.");
	}	// end deleteFood
	
	private static void updateFoodList() {
		System.out.print("수정할 식자재 이름을 입력하세요: ");
		String food = sc.next();
		for (int i = 0; i < count; i++) {
			if (food.equals(foodList[i].getName())) {
				System.out.print("수량을 입력하세요: ");
				int cnt = sc.nextInt();
				if (cnt == 0) {
					for (int j = 0; j < count; j++) {
						foodList[j] = foodList[j+1];
					}
					count--;
				} else {
					foodList[i].setCount(cnt);
				}
				return;
			}	// end if
		}	// end for
		System.out.println("수정할 식자재가 없습니다.");
	}	// end updateFoodCount

}	// end class

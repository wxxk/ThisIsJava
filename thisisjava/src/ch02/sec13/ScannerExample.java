package ch02.sec13;

import java.io.IOException;
import java.util.Scanner;

public class ScannerExample {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
//		int data = System.in.read();	// 1byte를 읽음
//		System.out.println(data);
		
//		Scanner scan = new Scanner(System.in);
//		System.out.println("정수 2개를 입력하세요.");
//		int data = scan.nextInt();
//		int data2= scan.nextInt();
//		System.out.println(data + data2);
//		scan.nextLine();
//		String name = scan.nextLine();
//		System.out.println("이름: " + name);
		
		System.out.println("--------------------------");
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("x 값 입력: ");
		String strX = scanner.nextLine();
		int x = Integer.parseInt(strX);
		
		System.out.print("y 값 입력: ");
		String strY = scanner.nextLine();
		int y = Integer.parseInt(strY);
		
		int result = x + y;
		System.out.println("x + y: " + result);
		System.out.println();
		
		while(true) {
			System.out.print("입력 문자열: ");
			String data = scanner.nextLine();
			if(data.equals("q")) {
				break;
			}
			System.out.println("출력 문자열: " + data);
			System.out.println();
			
		}
		System.out.println("종료");

	}

}

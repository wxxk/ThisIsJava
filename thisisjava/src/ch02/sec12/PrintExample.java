package ch02.sec12;

import java.util.Date;

public class PrintExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String name1 = "홍길동";
		int age = 25;
		// 홍길동님의 나이는 25세 입니다.
		System.out.println("Hello");
		System.out.println("World");
		
		System.out.println("-------------------------");
		
		System.out.print("Hello");
		System.out.print("world");
		System.out.println("1234567890");
		
		System.out.println("-------------------------");
		
		System.out.print("");	// print() 안에 아무것도 없을 순 없다.
		System.out.println();
		
		System.out.println("-------------------------");
		
		System.out.println(name1 + "님의 나이는 " + age + "입니다.");
		System.out.printf("%s님의 나이는 %d입니다.\n", name1, age);
		
		System.out.println("-----------------");
		
		int value = 123;
		System.out.printf("상품의 가격: %d원\n", value);
		System.out.printf("상품의 가격: %6d원\n", value);
		System.out.printf("상품의 가격: %-6d원\n", value);
		System.out.printf("상품의 가격: %06d원\n", value);
		
		System.out.println("-----------------");
		
		double area = 3.141592 * 10 * 10;
		System.out.printf("반지름이 %d인 원의 넓이:%10.2f\n", 10, area);
		
		System.out.println("-----------------");
		
		String name = "홍길동";
		String job = "도적";
		System.out.printf("%6d | %-10s | %10s\n", 1, name, job);
		
		// 형식 문자에 d, f, s외에도 c(문자), t(날짜/시간) 도 있습니다.
		// arg_index$는 형식 문자에 매핑되는 변수의 순서를 지정합니다.
		System.out.println();
		java.util.Date d = new java.util.Date();
		System.out.printf("%ty \n", d);	// 연도 출력
		// 연-월-일을 출력하려면?
		System.out.printf("%ty-%tm-%td \n", d,d,d);
//		System.out.printf("%ty-%tm-%td \n", d);	// 에러
		System.out.printf("%1$ty-%1$tm-%1$td \n", d);
	}

}

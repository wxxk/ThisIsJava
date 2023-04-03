package ch02.sec06;

public class StringExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		char c1 = 'ab'; // error
		String name1 = "홍길동";
		System.out.println(name1.toString());
		
		String str1 = "나는 \"자바\"를 \t배웁니다. \n줄바꿈 합니다.";
		System.out.println(str1);
		
		String str2 = "Hello\rWorld";
		// \r : 줄바꿈 안하고 그 행에서 맨 앞으로 출력
		// 출력결과
		// World
		// eclipse에서는 \r이 잘 안됨
		System.out.println(str2);
		
		System.out.println("----------------------");
		
		String name = "홍길동";
		String job = "프로그래머";
		System.out.println(name1);
		System.out.println(job);
		
		String str = "나는 \"자바를\" 배웁니다";
		System.out.println(str);
		
		str = "번호\t이름\t직업 ";
		System.out.println(str);
		
		System.out.print("나는\n");
		System.out.print("자바를\n");
		System.out.print("배웁니다.");	
	}
}
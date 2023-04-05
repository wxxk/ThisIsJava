package ch05.sec05;

public class SplitExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String board = "1,자바 학습,참조 타입  String을 학습합니다.,홍길동";
		
		// 문자열 분리
		String[] tokens = board.split(",");
		
		// 인덱스 별로 읽기
		System.out.println("번호: " + tokens[0]);
		System.out.println("제목: " + tokens[1]);
		System.out.println("내용: " + tokens[2]);
		System.out.println("성명: " + tokens[3]);
		System.out.println();
		
		// for문을 이용한 읽기
		for (int i = 0; i < tokens.length; i++) {
			System.out.println(tokens[i]);
		}
	}

}

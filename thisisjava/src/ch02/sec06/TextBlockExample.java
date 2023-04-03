package ch02.sec06;

public class TextBlockExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String str1 = "" +
		"{\n" +
		"\t\"id:\",\n" +
		"\t\"name\":\"눈송이\"\n"+
		"}";
		
		/*
		 * 현재 이클립스 버전에서 지원안됨
		 * String str2 = """
		 * {
		 * 	"id":"winter",
		 * 	"name":"눈송이"
		 * }
		 * System.out.println(str2)
		 */
		System.out.println(str1);
		System.out.println("------------------");
		
		/*
		 * 지원 안됨
		 * 줄바꿈 하지 않고 다음 줄에 이어서 작성하고 싶을 때 \ 사용
		 * String str = """
		 * 나는 자바를 \
		 * 학습합니다.
		 * 나는 자바 고수가 될 겁니다.
		 * """;
		 * 실행 결과
		 * 나는 자바를 학습합니다.
		 * 나는 자바 고수가 될 겁니다.
		 */
	}
}

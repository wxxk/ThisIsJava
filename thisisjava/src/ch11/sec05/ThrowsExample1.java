package ch11.sec05;

public class ThrowsExample1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			findClass("java.lang.String2");
		} catch(ClassNotFoundException e) {
			System.out.println("예외 처리: " + e.toString());
		}
		System.out.println("메인 종료됨");
	}
	
	public static void findClass(String className) throws ClassNotFoundException {
		Class.forName(className);
	}

}

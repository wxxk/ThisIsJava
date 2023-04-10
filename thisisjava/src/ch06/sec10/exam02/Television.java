package ch06.sec10.exam02;

public class Television {
	static String company = "MyCompany";
	static String model = "LCD";
	static String info;
	
	static {
		// 정적 블록
		// 복잡한 초기화 작업이 필요할 때 사용
		info = company + "-" + model;
	}
}

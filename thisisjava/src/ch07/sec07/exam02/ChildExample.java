package ch07.sec07.exam02;

public class ChildExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 자식 객체 생성
		Child child = new Child();
		
		// 자동 타입 변환
		Parent parent = child;
		
		// 메소드 호출
		parent.method1();
		parent.method2();
//		parent.method3(); // 호출 불가능 : 컴파일시 부모에 메서드가 있는지 확인하는데 존재하지 않음
	}

}

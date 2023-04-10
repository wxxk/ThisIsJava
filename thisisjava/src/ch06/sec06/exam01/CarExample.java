package ch06.sec06.exam01;

public class CarExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// Car 객체 생성
		Car myCar = new Car();
		
		// 초기값을 제공하지 않을 경우 필드는 객체 생성 시 자동으로 기본값으로 초기화
		
		// Car 객체의 필드값 읽기
		System.out.println("모델명: " + myCar.model);
		System.out.println("시동여부: " + myCar.start);
		System.out.println("현재속도: " + myCar.speed);

	}

}

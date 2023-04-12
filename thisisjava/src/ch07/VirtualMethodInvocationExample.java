package ch07;

public class VirtualMethodInvocationExample {
	public static void main(String[] args) {
		A a = new B();	// 다형적 객체 : A에는 A를 상속받은 어떠한 객체도 받을 수 있다.
		a.doIt();
		a = new C();
		a.doIt();
//		a.doThat(); // 컴파일시 부모에 메소드가 있는지 확인하는데 존재하지 않아서 에러
		
		// abstract으로 선언 : 구현이 안된 메서드를 호출할 때 사용
//		a.doThat();
		
		// abstract 대신 c타입으로 형변환
		C c = (C)a;
		c.doThat();
		A a2 = new A();
//		B b2 = (B)a2;	// runtime error : 형변환을 하려면 만들어질 때 그 타입으로 만들어져 있어야함 
	}

}

class A {
	public void doIt() {
		System.out.println("A");
	}
}

class B extends A {
	public void doIt() {
		System.out.println("B");
	}}

class C extends A {
	public void doThat() {
		System.out.println("C");
	}
}
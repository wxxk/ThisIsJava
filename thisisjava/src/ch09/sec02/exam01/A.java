package ch09.sec02.exam01;

public class A {
	class B {
		void doIt() {
			System.out.println("1");
		}
	}
	
	B field = new B();
	
	A() {
		B b = new B();
	}
	
	void method() {
		B b = new B();
	}
}

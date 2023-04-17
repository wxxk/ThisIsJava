package ch09.sec04.exam03;

public class A {
	public void method(int arg) {
		int var = 1;
		
		class B {
			void method2() {
				System.out.println("arg: " + arg);
				System.out.println("var: " + var);
				
				// 로컨 변수 수정
				// arg = 2; // (x)
				// var = 2; // (x)
			}
		}
		
		B b = new B();
		b.method2();
		
		// 로컨 변수 수정
		// arg = 3; // (x)
		// var = 3; // (x)
	}
}

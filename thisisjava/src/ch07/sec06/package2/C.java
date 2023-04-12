package ch07.sec06.package2;

import ch07.sec06.package1.A;

public class C {
	// 메소드 선언
	public void method() {
		// A와 다른 패키지에 있기 때문에 A의 protected 필드, 생성자, 메소드에 접근할 수 없다.
//		A a = new A();	// X
//		a.field = "value";	// X
//		a.method();	// X
	}
}

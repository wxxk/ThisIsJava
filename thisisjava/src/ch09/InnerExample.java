package ch09;

public class InnerExample {
	public static void main(String[] args) {
		A a = new A();
		A.B b = a.new B();
		b.doIt();
		
		A.C c = new A.C();
		c.doIt();
	}
}

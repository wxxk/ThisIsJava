package ch09;

public class A {
	class B{
		// instance member class
		void doIt() {
			System.out.println("A.B");
		}
	}
	
	static class C {
//		static member class
		void doIt() {
			System.out.println("A.C");
		}
	}
	
	void doIt() {
		class B{
			// Local class
		}
	}

}

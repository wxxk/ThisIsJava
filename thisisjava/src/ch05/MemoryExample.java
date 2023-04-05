package ch05;

public class MemoryExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int number = 10;
		pen p1 = new pen("검정색");
		pen p2 = new pen("빨간색");
		System.out.println(p1 == p2);	// 다른 heap주소 참조
		
		pen p3 = p1;	// p1과 p3는 같은 주소 참조
		System.out.println(p1 == p3);
		
		pen p4 = new pen("파란색");	// 객체 초기화 : null
		p4.write();
		
		System.out.println("p2==null");
		p2 = null;	// p2 객체는 메모리에서 사라짐(참조하는 주소만 지운다 -> GC대상이 된다)
		System.gc();
		
		System.out.println("p1=null");		
		p1 = null;	// p1객체는 null이라도 p3가 참조하고 있으므로 GC 대상이 안된다.
		System.gc();	// 강제로 GC가 동작하게 함

		System.out.println("p3=null");
		p3 = null;
		System.gc();
		
	}

} // end class

class pen {
	public final String BRAND = "모나미";	// 상수
	public static int count = 0; // 정적필드(static 변수)
	public String color; 	// 인스턴스 필드(객체)
	
	public pen(String color) {
		this.color = color;
	}	// 생성자, constructor
	
	public void write() {	// 메서드
		System.out.println("Hello");
	}
	
	@Override
	protected void finalize() throws Throwable {
		System.out.println(color + "object finalized");
	}
}

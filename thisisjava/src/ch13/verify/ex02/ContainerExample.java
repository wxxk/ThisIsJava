package ch13.verify.ex02;

public class ContainerExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Container<String> container1 = new Container<String>();
		container1.setContent("홍길동");
		String str = container1.getContent();
		System.out.println(str);
		
		Container<Integer> container2 = new Container<Integer>();
		container2.setContent(6);
		int value = container2.getContent();
		System.out.println(value);
	}

}

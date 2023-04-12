package ch07;

public class Student extends Person {
//	String name;
//	int age;
	protected String studentId;
	
	public Student(String name, int age, String studentId) {
		super(name, age);	// super / this는 생성자의 첫 라인에 와야함.
//		this.name = name;
//		this.age = age;
		this.studentId = studentId;
	}
	
	// 같은 기능이 부모에 있다면 메소드 이름을 똑같이함
	// 1. 중복 정의
	// 2. 재정의 (리턴타입, 이름, 매개변수가 같아야함)
	// 3. 접근제한자는 부모보다 더 public해야함(private의 경우 부모가 물려주지 않는다는 의미)
	@Override	// 재정의하는 메소드를 작성할 때 문법이 안맞으면 에러뜸
	
	// 변수가 많은 것은 큰게아니고 더 디테일 한 것
	public String getDetails() {
//		return "이름: " + name +
//				"\t나이: " + age +
		// 부모가 가지고있는 메소드 참조 : super.
		return super.getDetails() + "\t학번: " + studentId;
	}
}

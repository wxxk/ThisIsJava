package ch07;

public class inheritanceExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Student s1 = new Student("홍길동", 20, "123456789");
//		s1.name = "홍길동";	// Student에는 name이 없지만 Person에서 상속받음
//		s1.age = 20;
//		s1.studentId = "123456789";
		System.out.println(s1.getDetails());
		
		Teacher s2 = new Teacher();
		s2.name = "이상욱";
		s2.age = 28;
		s2.major = "147852963";
		
		
	}

}

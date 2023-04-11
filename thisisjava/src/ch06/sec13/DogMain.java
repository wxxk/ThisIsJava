package ch06.sec13;

public class DogMain {
	public static void main(String[] args) {
		Dog d1 = new Dog();
//		d1.age = -1;
		d1.setAge(-1);
		System.out.println(d1.getAge());
	}
}

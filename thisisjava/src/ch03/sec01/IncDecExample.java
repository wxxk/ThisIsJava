package ch03.sec01;

public class IncDecExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int i = 10;
		int result = ++i +10 ;
//		++i;	// 단독으로 사용될 경우 i++ 와 동일
		System.out.println(i);	// 11
		System.out.println(result);	// 21
		
		i = 10;
		result = i++ + 10;
		System.out.println(i);	// 11
		System.out.println(result);	// 20
		
		System.out.println("---------------------------");
		
		int x = 10;
		System.out.println(x++);	// 10
		System.out.println(++x);	// 12
	}
}
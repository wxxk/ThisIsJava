package ch05.sec05;

public class SubStringExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// substring(int beginIndex) : beginIndex에서 끝까지 잘라내기
		// substring(int beginIndex, int endIndex) : beginIndex에서 endIndex 앞까지 잘라내기
		
		String ssn = "880815-1234567";
		
		String firstNum = ssn.substring(0, 6);
		System.out.println(firstNum);
		
		String lastNum = ssn.substring(7);
		System.out.println(lastNum);
	}

}

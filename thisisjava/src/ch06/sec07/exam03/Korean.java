package ch06.sec07.exam03;

public class Korean {
	// 필드 선언
	String nation = "대한민국";
	String name;
	String ssn;
	
	// 생성자 선언
	public Korean(String name, String ssn) {
		// 매개변수명이 필드명과 동일하기 때문에 필드임을 구분하기 위해 this 키워드를 필드명 앞에 붙여줌
		// this는 현재객체 의미, this.name은 현재 객체의 데이터
		this.name = name;
		this.ssn = ssn;
	}
}

package ch05.sec12;

import java.util.Calendar;
import java.util.Date;

public class CalendarExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Date now = new Date();
		System.out.println(now);
		Date now2 = new Date();
		System.out.println(now2);
		System.out.println(now == now2);	// 객체가 새로 생성
		
		
		Calendar cal = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		System.out.println(cal == cal2);	// 객체가 복사됨
		
		int year = cal.get(Calendar.YEAR);
		System.out.println(year);
		System.out.println(Calendar.YEAR);
	}

}

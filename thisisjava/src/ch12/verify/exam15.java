package ch12.verify;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

public class exam15 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		LocalDateTime start = LocalDateTime.now();
		
		LocalDateTime end = LocalDateTime.of(2023, 12, 31, 0, 0, 0);
		System.out.println(start.until(end, ChronoUnit.DAYS));
	}

}

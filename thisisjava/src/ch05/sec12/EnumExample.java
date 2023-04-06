package ch05.sec12;

public class EnumExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// int day = 6; // type safety 하지 않다.
		Week today = Week.THURSDAY;
		switch(today) {
		case MONDAY:
			System.out.println("월요일");
			break;
		case TUESDAY:
			System.out.println("화요일");
			break;
		case WEDNESDAY:
			System.out.println("수요일");
			break;
		case THURSDAY:
			System.out.println("목요일");
			break;
		case FRIDAY:
			System.out.println("금요일");
			break;
		default:
			System.out.println("토/일요일");
		}
	}

}
class Weekday {
	static final int MONDAY = 1;
	static final int TUESDAY = 2;
	static final int WEDNESDAY = 3;
	static final int THURSDAY = 4;
	static final int FRIDAY = 5;
}

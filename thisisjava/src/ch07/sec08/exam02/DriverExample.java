package ch07.sec08.exam02;

public class DriverExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Driver driver = new Driver();
		
		Bus bus = new Bus();
		driver.drive(bus);	// driver.drive(new Bus())와 동일
		
		Taxi taxi = new Taxi();
		driver.drive(taxi);	// driver.drive(new Taxi())와 동일
	}

}

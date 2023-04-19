package ch11.sec06;

import java.sql.SQLException;

public class EmpMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		IEmpService empService = new EmpService();
		try {
			empService.insert(null);
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
	}

}

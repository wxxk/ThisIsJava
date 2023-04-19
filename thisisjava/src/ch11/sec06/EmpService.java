package ch11.sec06;

import java.sql.SQLException;

public class EmpService implements IEmpService{

	@Override
	public void insert(EmpVO vo) {
		try {
			if(vo==null) {
				throw new SQLException("객체가 널입니다.");
			}
		} catch(SQLException e) {
			System.out.println(e.getMessage());;
		}
		System.out.println("메인 종료");
	}
}

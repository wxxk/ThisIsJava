package ch20;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.dbcp2.BasicDataSource;

public class ConnectionPoolExample {
	
	private static BasicDataSource dataSource;	// 여러개 선언 가능
	
	static {
		dataSource = new BasicDataSource();	// dataSource 생성
		dataSource.setDriverClassName("oracle.jdbc.OracleDriver");
		dataSource.setUrl("jdbc:oracle:thin:@localhost:1521/xe");
		dataSource.setUsername("hr");
		dataSource.setPassword("hr");
		dataSource.setInitialSize(10);	// 처음에 커넥션 풀에 들어있는 데이터 개수
		dataSource.setMaxTotal(20);	// 최대 커넥션의 수
	}
	
	
	public static void main(String[] args) {
		System.out.println(getEmpCount());
	}

	public static int getEmpCount() {
		String sql = "select count(*) from employees";
		Connection con = null;	// 원래 방법
		int rowCount = 0;
		
		try { 
//			con = DriverManager.getConnection(url); // 원래 방법
			con = dataSource.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			rowCount = rs.getInt(1);
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {}
			}
		}
		return rowCount;
	}
}



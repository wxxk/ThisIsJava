package ch20;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1. Connetciont 객체 생성
		// 2. Statement 객체 생성
		// 3. SQL 구문 실행
		// 4. 결과 소비
		Connection con = null;
		
		try {
//			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			con = DriverManager.getConnection(url, "hr", "hr");
//			Class.forName("rog.sqlite.JDBC");
//			con = DriverManager.getConnection("jdbc:sqlite:hr.db");
			System.out.println(con);
			
//			Statement stmt = con.createStatement();
			
			String sql = "insert into employees values " + "(?, ?, ?, ?, ?, sysdate, ?, ?, ?, ?, ?)";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, 301);
			stmt.setString(2, "JinYoung");
			stmt.setString(3, "Kim");
			stmt.setString(4, "KIMJY");
			stmt.setString(5, "010-2222-3333");
			stmt.setString(6, "IT_PROG");
			stmt.setDouble(7, 8000);
			stmt.setDouble(8, 0);
			stmt.setInt(9, 103);
			stmt.setInt(10, 60);
			stmt.executeUpdate(); 	//insert, update, delete 구문을 실행
			System.out.println("데이터가 입력되었습니다.");
			
//			ResultSet rs = stmt.executeQuery("select * from employees");
//			while(rs.next()) {	// rs next 무조껀 한번 실행
//				System.out.print(rs.getInt("employee_id") + "\t");
//				System.out.print(rs.getString("first_name") + "\t");
//				System.out.print(rs.getString("last_name") + "\t");
//				System.out.println(rs.getString("email"));
//			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				con.close();
			} catch(Exception e) {};
		}
	}

}

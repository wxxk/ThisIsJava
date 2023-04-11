package ch06.verify;

public class MemberService {
	String id;
	String password;
	
	MemberService() {
	}
	
	boolean login(String id, String password) {
//		if (id == "hong" && password == "12345") {
		if ("hong".equals(id) && "12345".contentEquals(password)) {
		// 위에 if 문은 null이 들어왔을 때 에러 발생
		// 아래 if 문은 null이 들어와도 안정적으로 처리 가능
			return true;			
		} else {
			return false;
		}
	}
	
	void logout(String id) {
		System.out.println(id + "님이 로그아웃 되었습니다.");
	}
}

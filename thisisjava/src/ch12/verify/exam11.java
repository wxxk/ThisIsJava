package ch12.verify;

import java.util.StringTokenizer;

public class exam11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s1 = "아이디,이름,패스워드";
		StringTokenizer st = new StringTokenizer(s1, ",");
		while(st.hasMoreElements()) {
			System.out.println(st.nextToken());
		}
		
		String[] s1s = s1.split(",");
		for(String s : s1s) {
			System.out.println(s);
		}
	}

}

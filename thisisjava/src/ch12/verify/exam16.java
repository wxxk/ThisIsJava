package ch12.verify;

import java.text.SimpleDateFormat;
import java.util.Date;

public class exam16 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 E요일 HH시 mm분");
		System.out.println(sdf.format(new Date()));
	}

}

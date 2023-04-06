package ch05.sec09;

import java.util.Arrays;

public class ArrayCopyExample2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 길이 3인 배열
		String[] oldStrArray = { "java", "array", "copy" };
		
		// 길이 5인 배열을 새로 생성
		String[] newStrArray = new String[5];
		
		// 배열 항목 복사
		System.arraycopy(oldStrArray, 0, newStrArray, 0, oldStrArray.length);
		
		System.out.println(Arrays.toString(newStrArray));
		
	}

}

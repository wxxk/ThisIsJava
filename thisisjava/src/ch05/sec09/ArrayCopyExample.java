package ch05.sec09;

import java.util.Arrays;

public class ArrayCopyExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] intArr = { 3, 5, 7, 9, 11 };
		int[] intArr2 = intArr;
		intArr2[0] = 300;
		System.out.println(intArr);
		
		// 주소만 가져다가 복사
		System.out.println(Arrays.toString(intArr2));
		System.out.println(Arrays.toString(intArr));
		
		int sum = 0;
		for (int i  = 0; i < intArr.length; i++) {
			sum += intArr[i];
		}
		System.out.println(sum);
		
		sum = 0;
		for (int i : intArr) {
			sum += i;
		}
		System.out.println(sum);
 	}

}

package problem;

import java.util.Arrays;

public class ArrayManager2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int[] array = new int[10];
		int index = -1;
		int count = 0;
		
		array[count] = 30;
		count++;
		array[count++]= 40;
		
		// 배열 데이터 전체 출력
		for (int i = 0; i < count; i++) {
			System.out.print(array[i] + " ");
		}
		System.out.println();
		
		// 배열 데이터 검색
		int searchData = 40;
		for(int i = 0; i < count; i++) {
			if (array[i] == searchData) {
				index = i;
			}
		}
		System.out.println(index);
		if (index != -1) {
			array[index] = 60;	// 수정
		}
		System.out.println(array[index]);
		
		array[count++] = 50;
		array[count++] = 70;
		System.out.println(Arrays.toString(array));
		
		// 삭제
		index = 2;
		for (int i = index; i < count-1; i++) {
			array[i] = array[i+1];
		}
		count--;
		System.out.println(Arrays.toString(array));
		
		for (int i = 0; i < count; i++) {
			System.out.print(array[i] + " ");
		}
		System.out.println();
		
		// 추가
		index = 2;
		for (int i = count - 1; i > index; i--) {
			array[i] = array[i-1];
		}
		count++;
		array[index] = 80;
		
		System.out.println(Arrays.toString(array));
		for (int i = 0; i < count; i++) {
			System.out.print(array[i] + " ");
		}
	}
}

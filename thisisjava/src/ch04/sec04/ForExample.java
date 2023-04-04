package ch04.sec04;

public class ForExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for (int i = 0; i < 10; i++) {
			System.out.println(i);
		}
		
		// j를 반복문 아래에서 쓰고싶을 때
		int j = 0;
		for ( ; j < 10; j++) {
			System.out.println(j);
		}
		System.out.println(j);
		
		System.out.println("------------------------------------");
		
		int[] arr = {1, 2, 3, 4, 5, 6, 7, 8, 9};
		int arrSum = 0;
		for (int k = 0; k < 9; k++) {
			arrSum += arr[k];
		}
		System.out.println(arrSum);
		
		System.out.println("---------------------------------------");
		
		int arrSum2 = 0;
		for (int data : arr) {
			arrSum2 += data;
		}
		System.out.println(arrSum2);
		/*
		 * int i = 0;
		 * for ( ; i < 10 ; ) {
		 *     System.out.println(i);
		 *     i++;
		 * }
		 */
		
		/*
		* int i = 0;
		* for( ; ; ) {
		*   if (i < 10) {
		*		System.out.println(i);
		*		i++
		*	} else {
		*		break;
		*	}
		* }
		*/
	}
}

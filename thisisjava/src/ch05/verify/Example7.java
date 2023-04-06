package ch05.verify;

public class Example7 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] array = { 1, 5, 3, 8, 2 };
		int maxValue = Integer.MIN_VALUE;	// -2147483648
		
		for (int num : array) {
			if (num > maxValue) {
				maxValue = num;
			}
		}
		System.out.println(maxValue);
	}

}
package ch05.verify;

public class Example8 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[][] array = {
				{95, 86},
				{83, 92, 96},
				{78, 83, 93, 87, 88}
		};
		
		int totalSum = 0;
		int totalCount = 0;
		
		for (int i = 0; i < array.length; i++) {
			totalCount += array[i].length;
			for (int j = 0; j < array[i].length; j++) {
				totalSum += array[i][j];
			}
		}
		
		double totalAvg = (double) totalSum / totalCount;
		System.out.println(totalSum);
		System.out.println(totalAvg);
	
	}

}

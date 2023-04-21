package ch12.sec09;

import java.text.DecimalFormat;

public class DecimalFormatExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		double num = 1234567.89;
		
		DecimalFormat df;
		
		df = new DecimalFormat("#,###");
		System.out.println(df.format(num));
		
		df = new DecimalFormat("#,###.0");
		System.out.println(df.format(num));
	}

}

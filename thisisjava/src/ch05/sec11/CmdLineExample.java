package ch05.sec11;

import java.util.Arrays;

import javax.swing.JOptionPane;

public class CmdLineExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(Arrays.toString(args));
		
		String data = JOptionPane.showInputDialog("입력하세요");
		System.out.println(data);
		
	}

}

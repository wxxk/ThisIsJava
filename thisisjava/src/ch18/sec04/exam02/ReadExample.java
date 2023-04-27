package ch18.sec04.exam02;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

public class ReadExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			Reader reader = null;
			
			reader = new FileReader("test(2).txt");
			
			while(true) {
				int data = reader.read();	// 1개의 문자를 읽고 리턴
				if(data == -1) break;
				System.out.print((char)data);
			}
			reader.close();
			System.out.println();
			
			reader = new FileReader("test(2).txt");
			char[] data = new char[100];
			while (true) {
				int num = reader.read(data);	// 읽은 문자들을 매개값으로 주어진 ㅐ열에 저장하고 읽은 문자수를 리턴
				if(num == -1) break;
				for(int i = 0; i < num; i++) {
					System.out.print(data[i]);
				}
			}
			reader.close();
		} catch(FileNotFoundException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

}

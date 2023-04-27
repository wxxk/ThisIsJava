package ch18;

import java.io.FileInputStream;
import java.io.IOException;

public class FileInputExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try(FileInputStream fis = new FileInputStream("test.txt")) {
//			int data = fis.read();
			byte[] buffer = new byte[100];
			int readCount = 0;
			while (true) {
				readCount = fis.read(buffer);
				if(readCount <= 0)break;
				System.out.println(new String(buffer, 0, readCount));
			}
//			System.out.println(readCount);
		} catch(IOException e) {
			System.out.println(e.getMessage());
		}
	}

}

package ch18;

import java.io.FileOutputStream;
import java.io.IOException;

public class FileOutputExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 데이터를 저장하려면...
		// 1. 노드를 무엇으로 할 것인가? File
		// 2. 입출력 단위는? byte
		// FileOutputStream
//		try (FileOutputExample fos = new FileOutputStream("test.txt")) {
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream("test.txt");
//			byte[] data = {'A', 'B', 'C', 'D', 'E'};
			byte[] data = "ABCDEFGHIJKLMN".getBytes();
			fos.write(data,0, 6);
//			fos.write('A');
//			fos.write('B');
//			fos.write('C');
//			fos.write('D');
//			fos.write('E');
//			for(int i = 1; i < 10; i++) {
//				fos.write('F'+i);
//			}
			fos.flush();
			System.out.println("파일에 데이터 기록됨");
		}catch(IOException e) {
			System.out.println(e.getMessage());
		}finally {
			try {fos.close();}catch(Exception e) {}
		}
	}

}

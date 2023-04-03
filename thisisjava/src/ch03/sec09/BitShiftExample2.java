package ch03.sec09;

public class BitShiftExample2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int value = 772;	//[00000000] [00000000] [00000011] [00000100]
		
		// 우측으로 3byte(24bit) 이동하고 끝 1바이트만 읽음 [00000000]
		byte byte1 = (byte) (value >>> 24);
		int int1 = byte1 & 255;
		System.out.println("첫 번째 바이트 부호 없는 값: " + int1);
		
		// 우측으로 2byte(16bit) 이동하고 끝 1바이트만 읽음 [00000000]
		byte byte2 = (byte) (value >>> 16);
		int int2 = Byte.toUnsignedInt(byte2);
		// Byte.toUnsignedInt : 주어진 바이트 값을 부호 없는 32 비트 int 값으로 변환하는 메서드
		System.out.println("두 번째 바이트 부호 없는 값: " + int2);
		
		// 우측으로 1byte(8bit) 이동하고 끝 1바이트만 읽음 [00000011]
		byte byte3 = (byte) (value >>> 8);
		int int3 = byte3 & 255;
		System.out.println("세 번째 바이트 부호 없는 값: " + int3);
		
		// 끝 1바이트만 읽음 [00000100]
		byte byte4 = (byte) value;
		int int4 = Byte.toUnsignedInt(byte4);
		System.out.println("네 번째 바이트 부호 없는 값: " + int4);
		
		System.out.println("--------------------------------------------------");
		 
		int data = 10;
		data += 5;	// data = data + 5;
		System.out.println(data);
		int data2 = 30;
		data2 =+ 5;	// = 뒤에 +가 오면 부호로 인식 : data2 = +5로 인식
		System.out.println(data2);
		
		byte data3 = 5;
		// data3 = data3 + 5; // error : 뒤에 계산 결과가 int이기 때문에
		data3 += 3;
		System.out.println(data3);
		
		int a = 10;
		boolean result = (a++ > 10) & (++a > 10);	// 12
//		boolean result = (a++ > 10) && (++a > 10);	11
		System.out.println(result);
		System.out.println(a);
	}

}

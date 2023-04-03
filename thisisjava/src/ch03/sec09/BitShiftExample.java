package ch03.sec09;

public class BitShiftExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int pixel = 0xA400A5FF;	//red: 0xA4, green: 0, blue:0xA5, 
		// red 성분만 출력하고 싶으면
		int red = pixel >>> 24;
		System.out.println(red);
		int blue = (pixel >>> 8) & 0x000000FF ;	
		// 0x00A400A5
		// 0x000000FF &
		// 00000000 10100100 0000000 10101011 = 0x00A400A5
		// 00000000 00000000 0000000 11111111 = 0x000000FF
		// 00000000 00000000 0000000 10101011 = 0x00000A5
		System.out.println(blue);
		
		byte key = 0b00000100;
		// 컨트롤키는 4, 알트키는 2, 쉬프트키는 1이라는 값을 할당 했다고 가정
		// key는 컨트롤키가 눌려진것으로 간주
		if(key == 4) {
			System.out.println("컨트롤키");
		}
		byte key2 = 0b00000110;	// 6 & 0b00000100 => 0x04
		if((key2 & 0x04) > 0) {
			System.out.println("컨트롤키 눌려짐");
		}
	}

}

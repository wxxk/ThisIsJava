package ch19.sec05.exam02;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketAddress;
import java.util.Scanner;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class NewsServer {
	private static DatagramSocket datagramSocket = null;
	private static ExecutorService executorService = 
			Executors.newFixedThreadPool(10);

	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("-----------------------------------------");
		System.out.println("서버를 종료하려면 q를 입력하고 Enter 키를 입력하세요");
		System.out.println("-----------------------------------------");

		//TCP 서버 시작
		startServer();

		Scanner sc = new Scanner(System.in);
		while(true) {
			String key = sc.nextLine();
			if(key.toLowerCase().equals("q")) {
				break;
			}
		}
		sc.close();

		stopServer();
	}
	public static void startServer() {
		// 작업 스레드 정의
		Thread thread = new Thread() {
			@Override
			public void run() {
				try {
					// DatagramSocket 생성 및 Port 바인딩
					datagramSocket = new DatagramSocket(50001);
					System.out.println("[서버] 시작됨");

					while (true) {
						DatagramPacket receivePacket = new DatagramPacket(new byte[1024], 1024);
						datagramSocket.receive(receivePacket);

						executorService.execute(() -> {
							try {
								String newsKind = new String(
										receivePacket.getData(), 0, receivePacket.getLength(), "UTF-8");

								SocketAddress socketAddress = receivePacket.getSocketAddress();

								for(int i = 1; i <= 10; i++) {
									String data = newsKind + ": 뉴스" + i;
									byte[] bytes = data.getBytes("UTF-8");
									DatagramPacket sendPacket = new DatagramPacket(
											bytes, 0, bytes.length, socketAddress);
									datagramSocket.send(sendPacket);
								}

							} catch(IOException e) {}
						});
					}
				} catch (Exception e) {
					System.out.println("[서버]" + e.getMessage());
				}
			}
		};
		// 스레드 시작
		thread.start();
	}
	public static void stopServer() {
		datagramSocket.close();
		executorService.shutdown();
		System.out.println("[서버] 종료됨");

	}

}

package ch06;

//import java.util.Arrays;
import java.util.Scanner;

public class CustomerManager {
	static final int MAX = 100;
//	static String[] nameList = new String[MAX];	// 이름 저장
//	static char[] genderList = new char[MAX];	// 성별 저장
//	static String[] emailList = new String[MAX];	// 이메일 저장
//	static int[] birthYearList = new int[MAX];	// 출생년도 저장
	
	static Customer[] custList = new Customer[MAX];
	
	// 배열은 인덱스가 필요함
	// 배열은 0부터 시작하므로 최초 인덱스는 -1이어야 함
	static int index = -1;
	
	// 배열은 처음 선언한 크기보다 같거나 적은 개수의 자료를 저장
	// 현재 데이터가 몇 개 저장되어 있는지 알 수 있는 변수 선언
	static int count = 0;
	
	// 기본 입력장치로부터 데이터를 입력받기 위해 Scanner객체 생성
	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		while (true) {
			System.out.printf("\n[INFO]고객 수: %d, 인덱스 %d\n", count, index);
			System.out.println("메뉴를 입력하세요");
			System.out.println("(I)nsert, (P)revious, (N)ext, (C)urrent, (U)pdate, (D)elete, (A)ll, (Q)uit");
			System.out.print("메뉴입력: ");
			String menu = sc.next();
			System.out.println();
			menu = menu.toLowerCase();
			
			switch(menu.charAt(0)) {
			case 'i':
				System.out.println("고객정보 입력을 시작합니다.");
				if (count >= MAX) {
					System.out.println("더 이상 입력할 수 없습니다.");
				} else {
					insertCustomerData();
					System.out.println("고객정보를 입력했습니다.");
				}
				break;
			case 'p':
				System.out.println("이전 데이터를 출력합니다.");
				if (index <= 0) {
					System.out.println("이전 데이터가 없습니다.");
				} else {
					index --;
					printCustomerInfo();
				}
				break;
			case 'n':
				System.out.println("다음 데이터를 출력합니다.");
				if (index >= count ) {
					System.out.println("다음 데이터가 없습니다.");
				} else {
					index++;
					printCustomerInfo();
				}
				break;
			case 'c':
				System.out.println("현재 데이터를 출력합니다.");
				if( (index >= 0) && (index < count) ) {
					System.out.println("출력");
					printCustomerInfo();
				} else {
					System.out.println("데이터가 선택되지 않았습니다.");
				}
				break;
			case 'u':
				System.out.println("데이터를 수정합니다.");
				if ( (index >= 0) && (index < count) ) {
					System.out.println(index + "번쨰 데이터를 수정합니다.");
					updateCustomerData();
				} else {
					System.out.println("데이터가 선택되지 않았습니다.");
				}
				break;
			case 'd':
				System.out.println("데이터를 삭제합니다.");
				if ( (index >= 0) && (index < count) ) {
					System.out.println(index + "번째 데이터를 삭제합니다.");
					deleteCustomerData();
				} else {
					System.out.println("데이터가 선택되지 않았습니다.");
				}
				break;
			case 'a':
				allCustomerData();
				break;
			case 'q':
				System.out.println("프로그램을 종료합니다.");
				sc.close();
				System.exit(0);
			default:
				System.out.println("메뉴를 잘못 입력했습니다.");
			}
		}
	}
	
	public static void insertCustomerData() {
		Customer cust = new Customer();
		System.out.print("이름: ");
		cust.setName(sc.next());
		System.out.print("성별(M/F): ");
		cust.setGender(sc.next().charAt(0));
		
		sc.nextLine();
		
		System.out.print("이메일: ");
		cust.setEmail(sc.next());
		System.out.print("출생년도: ");
		cust.setBirthYear(sc.nextInt());
		custList[count++] = cust;
		System.out.println(cust.toString());
		
	}
	
	public static void printCustomerInfo() {
		Customer cust = custList[index];
		System.out.println("==============CUSTOMER INFO===============");
		System.out.println("이름: " + custList[index].getName());
		System.out.println("성별: " + custList[index].getGender());
		System.out.println("이메일: " + cust.getEmail());
		System.out.println("출생년도: " + cust.getBirthYear());
		System.out.println("==========================================");
	}
	
	public static void deleteCustomerData() {
		for (int i = index; i < count - 1; i ++) {
			custList[i] = custList[i+1];
		}
		count--;
	}
	
	public static void updateCustomerData() {
		Customer cust = custList[index];
		System.out.println("------------UPDATE CUSTOMER INFO-----------");
		System.out.print("이름(" + cust.getName() +"): ");
		cust.setName(sc.next());
		
		System.out.print("성별(" + cust.getGender() + "): ");
		String gender = sc.next().toUpperCase();
		cust.setGender(gender.charAt(0));
		
		System.out.print("이메일(" + cust.getEmail() + "): ");
		cust.setEmail(sc.next());
		
		System.out.print("출생년도(" + cust.getBirthYear() + ") ");
		cust.setBirthYear(sc.nextInt());
	}
	
	public static void allCustomerData() {
		Customer cust = custList[index];
		for (int i = 0; i < count; i++) {
			System.out.println("-----------------------------");
			System.out.println("이름: " + cust.getName());
			System.out.println("성별: " + cust.getGender());
			System.out.println("이메일: " + cust.getEmail());
			System.out.println("출생년도: " + cust.getBirthYear());
			System.out.println("-----------------------------");
		}
	}

}

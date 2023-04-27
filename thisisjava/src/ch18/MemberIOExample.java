package ch18;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

public class MemberIOExample {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		List<Member> memberList = new ArrayList<>();
		FileInputStream fis = null;
		ObjectInputStream ois = null;
		
		try {
			fis = new FileInputStream("member.ser");
			ois = new ObjectInputStream(fis);
			memberList = (List<Member>)ois.readObject();
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(memberList.size());
		for(Member m : memberList) {
			System.out.println(m);
		}
		
		
//		memberList.add(new Member("홍길동", 20, 30000, "hong@hong.com"));
//		memberList.add(new Member("홍길서", 22, 20000, "hong@hong.com"));
//		memberList.add(new Member("홍길남", 28, 35000, "hong@hong.com"));
//		ObjectOutputStream oos = null;
//		FileOutputStream fos = null;
//		
//		try {
//			fos = new FileOutputStream("member.ser");
//			oos = new ObjectOutputStream(fos);
//			oos.writeObject(memberList);
//			System.out.println("data saved");
//		} catch(Exception e) {
//			e.printStackTrace();
//		}

	}
}


@Setter @Getter @ToString
@AllArgsConstructor @NoArgsConstructor
class Member implements Serializable{
	private static final long serialVersionUID = -6424687813016196739L;
	private String name;
	private int age;
	private double salary;
	transient private String email;
	private String job;
	public String toCSV() {
		return name + "," + age + "," + salary + "," + email;
	}
}

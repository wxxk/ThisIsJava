package ch12.sec11;

import java.lang.reflect.*;


import lombok.AllArgsConstructor;
import lombok.Data;

public class ReflectionExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Class clz = Car.class;	 // Class타입의 인스턴스 받기
		System.out.println(clz);
		Constructor[] cons = clz.getDeclaredConstructors();
		for (Constructor con : cons) {
			System.out.println(con.getName());
		}
		
		Method[] methods = clz.getDeclaredMethods();
		for(Method method : methods) {
			System.out.println(method.getName());
		}
	}

}

@Data
@AllArgsConstructor
class Car{
	private String model;
	private String owner;
}

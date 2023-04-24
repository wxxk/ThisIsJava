package ch12.sec12;

import java.lang.reflect.Method;

public class PrintAnntationExample {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		Method[] declaredMethods = Service.class.getDeclaredMethods();
		for(Method method : declaredMethods) {
			PrintAnnotation printAnnotation = method.getAnnotation
					(PrintAnnotation.class);
			printLine(printAnnotation);
			
			method.invoke(new Service());
			
			printLine(printAnnotation);
		}
	}

	
	public static void printLine(PrintAnnotation printAnnotation) {
		if(printAnnotation != null) {
			int number = printAnnotation.number();
			for(int i = 0; i < number; i++) {
				String value = printAnnotation.value();
				System.out.print(value);
			}
			System.out.println();
		}
	}
}

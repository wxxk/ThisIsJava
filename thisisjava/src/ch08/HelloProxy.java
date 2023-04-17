package ch08;

public class HelloProxy extends Hello{

	@Override
	public void sayHello(String name) {
		// TODO Auto-generated method stub
		Hellolog.log(); 
		super.sayHello(name);
	}
	

}
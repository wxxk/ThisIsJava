package ch14;

public class Bomb {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		CounterRunner cr = new CounterRunner();
		Thread t1 = new Thread(cr);
		t1.start();
		
		QuestionRunner qr = new QuestionRunner();
		Thread t2 = new Thread(qr);
		t2.start();
	}

}

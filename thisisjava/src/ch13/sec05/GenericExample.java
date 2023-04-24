package ch13.sec05;

public class GenericExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Coures.registerCoures1(new Applicant<Person>(new Person()));
		Coures.registerCoures1(new Applicant<Worker>(new Worker()));
		Coures.registerCoures1(new Applicant<Student>(new Student()));
		Coures.registerCoures1(new Applicant<HighStudent>(new HighStudent()));
		Coures.registerCoures1(new Applicant<MiddleStudent>(new MiddleStudent()));
		System.out.println();
		
//		Coures.registerCoures2(new Applicant<Person>(new Person())); (x)
//		Coures.registerCoures2(new Applicant<Worker>(new Worker())); (x)
		Coures.registerCoures2(new Applicant<Student>(new Student()));
		Coures.registerCoures2(new Applicant<HighStudent>(new HighStudent()));
		Coures.registerCoures2(new Applicant<MiddleStudent>(new MiddleStudent()));
		System.out.println();
		
		Coures.registerCoures3(new Applicant<Person>(new Person()));
		Coures.registerCoures3(new Applicant<Worker>(new Worker()));
	}

}

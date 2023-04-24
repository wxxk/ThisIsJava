package ch12.verify;

public class Member {
	private String id;
	private String name;
	
	public Member(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	public String toString() {
		return this.id + ": " + this.name;
	}
}

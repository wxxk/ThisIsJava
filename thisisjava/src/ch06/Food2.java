package ch06;

public class Food2 {
	private String name;
	private int count;
	private String expDate;
	private String etc;
	
	public Food2() {}
	
	public Food2(String name, int count, String expDate, String etc) {
		this.name = name;
		this.count = count;
		this.expDate = expDate;
		this.etc = etc;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getExpDate() {
		return expDate;
	}

	public void setExpDate(String expDate) {
		this.expDate = expDate;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	@Override
	public String toString() {
		return "Food2 [name=" + name + ", count=" + count + ", expDate=" + expDate + ", etc=" + etc + "]";
	}
	
	
}

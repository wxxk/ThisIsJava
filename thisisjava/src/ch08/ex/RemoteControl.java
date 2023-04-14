package ch08.ex;

public interface RemoteControl {
	// public static final 자동으로 생략
	int MAX_VALUE = 10;
	int MIN_VALUE = 0;
	
	void turnOn();
	void turnOff();
	void setVolume(int volume);
}
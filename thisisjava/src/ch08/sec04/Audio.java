package ch08.sec04;

public class Audio implements RemoteControl {
	private int volume;
	
	@Override
	public void turnOn() {
		// TODO Auto-generated method stub
		System.out.println("Audio를 켭니다.");
	}

	@Override
	public void turnOff() {
		// TODO Auto-generated method stub
		System.out.println("Audio를 끕니다.");
	}

	@Override
	public void setVolume(int volume) {
		// TODO Auto-generated method stub
		if(volume>RemoteControl.MAX_VALUE) {
			this.volume = RemoteControl.MAX_VALUE;
		} else if(volume < RemoteControl.MIN_VALUE) {
			this.volume = RemoteControl.MIN_VALUE;
		} else {
			this.volume = volume;
		}
		System.out.println("현재 Audio 볼륨: " + volume);
	}

}

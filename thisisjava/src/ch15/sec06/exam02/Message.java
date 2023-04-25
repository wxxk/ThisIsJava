package ch15.sec06.exam02;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Setter @Getter
@AllArgsConstructor
public class Message {
	private String command;
	private String to;
}

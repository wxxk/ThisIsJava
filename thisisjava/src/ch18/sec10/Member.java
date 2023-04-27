package ch18.sec10;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@ToString
public class Member implements Serializable{
	private static final long serialVersionUID = 944081140177504905L;
	private String id;
	private String name;	
}

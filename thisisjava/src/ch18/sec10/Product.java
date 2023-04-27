package ch18.sec10;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@ToString
public class Product implements Serializable{
	private static final long serialVersionUID = -1606644964610162235L;
	private String name;
	private int price;
}

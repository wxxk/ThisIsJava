package ch15.sec04;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class Example {
	public static void main(String[] args) {
		Properties prop = new Properties();
		try {
			prop.load(new FileReader("database.properties"));
		} catch(IOException e) {
			System.out.println(e.getMessage());
		}
		System.out.println(prop.getProperty("driver"));
		System.out.println(prop.getProperty("admin"));
	}
}
package ch15.sec04.exam03;

import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class PropertiesExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Properties properties = new Properties();
		
		try {
			properties.load(new FileReader("database.properties"));
		} catch(IOException e) {
			System.out.println(e.getMessage());
		}
		
		String driver = properties.getProperty("driver");
		String url = properties.getProperty("url");
		String username = properties.getProperty("username");
		String password = properties.getProperty("password");
		String admin = properties.getProperty("admin");
		
		System.out.println("driver: " + driver);
		System.out.println("url: " + url);
		System.out.println("username: " + username);
		System.out.println("password: " + password);
		System.out.println("admin: " + admin);
	}

}

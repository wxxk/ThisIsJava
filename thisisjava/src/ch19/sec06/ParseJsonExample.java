package ch19.sec06;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.Charset;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

public class ParseJsonExample {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		BufferedReader br = new BufferedReader(
				new FileReader("C:/temp/member.json", Charset.forName("UTF-8"))
				);
		
		String json = br.readLine();
		br.close();
		
		JSONObject root = new JSONObject(json);
		
		System.out.println("id: " + root.getString("id"));
		System.out.println("name: " + root.getString("id"));
		System.out.println("age: " + root.getInt("age"));
		System.out.println("student: " + root.getBoolean("student"));
		
		JSONObject tel = root.getJSONObject("tel");
		System.out.println("home: " + tel.getString("home"));
		System.out.println("mobile: " + tel.getString("moblie"));
		
		JSONArray skill = root.getJSONArray("skill");
		System.out.print("skill: ");
		for(int i = 0; i < skill.length(); i++) {
			System.out.print(skill.get(i) + ", ");
		}
	}

}

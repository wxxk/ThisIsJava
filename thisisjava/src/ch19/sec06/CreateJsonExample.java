package ch19.sec06;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.nio.charset.Charset;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class CreateJsonExample {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		Gson gson = new Gson();
		JsonObject root = new JsonObject();
		
		root.addProperty("id", "winter");
		root.addProperty("name", "한겨울");
		root.addProperty("age", 25);
		root.addProperty("student", true);
		
		JsonObject tel = new JsonObject();
		tel.addProperty("home", "02-123-1234");
		tel.addProperty("moblie", "010-123-1234");
		root.add("tel", tel);
		
		JsonArray skill = new JsonArray();
		skill.add("java");
		skill.add("C");
		skill.add("C++");
		root.add("skill", skill);
		
		String json = gson.toJson(root);
		
		System.out.println(json);
		
		Writer writer = new FileWriter("C:/temp/member.json", Charset.forName("UTF-8"));
		writer.write(json);
		writer.flush();
		writer.close();
		
	}

}

package ch06.verify;

public class ShopService {
	private static ShopService shopservice = new ShopService();
	
	private ShopService() {};
	
	public static ShopService getInstance() {
		return shopservice;
	}
}

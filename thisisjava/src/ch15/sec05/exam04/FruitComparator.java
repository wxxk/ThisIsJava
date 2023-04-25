package ch15.sec05.exam04;

import java.util.Comparator;

public class FruitComparator implements Comparator<Fruit>{

	@Override
	public int compare(Fruit o1, Fruit o2) {
		// TODO Auto-generated method stub
		if (o1.getPrice() < o2.getPrice()) {
			return -1;
		} else if(o1.getPrice() == o2.getPrice()) {
			return 0;
		} else {
			return -1;
		}
	}
	
}

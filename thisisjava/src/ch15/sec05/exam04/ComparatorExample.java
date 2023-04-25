package ch15.sec05.exam04;

import java.util.TreeSet;

public class ComparatorExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TreeSet<Fruit> treeSet = new TreeSet<Fruit>(new FruitComparator());
		
		treeSet.add(new Fruit("포도", 3000));
		treeSet.add(new Fruit("수박", 10000));
		treeSet.add(new Fruit("딸기", 6000));
		
		for(Fruit fruit : treeSet) {
			System.out.println(fruit.getName() + ":" + fruit.getPrice());
		}
	}

}

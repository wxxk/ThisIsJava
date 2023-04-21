package ch12.sec11;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class ResourceExample {
	public ResourceExample() {
		JFrame f = new JFrame("image");
		ImageIcon icon = new ImageIcon(this.getClass().getResource("dog.jpg"));
		f.add(new JLabel(icon));
		f.pack();
		f.setVisible(true);
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new ResourceExample();
		Class clz = ResourceExample.class;
		System.out.println(clz.getResource("dog.jpg"));
	}

}

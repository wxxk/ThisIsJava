package ch12.verify;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Setter @Getter
@AllArgsConstructor
public class Student {
	private String studentName;
	
	@Override
	public int hashCode() {
		return studentName.hashCode();
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj==null) return false;
		if(obj instanceof Student) {
			Student s = (Student)obj;
			if(s.getStudentName().equals(this.studentName)) {
				return true;
			}
		}
		return false;
	}
}

package jobja.util.collection;

public class People {

	protected String peopleId;
	protected String name;
	protected String sex;
	protected int age;
	
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
//		if (getClass() != obj.getClass())
//			return false;
		People other = (People) obj;
		if (peopleId == null) {
			if (other.peopleId != null)
				return false;
		} else if (!peopleId.equals(other.peopleId))
			return false;
		return true;
	}
	public String getPeopleId() {
		return peopleId;
	}
	public void setPeopleId(String peopleId) {
		this.peopleId = peopleId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "People [peopleId=" + peopleId + ", name=" + name + ", sex=" + sex + ", age=" + age + "]";
	}
	
	
}

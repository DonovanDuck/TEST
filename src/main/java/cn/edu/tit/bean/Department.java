package cn.edu.tit.bean;


/**
 * 学校系部表
 * */
public class Department {
	private String id; //系部ID
	private String name;//系部名
	private Integer num;//系部号
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "Department [id=" + id + ", name=" + name + ", num=" + num + "]";
	}
	public Department() {
		super();
		// TODO Auto-generated constructor stub
	}
}

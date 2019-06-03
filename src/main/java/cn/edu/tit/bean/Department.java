package cn.edu.tit.bean;


/**
 * 学校学术委员会表
 * */
public class Department {
	private String id; //系部ID
	private String name;//系部名
	private Integer num;//系部号
	private Integer deleteFlag;//删除标志位 0已删 1未删
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
	public Integer getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	@Override
	public String toString() {
		return "Department [id=" + id + ", name=" + name + ", num=" + num + ", deleteFlag=" + deleteFlag + "]";
	}
	public Department(String id, String name, Integer num, Integer deleteFlag) {
		super();
		this.id = id;
		this.name = name;
		this.num = num;
		this.deleteFlag = deleteFlag;
	}
	public Department() {
		super();
		// TODO Auto-generated constructor stub
	}

}

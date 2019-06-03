package cn.edu.tit.bean;

import java.sql.Timestamp;

/**
 * 学术委员会
 * */
public class Academic {
	private String id;
	private String name;
	private String professional;
	private Timestamp time;
	private String department;
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
	public String getProfessional() {
		return professional;
	}
	public void setProfessional(String professional) {
		this.professional = professional;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	@Override
	public String toString() {
		return "Academic [id=" + id + ", name=" + name + ", professional=" + professional + ", time=" + time
				+ ", department=" + department + "]";
	}
	public Academic(String id, String name, String professional, Timestamp time, String department) {
		super();
		this.id = id;
		this.name = name;
		this.professional = professional;
		this.time = time;
		this.department = department;
	}
	public Academic() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

package cn.edu.tit.bean;

import java.util.List;

public class UpTask {
	 private String studentId;
	 private String taskId;
	 private String upTaskDetail;
	 private String term;
	 private String grade; //分数
	 private List<Accessory> accessoryList; // 任务对应附件
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public String getUpTaskDetail() {
		return upTaskDetail;
	}
	public void setUpTaskDetail(String upTaskDetail) {
		this.upTaskDetail = upTaskDetail;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public List<Accessory> getAccessoryList() {
		return accessoryList;
	}
	public void setAccessoryList(List<Accessory> accessoryList) {
		this.accessoryList = accessoryList;
	}
	public UpTask(String studentId, String taskId, String upTaskDetail, String term, String grade,
			List<Accessory> accessoryList) {
		super();
		this.studentId = studentId;
		this.taskId = taskId;
		this.upTaskDetail = upTaskDetail;
		this.term = term;
		this.grade = grade;
		this.accessoryList = accessoryList;
	}
	public UpTask() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

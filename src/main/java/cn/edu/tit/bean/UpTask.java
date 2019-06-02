package cn.edu.tit.bean;

import java.sql.Timestamp;
import java.util.List;

public class UpTask {
	 private String studentId;
	 private String taskId;
	 private String upTaskDetail;
	 private String term;
	 private String grade; //分数
	 private Timestamp upTime;//提交时间
	 private Timestamp commentTime;//批阅时间
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
	public Timestamp getUpTime() {
		return upTime;
	}
	public void setUpTime(Timestamp upTime) {
		this.upTime = upTime;
	}
	public Timestamp getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(Timestamp commentTime) {
		this.commentTime = commentTime;
	}
	public List<Accessory> getAccessoryList() {
		return accessoryList;
	}
	public void setAccessoryList(List<Accessory> accessoryList) {
		this.accessoryList = accessoryList;
	}
	public UpTask(String studentId, String taskId, String upTaskDetail, String term, String grade, Timestamp upTime,
			Timestamp commentTime, List<Accessory> accessoryList) {
		super();
		this.studentId = studentId;
		this.taskId = taskId;
		this.upTaskDetail = upTaskDetail;
		this.term = term;
		this.grade = grade;
		this.upTime = upTime;
		this.commentTime = commentTime;
		this.accessoryList = accessoryList;
	}
	public UpTask() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}

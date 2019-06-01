package cn.edu.tit.bean;

import java.sql.Timestamp;

public class TurnClassTask {
	private String taskId;
	private String taskName;
	private String virtualClassNun;
	private String taskIntroduction;
	private String taskDetail;
	private String category;
	private String publisherId;
	private Timestamp startTime;//开始时间，发布时间，
	private Timestamp endTime;//结束时间
	private String courseId;
	private String accessoryPath;//附件路径
	
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public String getVirtualClassNun() {
		return virtualClassNun;
	}
	public void setVirtualClassNun(String virtualClassNun) {
		this.virtualClassNun = virtualClassNun;
	}
	public String getTaskIntroduction() {
		return taskIntroduction;
	}
	public void setTaskIntroduction(String taskIntroduction) {
		this.taskIntroduction = taskIntroduction;
	}
	public String getTaskDetail() {
		return taskDetail;
	}
	public void setTaskDetail(String taskDetail) {
		this.taskDetail = taskDetail;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPublisherId() {
		return publisherId;
	}
	public void setPublisherId(String publisherId) {
		this.publisherId = publisherId;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getAccessoryPath() {
		return accessoryPath;
	}
	public void setAccessoryPath(String accessoryPath) {
		this.accessoryPath = accessoryPath;
	}
	@Override
	public String toString() {
		return "TurnClassTask [taskId=" + taskId + ", taskName=" + taskName + ", virtualClassNun=" + virtualClassNun
				+ ", taskIntroduction=" + taskIntroduction + ", taskDetail=" + taskDetail + ", category=" + category
				+ ", publisherId=" + publisherId + ", startTime=" + startTime + ", endTime=" + endTime + ", courseId="
				+ courseId + ", accessoryPath=" + accessoryPath + "]";
	}
	public TurnClassTask(String taskId, String taskName, String virtualClassNun, String taskIntroduction,
			String taskDetail, String category, String publisherId, Timestamp startTime, Timestamp endTime,
			String courseId, String accessoryPath) {
		super();
		this.taskId = taskId;
		this.taskName = taskName;
		this.virtualClassNun = virtualClassNun;
		this.taskIntroduction = taskIntroduction;
		this.taskDetail = taskDetail;
		this.category = category;
		this.publisherId = publisherId;
		this.startTime = startTime;
		this.endTime = endTime;
		this.courseId = courseId;
		this.accessoryPath = accessoryPath;
	}
	public TurnClassTask() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}

/**
 * 发布到班级的任务（作业、实验、课程设计）
 */
package cn.edu.tit.bean;

import java.sql.Timestamp;
import java.util.List;

public class Task {

	private String taskId; // 任务id
	private String taskTitle; // 任务标题
	private String taskDetail; //任务描述
	private Timestamp publishTime; // 发布时间
	private Timestamp taskEndTime; //任务结束时间 
	private String publisherId; // 发布人id
	private Integer courseId; // 对应课程id
	private Integer status; //对应任务状态 （0：开始任务  1：结束任务）
	private List<Accessory> accessoryList; // 任务对应附件
	
	// setter - getter
	
	public String getTaskTitle() {
		return taskTitle;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public void setTaskTitle(String taskTitle) {
		this.taskTitle = taskTitle;
	}
	public String getTaskDetail() {
		return taskDetail;
	}
	public void setTaskDetail(String taskDetail) {
		this.taskDetail = taskDetail;
	}
	public Timestamp getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Timestamp publishTime) {
		this.publishTime = publishTime;
	}
	public Timestamp getTaskEndTime() {
		return taskEndTime;
	}
	public void setTaskEndTime(Timestamp taskEndTime) {
		this.taskEndTime = taskEndTime;
	}
	public String getPublisherId() {
		return publisherId;
	}
	public void setPublisherId(String publisherId) {
		this.publisherId = publisherId;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public List<Accessory> getAccessoryList() {
		return accessoryList;
	}
	public void setAccessoryList(List<Accessory> accessoryList) {
		this.accessoryList = accessoryList;
	}
	
	
	
	
}

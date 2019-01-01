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
	private Integer taskPoint; //任务对应的积分
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
	public Integer getTaskPoint() {
		return taskPoint;
	}
	public void setTaskPoint(Integer taskPoint) {
		this.taskPoint = taskPoint;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Task [taskId=" + taskId + ", taskTitle=" + taskTitle + ", taskDetail=" + taskDetail + ", publishTime="
				+ publishTime + ", taskEndTime=" + taskEndTime + ", publisherId=" + publisherId + ", courseId="
				+ courseId + ", status=" + status + ", taskPoint=" + taskPoint + ", accessoryList=" + accessoryList
				+ "]";
	}
	public Task(String taskId, String taskTitle, String taskDetail, Timestamp publishTime, Timestamp taskEndTime,
			String publisherId, Integer courseId, Integer status, Integer taskPoint, List<Accessory> accessoryList) {
		super();
		this.taskId = taskId;
		this.taskTitle = taskTitle;
		this.taskDetail = taskDetail;
		this.publishTime = publishTime;
		this.taskEndTime = taskEndTime;
		this.publisherId = publisherId;
		this.courseId = courseId;
		this.status = status;
		this.taskPoint = taskPoint;
		this.accessoryList = accessoryList;
	}
	
	
	
	
	
}

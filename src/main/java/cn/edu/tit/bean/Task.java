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
	private String virtualClassNum; // 对应课程id
	private String chapter; // 任务所属目录
	private String taskType; // 任务类型
	private Integer status; //对应任务状态 （0：开始任务  1：结束任务）
	private Integer taskPoint; //任务对应的积分
	private List<Accessory> accessoryList; // 任务对应附件
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public String getTaskTitle() {
		return taskTitle;
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
	public String getVirtualClassNum() {
		return virtualClassNum;
	}
	public void setVirtualClassNum(String virtualClassNum) {
		this.virtualClassNum = virtualClassNum;
	}
	public String getChapter() {
		return chapter;
	}
	public void setChapter(String chapter) {
		this.chapter = chapter;
	}
	public String getTaskType() {
		return taskType;
	}
	public void setTaskType(String taskType) {
		this.taskType = taskType;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getTaskPoint() {
		return taskPoint;
	}
	public void setTaskPoint(Integer taskPoint) {
		this.taskPoint = taskPoint;
	}
	public List<Accessory> getAccessoryList() {
		return accessoryList;
	}
	public void setAccessoryList(List<Accessory> accessoryList) {
		this.accessoryList = accessoryList;
	}
	public Task(String taskId, String taskTitle, String taskDetail, Timestamp publishTime, Timestamp taskEndTime,
			String publisherId, String virtualClassNum, String chapter, String taskType, Integer status,
			Integer taskPoint, List<Accessory> accessoryList) {
		super();
		this.taskId = taskId;
		this.taskTitle = taskTitle;
		this.taskDetail = taskDetail;
		this.publishTime = publishTime;
		this.taskEndTime = taskEndTime;
		this.publisherId = publisherId;
		this.virtualClassNum = virtualClassNum;
		this.chapter = chapter;
		this.taskType = taskType;
		this.status = status;
		this.taskPoint = taskPoint;
		this.accessoryList = accessoryList;
	}
	public Task() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	// setter - getter
	
}

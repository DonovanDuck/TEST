package cn.edu.tit.bean;

import java.sql.Timestamp;

public class TurnClassAccessory {
	private String accessoryId;
	private String accessoryName;
	private String accessoryCategory;
	private String taskId;//翻转课堂ID
	private String authorId;
	private Timestamp uploadTime;
	public String getAccessoryId() {
		return accessoryId;
	}
	public void setAccessoryId(String accessoryId) {
		this.accessoryId = accessoryId;
	}
	public String getAccessoryName() {
		return accessoryName;
	}
	public void setAccessoryName(String accessoryName) {
		this.accessoryName = accessoryName;
	}
	public String getAccessoryCategory() {
		return accessoryCategory;
	}
	public void setAccessoryCategory(String accessoryCategory) {
		this.accessoryCategory = accessoryCategory;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public String getAuthorId() {
		return authorId;
	}
	public void setAuthorId(String authorId) {
		this.authorId = authorId;
	}
	public Timestamp getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}
	@Override
	public String toString() {
		return "TurnClassAccessory [accessoryId=" + accessoryId + ", accessoryName=" + accessoryName
				+ ", accessoryCategory=" + accessoryCategory + ", taskId=" + taskId + ", authorId=" + authorId
				+ ", uploadTime=" + uploadTime + "]";
	}
	public TurnClassAccessory(String accessoryId, String accessoryName, String accessoryCategory, String taskId,
			String authorId, Timestamp uploadTime) {
		super();
		this.accessoryId = accessoryId;
		this.accessoryName = accessoryName;
		this.accessoryCategory = accessoryCategory;
		this.taskId = taskId;
		this.authorId = authorId;
		this.uploadTime = uploadTime;
	}
	public TurnClassAccessory() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}

package cn.edu.tit.bean;

import java.sql.Timestamp;

/**
 * 课堂反馈实体
 * */
public class TurnClassFeedback {
	private String id;
	private String content;
	private String authorId;
	private String accessoryId;
	private String taskId;
	private Timestamp uploadTime;
	private String teamId;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthorId() {
		return authorId;
	}
	public void setAuthorId(String authorId) {
		this.authorId = authorId;
	}
	public String getAccessoryId() {
		return accessoryId;
	}
	public void setAccessoryId(String accessoryId) {
		this.accessoryId = accessoryId;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public Timestamp getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}
	public String getTeamId() {
		return teamId;
	}
	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}
	@Override
	public String toString() {
		return "TurnClassFeedback [id=" + id + ", content=" + content + ", authorId=" + authorId + ", accessoryId="
				+ accessoryId + ", taskId=" + taskId + ", uploadTime=" + uploadTime + ", teamId=" + teamId + "]";
	}
	public TurnClassFeedback(String id, String content, String authorId, String accessoryId, String taskId,
			Timestamp uploadTime, String teamId) {
		super();
		this.id = id;
		this.content = content;
		this.authorId = authorId;
		this.accessoryId = accessoryId;
		this.taskId = taskId;
		this.uploadTime = uploadTime;
		this.teamId = teamId;
	}
	public TurnClassFeedback() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}

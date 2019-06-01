package cn.edu.tit.bean;

import java.sql.Timestamp;

/**
 * 课堂准备
 * */
public class TurnClassPlanForCourse {
	private String id;//课堂准备id
	private String content;//内容
	private String authorId;//作者id
	private String authorName;//作者名
	private String authorPicture;//作者头像
	private String accessoryPath;//作者附件路径
	private String taskId;//任务ID
	private Timestamp uploadTime;//上传时间
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
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public String getAuthorPicture() {
		return authorPicture;
	}
	public void setAuthorPicture(String authorPicture) {
		this.authorPicture = authorPicture;
	}
	public String getaccessoryPath() {
		return accessoryPath;
	}
	public void setaccessoryPath(String accessoryPath) {
		this.accessoryPath = accessoryPath;
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
	@Override
	public String toString() {
		return "TurnClassPlanForCourse [id=" + id + ", content=" + content + ", authorId=" + authorId + ", authorName="
				+ authorName + ", authorPicture=" + authorPicture + ", accessoryPath=" + accessoryPath + ", taskId="
				+ taskId + ", uploadTime=" + uploadTime + "]";
	}
	public TurnClassPlanForCourse(String id, String content, String authorId, String authorName, String authorPicture,
			String accessoryPath, String taskId, Timestamp uploadTime) {
		super();
		this.id = id;
		this.content = content;
		this.authorId = authorId;
		this.authorName = authorName;
		this.authorPicture = authorPicture;
		this.accessoryPath = accessoryPath;
		this.taskId = taskId;
		this.uploadTime = uploadTime;
	}
	public TurnClassPlanForCourse() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}

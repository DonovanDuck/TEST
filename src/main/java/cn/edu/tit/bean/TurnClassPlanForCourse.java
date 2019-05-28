package cn.edu.tit.bean;

import java.sql.Timestamp;

/**
 * 课堂准备
 * */
public class TurnClassPlanForCourse {
	private String id;
	private String content;
	private String authorId;
	private String authorName;
	private String authorPicture;
	private String accrssoryPath;
	private String taskId;
	private Timestamp uploadTime;
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
	public String getAccrssoryPath() {
		return accrssoryPath;
	}
	public void setAccrssoryPath(String accrssoryPath) {
		this.accrssoryPath = accrssoryPath;
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
				+ authorName + ", authorPicture=" + authorPicture + ", accrssoryPath=" + accrssoryPath + ", taskId="
				+ taskId + ", uploadTime=" + uploadTime + "]";
	}
	public TurnClassPlanForCourse(String id, String content, String authorId, String authorName, String authorPicture,
			String accrssoryPath, String taskId, Timestamp uploadTime) {
		super();
		this.id = id;
		this.content = content;
		this.authorId = authorId;
		this.authorName = authorName;
		this.authorPicture = authorPicture;
		this.accrssoryPath = accrssoryPath;
		this.taskId = taskId;
		this.uploadTime = uploadTime;
	}
	public TurnClassPlanForCourse() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}

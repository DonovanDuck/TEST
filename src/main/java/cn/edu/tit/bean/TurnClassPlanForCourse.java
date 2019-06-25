package cn.edu.tit.bean;

import java.sql.Timestamp;
import java.util.List;

/**
 * 课堂准备
 * */
public class TurnClassPlanForCourse {
	private String id;//课堂准备id
	private String content;//内容
	private String authorId;//作者id
	private String authorName;//作者名
	private String authorPicture;//作者头像
	private List<TurnClassAccessory> accessoryPath;//作者附件路径
	private String taskId;//任务ID
	private Timestamp uploadTime;//上传时间
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
	public List<TurnClassAccessory> getAccessoryPath() {
		return accessoryPath;
	}
	public void setAccessoryPath(List<TurnClassAccessory> accessoryPath) {
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
	public String getTeamId() {
		return teamId;
	}
	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}
	@Override
	public String toString() {
		return "TurnClassPlanForCourse [id=" + id + ", content=" + content + ", authorId=" + authorId + ", authorName="
				+ authorName + ", authorPicture=" + authorPicture + ", accessoryPath=" + accessoryPath + ", taskId="
				+ taskId + ", uploadTime=" + uploadTime + ", teamId=" + teamId + "]";
	}
	public TurnClassPlanForCourse(String id, String content, String authorId, String authorName, String authorPicture,
			List<TurnClassAccessory> accessoryPath, String taskId, Timestamp uploadTime, String teamId) {
		super();
		this.id = id;
		this.content = content;
		this.authorId = authorId;
		this.authorName = authorName;
		this.authorPicture = authorPicture;
		this.accessoryPath = accessoryPath;
		this.taskId = taskId;
		this.uploadTime = uploadTime;
		this.teamId = teamId;
	}
	public TurnClassPlanForCourse() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

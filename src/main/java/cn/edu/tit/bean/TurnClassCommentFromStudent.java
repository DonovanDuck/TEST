package cn.edu.tit.bean;

import java.sql.Timestamp;
/**
 * 评论表
 * */
public class TurnClassCommentFromStudent {
	private String commentId;
	private String authorId;
	private String authorName;
	private String authorPicture;
	private String conent;
	private Timestamp commentTime;
	private String taskId;//课堂翻转ID
	
	public String getCommentId() {
		return commentId;
	}
	public void setCommentId(String commentId) {
		this.commentId = commentId;
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
	public String getConent() {
		return conent;
	}
	public void setConent(String conent) {
		this.conent = conent;
	}
	public Timestamp getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(Timestamp commentTime) {
		this.commentTime = commentTime;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	@Override
	public String toString() {
		return "TurnClassComment [commentId=" + commentId + ", authorId=" + authorId + ", authorName=" + authorName
				+ ", authorPicture=" + authorPicture + ", conent=" + conent + ", commentTime=" + commentTime
				+ ", taskId=" + taskId + "]";
	}
	public TurnClassCommentFromStudent(String commentId, String authorId, String authorName, String authorPicture, String conent,
			Timestamp commentTime, String taskId) {
		super();
		this.commentId = commentId;
		this.authorId = authorId;
		this.authorName = authorName;
		this.authorPicture = authorPicture;
		this.conent = conent;
		this.commentTime = commentTime;
		this.taskId = taskId;
	}
	public TurnClassCommentFromStudent() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

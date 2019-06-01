package cn.edu.tit.bean;

import java.sql.Timestamp;

/**
 * 评语表
 * */
public class TurnClassCommentFromTeacher {
	private String commentId;
	private String authorId;
	private String authorName;
	private String authorPicture;
	private String conent;
	private String score;//小组成绩
	private String teamId;
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
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getTeamId() {
		return teamId;
	}
	public void setTeamId(String teamId) {
		this.teamId = teamId;
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
		return "TurnClassCommentFromTeacher [commentId=" + commentId + ", authorId=" + authorId + ", authorName="
				+ authorName + ", authorPicture=" + authorPicture + ", conent=" + conent + ", score=" + score
				+ ", teamId=" + teamId + ", commentTime=" + commentTime + ", taskId=" + taskId + "]";
	}
	public TurnClassCommentFromTeacher(String commentId, String authorId, String authorName, String authorPicture,
			String conent, String score, String teamId, Timestamp commentTime, String taskId) {
		super();
		this.commentId = commentId;
		this.authorId = authorId;
		this.authorName = authorName;
		this.authorPicture = authorPicture;
		this.conent = conent;
		this.score = score;
		this.teamId = teamId;
		this.commentTime = commentTime;
		this.taskId = taskId;
	}
	public TurnClassCommentFromTeacher() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

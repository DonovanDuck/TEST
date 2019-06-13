package cn.edu.tit.bean;

import java.sql.Timestamp;

public class AchievementComment {

	private String commentId;//评论ID
	private String achievemendId;//成果ID
	private String authorId;//作者id
	private String category;//评论所属成果的类别
	private String commentContent;//评论内容
	private Timestamp uploadTime;//上传时间	
	private String authorPicture;//评论者头像 方便前台使用设置
	private String authorName;//评论者名字 方便前台使用设置
	private String authorCategory;//老师，学生
	public String getCommentId() {
		return commentId;
	}
	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}
	public String getAchievemendId() {
		return achievemendId;
	}
	public void setAchievemendId(String achievemendId) {
		this.achievemendId = achievemendId;
	}
	public String getAuthorId() {
		return authorId;
	}
	public void setAuthorId(String authorId) {
		this.authorId = authorId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Timestamp getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}
	public String getAuthorPicture() {
		return authorPicture;
	}
	public void setAuthorPicture(String authorPicture) {
		this.authorPicture = authorPicture;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public String getAuthorCategory() {
		return authorCategory;
	}
	public void setAuthorCategory(String authorCategory) {
		this.authorCategory = authorCategory;
	}
	@Override
	public String toString() {
		return "AchievementComment [commentId=" + commentId + ", achievemendId=" + achievemendId + ", authorId="
				+ authorId + ", category=" + category + ", commentContent=" + commentContent + ", uploadTime="
				+ uploadTime + ", authorPicture=" + authorPicture + ", authorName=" + authorName + ", authorCategory="
				+ authorCategory + "]";
	}
	public AchievementComment(String commentId, String achievemendId, String authorId, String category,
			String commentContent, Timestamp uploadTime, String authorPicture, String authorName,
			String authorCategory) {
		super();
		this.commentId = commentId;
		this.achievemendId = achievemendId;
		this.authorId = authorId;
		this.category = category;
		this.commentContent = commentContent;
		this.uploadTime = uploadTime;
		this.authorPicture = authorPicture;
		this.authorName = authorName;
		this.authorCategory = authorCategory;
	}
	public AchievementComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

package cn.edu.tit.bean;

import java.sql.Timestamp;

public class AchievementScore {

	private String id;//唯一识别码
	private String userId;//评分者
	private Double score;//成果分数
	private String achievementId;//成果id
	private String category;//成果分类
	private Timestamp time;//更新时间
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	public String getAchievementId() {
		return achievementId;
	}
	public void setAchievementId(String achievementId) {
		this.achievementId = achievementId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "AchievementScore [id=" + id + ", userId=" + userId + ", score=" + score + ", achievementId="
				+ achievementId + ", category=" + category + ", time=" + time + "]";
	}
	public AchievementScore(String id, String userId, Double score, String achievementId, String category,
			Timestamp time) {
		super();
		this.id = id;
		this.userId = userId;
		this.score = score;
		this.achievementId = achievementId;
		this.category = category;
		this.time = time;
	}
	public AchievementScore() {
		super();
		// TODO Auto-generated constructor stub
	}
}

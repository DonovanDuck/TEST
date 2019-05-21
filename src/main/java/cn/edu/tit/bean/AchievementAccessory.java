package cn.edu.tit.bean;

/**
 * 成果附件
 * */
import java.io.File;
import java.sql.Timestamp;


public class AchievementAccessory {
	private String accessoryId; // 附件id
	private String authorId;//作者id
	private String accessoryName; // 附件名
	private String accessoryPath; // 附件存放路径
	private Timestamp accessoryTime; //附件提交时间
	private String achievementId; // 对应成果id
	private Integer deleteFlag;//附件删除标志位
	public String getAccessoryId() {
		return accessoryId;
	}
	public void setAccessoryId(String accessoryId) {
		this.accessoryId = accessoryId;
	}
	public String getAuthorId() {
		return authorId;
	}
	public void setAuthorId(String authorId) {
		this.authorId = authorId;
	}
	public String getAccessoryName() {
		return accessoryName;
	}
	public void setAccessoryName(String accessoryName) {
		this.accessoryName = accessoryName;
	}
	public String getAccessoryPath() {
		return accessoryPath;
	}
	public void setAccessoryPath(String accessoryPath) {
		this.accessoryPath = accessoryPath;
	}
	public Timestamp getAccessoryTime() {
		return accessoryTime;
	}
	public void setAccessoryTime(Timestamp accessoryTime) {
		this.accessoryTime = accessoryTime;
	}
	public String getAchievementId() {
		return achievementId;
	}
	public void setAchievementId(String achievementId) {
		this.achievementId = achievementId;
	}
	public Integer getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	@Override
	public String toString() {
		return "AchievementAccessory [accessoryId=" + accessoryId + ", authorId=" + authorId + ", accessoryName="
				+ accessoryName + ", accessoryPath=" + accessoryPath + ", accessoryTime=" + accessoryTime
				+ ", achievementId=" + achievementId + ", deleteFlag=" + deleteFlag + "]";
	}
	public AchievementAccessory(String accessoryId, String authorId, String accessoryName, String accessoryPath,
			Timestamp accessoryTime, String achievementId, Integer deleteFlag) {
		super();
		this.accessoryId = accessoryId;
		this.authorId = authorId;
		this.accessoryName = accessoryName;
		this.accessoryPath = accessoryPath;
		this.accessoryTime = accessoryTime;
		this.achievementId = achievementId;
		this.deleteFlag = deleteFlag;
	}
	public AchievementAccessory() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

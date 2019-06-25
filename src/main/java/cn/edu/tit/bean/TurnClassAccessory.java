package cn.edu.tit.bean;

import java.sql.Timestamp;

public class TurnClassAccessory {
	private String accessoryId;
	private String accessoryName;
	private String accessoryCategory;
	private String taskId;//翻转课堂ID
	private String authorId;
	private Timestamp uploadTime;
	private String accessoryPath;
	private String teamId;
	private String stage;//附件所处阶段
	private String unique;//附件某阶段的判断式   此字段可用可不用
	
	
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
	public String getAccessoryPath() {
		return accessoryPath;
	}
	public void setAccessoryPath(String accessoryPath) {
		this.accessoryPath = accessoryPath;
	}
	public String getTeamId() {
		return teamId;
	}
	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}
	public String getStage() {
		return stage;
	}
	public void setStage(String stage) {
		this.stage = stage;
	}
	public String getUnique() {
		return unique;
	}
	public void setUnique(String unique) {
		this.unique = unique;
	}
	@Override
	public String toString() {
		return "TurnClassAccessory [accessoryId=" + accessoryId + ", accessoryName=" + accessoryName
				+ ", accessoryCategory=" + accessoryCategory + ", taskId=" + taskId + ", authorId=" + authorId
				+ ", uploadTime=" + uploadTime + ", accessoryPath=" + accessoryPath + ", teamId=" + teamId + ", stage="
				+ stage + ", unique=" + unique + "]";
	}
	public TurnClassAccessory(String accessoryId, String accessoryName, String accessoryCategory, String taskId,
			String authorId, Timestamp uploadTime, String accessoryPath, String teamId, String stage, String unique) {
		super();
		this.accessoryId = accessoryId;
		this.accessoryName = accessoryName;
		this.accessoryCategory = accessoryCategory;
		this.taskId = taskId;
		this.authorId = authorId;
		this.uploadTime = uploadTime;
		this.accessoryPath = accessoryPath;
		this.teamId = teamId;
		this.stage = stage;
		this.unique = unique;
	}
	public TurnClassAccessory() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

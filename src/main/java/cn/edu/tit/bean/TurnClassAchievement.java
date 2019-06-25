package cn.edu.tit.bean;

import java.sql.Timestamp;
/**
 * 最终成果
 * */
public class TurnClassAchievement {
	private String id;
	private String taskId;//翻转任务ID
	private String teamId;//小组id
	private String stage;
	private Integer planStage;
	private Integer demandStage;
	private Integer designStage;
	private Integer arithmeticStage;
	private Integer testStage;
	private String authorId;
	private String authorName;
	private String authorPicture;
	private String accessoryPath;
	private Timestamp uploadTime;
	private String content;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
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
	public Integer getPlanStage() {
		return planStage;
	}
	public void setPlanStage(Integer planStage) {
		this.planStage = planStage;
	}
	public Integer getDemandStage() {
		return demandStage;
	}
	public void setDemandStage(Integer demandStage) {
		this.demandStage = demandStage;
	}
	public Integer getDesignStage() {
		return designStage;
	}
	public void setDesignStage(Integer designStage) {
		this.designStage = designStage;
	}
	public Integer getArithmeticStage() {
		return arithmeticStage;
	}
	public void setArithmeticStage(Integer arithmeticStage) {
		this.arithmeticStage = arithmeticStage;
	}
	public Integer getTestStage() {
		return testStage;
	}
	public void setTestStage(Integer testStage) {
		this.testStage = testStage;
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
	public String getAccessoryPath() {
		return accessoryPath;
	}
	public void setAccessoryPath(String accessoryPath) {
		this.accessoryPath = accessoryPath;
	}
	public Timestamp getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "TurnClassAchievement [id=" + id + ", taskId=" + taskId + ", teamId=" + teamId + ", stage=" + stage
				+ ", planStage=" + planStage + ", demandStage=" + demandStage + ", designStage=" + designStage
				+ ", arithmeticStage=" + arithmeticStage + ", testStage=" + testStage + ", authorId=" + authorId
				+ ", authorName=" + authorName + ", authorPicture=" + authorPicture + ", accessoryPath=" + accessoryPath
				+ ", uploadTime=" + uploadTime + ", content=" + content + "]";
	}
	public TurnClassAchievement(String id, String taskId, String teamId, String stage, Integer planStage,
			Integer demandStage, Integer designStage, Integer arithmeticStage, Integer testStage, String authorId,
			String authorName, String authorPicture, String accessoryPath, Timestamp uploadTime, String content) {
		super();
		this.id = id;
		this.taskId = taskId;
		this.teamId = teamId;
		this.stage = stage;
		this.planStage = planStage;
		this.demandStage = demandStage;
		this.designStage = designStage;
		this.arithmeticStage = arithmeticStage;
		this.testStage = testStage;
		this.authorId = authorId;
		this.authorName = authorName;
		this.authorPicture = authorPicture;
		this.accessoryPath = accessoryPath;
		this.uploadTime = uploadTime;
		this.content = content;
	}
	public TurnClassAchievement() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

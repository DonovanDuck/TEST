package cn.edu.tit.bean;

import java.sql.Timestamp;

public class Achievement {
	private String achievementId;
	private String achievementCategory;
	private String achievementName;
	private String achievementPhoto;
	private String achievementDetail;
	private String guidanceTeacher;
	private String member;
	private String compere;
	private String teamName;
	private String level;
	private Timestamp approvalTime;
	private Timestamp finishTime;
	private String achievementAccessory;
	private String fund;
	private String feature;
	private String sharedValue;//共享价值
	private String isShare;
	private Integer turnover;
	public String getAchievementId() {
		return achievementId;
	}
	public void setAchievementId(String achievementId) {
		this.achievementId = achievementId;
	}
	public String getAchievementCategory() {
		return achievementCategory;
	}
	public void setAchievementCategory(String achievementCategory) {
		this.achievementCategory = achievementCategory;
	}
	public String getAchievementName() {
		return achievementName;
	}
	public void setAchievementName(String achievementName) {
		this.achievementName = achievementName;
	}
	public String getAchievementPhoto() {
		return achievementPhoto;
	}
	public void setAchievementPhoto(String achievementPhoto) {
		this.achievementPhoto = achievementPhoto;
	}
	public String getAchievementDetail() {
		return achievementDetail;
	}
	public void setAchievementDetail(String achievementDetail) {
		this.achievementDetail = achievementDetail;
	}
	public String getGuidanceTeacher() {
		return guidanceTeacher;
	}
	public void setGuidanceTeacher(String guidanceTeacher) {
		this.guidanceTeacher = guidanceTeacher;
	}
	public String getMember() {
		return member;
	}
	public void setMember(String member) {
		this.member = member;
	}
	public String getCompere() {
		return compere;
	}
	public void setCompere(String compere) {
		this.compere = compere;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public Timestamp getApprovalTime() {
		return approvalTime;
	}
	public void setApprovalTime(Timestamp approvalTime) {
		this.approvalTime = approvalTime;
	}
	public Timestamp getFinishTime() {
		return finishTime;
	}
	public void setFinishTime(Timestamp finishTime) {
		this.finishTime = finishTime;
	}
	public String getAchievementAccessory() {
		return achievementAccessory;
	}
	public void setAchievementAccessory(String achievementAccessory) {
		this.achievementAccessory = achievementAccessory;
	}
	public String getFund() {
		return fund;
	}
	public void setFund(String fund) {
		this.fund = fund;
	}
	public String getFeature() {
		return feature;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	public String getSharedValue() {
		return sharedValue;
	}
	public void setSharedValue(String sharedValue) {
		this.sharedValue = sharedValue;
	}
	public String getIsShare() {
		return isShare;
	}
	public void setIsShare(String isShare) {
		this.isShare = isShare;
	}
	public Integer getTurnover() {
		return turnover;
	}
	public void setTurnover(Integer turnover) {
		this.turnover = turnover;
	}
	public Achievement(String achievementId, String achievementCategory, String achievementName,
			String achievementPhoto, String achievementDetail, String guidanceTeacher, String member, String compere,
			String teamName, String level, Timestamp approvalTime, Timestamp finishTime, String achievementAccessory,
			String fund, String feature, String sharedValue, String isShare, Integer turnover) {
		super();
		this.achievementId = achievementId;
		this.achievementCategory = achievementCategory;
		this.achievementName = achievementName;
		this.achievementPhoto = achievementPhoto;
		this.achievementDetail = achievementDetail;
		this.guidanceTeacher = guidanceTeacher;
		this.member = member;
		this.compere = compere;
		this.teamName = teamName;
		this.level = level;
		this.approvalTime = approvalTime;
		this.finishTime = finishTime;
		this.achievementAccessory = achievementAccessory;
		this.fund = fund;
		this.feature = feature;
		this.sharedValue = sharedValue;
		this.isShare = isShare;
		this.turnover = turnover;
	}
	public Achievement() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}

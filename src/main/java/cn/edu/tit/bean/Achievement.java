package cn.edu.tit.bean;

import java.io.File;
import java.sql.Date;
import java.sql.Timestamp;

public class Achievement {
	private String achievementId; //成果ID
	private String achievementName; //成果名
	private String achievementCategory; // 成果类别
	private String achievementPhoto; //成果图片
	private String achievementDetail; // 成果详情
	private String guidanceTeacher; //成果指导详情
	private String member; //团队成员
	private String compere; //
	private String teamName; //团队名
	private String level; // 校级一般，重点，省级一般，重点
	private Date approvalTime; //批准时间
	private Date finishTime;//完成时间
	private String achievementAccessory;//成果附件
	private Integer fund;//资金
	private String feature;//特色
	private String sharedValue;//共享价值
	private String isShare;//是否分享
	private Integer turnover;//成交量
	@Override
	public String toString() {
		return "Achievement [achievementId=" + achievementId + ", achievementName=" + achievementName
				+ ", achievementCategory=" + achievementCategory + ", achievementPhoto=" + achievementPhoto
				+ ", achievementDetail=" + achievementDetail + ", guidanceTeacher=" + guidanceTeacher + ", member="
				+ member + ", compere=" + compere + ", teamName=" + teamName + ", level=" + level + ", approvalTime="
				+ approvalTime + ", finishTime=" + finishTime + ", achievementAccessory=" + achievementAccessory
				+ ", fund=" + fund + ", feature=" + feature + ", sharedValue=" + sharedValue + ", isShare=" + isShare
				+ ", turnover=" + turnover + "]";
	}
	public Achievement() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Achievement(String achievementId, String achievementName, String achievementCategory,
			String achievementPhoto, String achievementDetail, String guidanceTeacher, String member, String compere,
			String teamName, String level, Date approvalTime, Date finishTime, String achievementAccessory,
			Integer fund, String feature, String sharedValue, String isShare, Integer turnover) {
		super();
		this.achievementId = achievementId;
		this.achievementName = achievementName;
		this.achievementCategory = achievementCategory;
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
	public String getAchievementId() {
		return achievementId;
	}
	public void setAchievementId(String achievementId) {
		this.achievementId = achievementId;
	}
	public String getAchievementName() {
		return achievementName;
	}
	public void setAchievementName(String achievementName) {
		this.achievementName = achievementName;
	}
	public String getAchievementCategory() {
		return achievementCategory;
	}
	public void setAchievementCategory(String achievementCategory) {
		this.achievementCategory = achievementCategory;
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
	public Date getApprovalTime() {
		return approvalTime;
	}
	public void setApprovalTime(Date approvalTime) {
		this.approvalTime = approvalTime;
	}
	public Date getFinishTime() {
		return finishTime;
	}
	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}
	public String getAchievementAccessory() {
		return achievementAccessory;
	}
	public void setAchievementAccessory(String achievementAccessory) {
		this.achievementAccessory = achievementAccessory;
	}
	public Integer getFund() {
		return fund;
	}
	public void setFund(Integer fund) {
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
}

package cn.edu.tit.bean;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * Student Innovation and Entrepreneurship
 * 大学生创新创业
 * */
public class SIAE {
	private String achievementId; //大学生创新创业ID
	private String achievementName; //大学生创新创业名
	private String achievementCategory; // 大学生创新创业类别
	private AchievementPicture achievementPhoto; //大学生创新创业图片（多张),作为附件保存
	private String  introduction;//大学生创新创业拓展简介（50字以内）
	private String achievementDetail; // 大学生创新创业详情
	private String guidanceTeacher; //大学生创新创业指导教师
	private String member; //团队成员
	private String compere; //主持人
	private String teamName; //团队名
	private String level;//获奖情况
	private String feature; //主要特点
	private Date finishTime;//完成时间
	private AchievementAccessory achievementAccessory;//大学生创新创业附件
	private String plan;//计划
	private String status;//状态
	private String declaration;//申报书
	private String midreply;//中期检查
	private String concludingRreport;//结题报告
	private Timestamp uploadTime;//成果上传时间
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
	public AchievementPicture getAchievementPhoto() {
		return achievementPhoto;
	}
	public void setAchievementPhoto(AchievementPicture achievementPhoto) {
		this.achievementPhoto = achievementPhoto;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
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
	public String getFeature() {
		return feature;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	public Date getFinishTime() {
		return finishTime;
	}
	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}
	public AchievementAccessory getAchievementAccessory() {
		return achievementAccessory;
	}
	public void setAchievementAccessory(AchievementAccessory achievementAccessory) {
		this.achievementAccessory = achievementAccessory;
	}
	public String getPlan() {
		return plan;
	}
	public void setPlan(String plan) {
		this.plan = plan;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDeclaration() {
		return declaration;
	}
	public void setDeclaration(String declaration) {
		this.declaration = declaration;
	}
	public String getMidreply() {
		return midreply;
	}
	public void setMidreply(String midreply) {
		this.midreply = midreply;
	}
	public String getConcludingRreport() {
		return concludingRreport;
	}
	public void setConcludingRreport(String concludingRreport) {
		this.concludingRreport = concludingRreport;
	}
	public Timestamp getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}
	@Override
	public String toString() {
		return "SIAE [achievementId=" + achievementId + ", achievementName=" + achievementName
				+ ", achievementCategory=" + achievementCategory + ", achievementPhoto=" + achievementPhoto
				+ ", introduction=" + introduction + ", achievementDetail=" + achievementDetail + ", guidanceTeacher="
				+ guidanceTeacher + ", member=" + member + ", compere=" + compere + ", teamName=" + teamName
				+ ", level=" + level + ", feature=" + feature + ", finishTime=" + finishTime + ", achievementAccessory="
				+ achievementAccessory + ", plan=" + plan + ", status=" + status + ", declaration=" + declaration
				+ ", midreply=" + midreply + ", concludingRreport=" + concludingRreport + ", uploadTime=" + uploadTime
				+ "]";
	}
	public SIAE(String achievementId, String achievementName, String achievementCategory,
			AchievementPicture achievementPhoto, String introduction, String achievementDetail, String guidanceTeacher,
			String member, String compere, String teamName, String level, String feature, Date finishTime,
			AchievementAccessory achievementAccessory, String plan, String status, String declaration, String midreply,
			String concludingRreport, Timestamp uploadTime) {
		super();
		this.achievementId = achievementId;
		this.achievementName = achievementName;
		this.achievementCategory = achievementCategory;
		this.achievementPhoto = achievementPhoto;
		this.introduction = introduction;
		this.achievementDetail = achievementDetail;
		this.guidanceTeacher = guidanceTeacher;
		this.member = member;
		this.compere = compere;
		this.teamName = teamName;
		this.level = level;
		this.feature = feature;
		this.finishTime = finishTime;
		this.achievementAccessory = achievementAccessory;
		this.plan = plan;
		this.status = status;
		this.declaration = declaration;
		this.midreply = midreply;
		this.concludingRreport = concludingRreport;
		this.uploadTime = uploadTime;
	}
	public SIAE() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

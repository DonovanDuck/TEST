package cn.edu.tit.bean;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * Achievements of College Students'Competition
 * 大学生竞赛成果
 * */
public class AOCSC {
	private String achievementId; //大学生竞赛成果ID
	private String achievementName; //大学生竞赛成果名
	private String achievementCategory; // 大学生竞赛成果类别
	private AchievementPicture achievementPhoto; //大学生竞赛成果图片（多张),作为附件保存
	private String  introduction;//大学生竞赛成果简介（50字以内）
	private String achievementDetail; // 大学生竞赛成果详情
	private String guidanceTeacher; //大学生竞赛成果指导教师
	private String member; //团队成员
	private String memberNum;//成员学号
	private String uploadAuthorId;//上传者ID
	private String compere; //主持人
	private String teamName; //团队名
	private String level;//获奖情况
	private String feature; //主要特点
	private Date finishTime;//完成时间
	private Timestamp uploadTime;//提交时间
	private AchievementAccessory achievementAccessory;//大学生竞赛成果附件
	private String firstPicture;//第一张图片
	private Integer browseVolume;//浏览量
	private Integer deleteFlag;//删除标志位,0为删除,1为没删除
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
	public String getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;
	}
	public String getUploadAuthorId() {
		return uploadAuthorId;
	}
	public void setUploadAuthorId(String uploadAuthorId) {
		this.uploadAuthorId = uploadAuthorId;
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
	public Timestamp getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}
	public AchievementAccessory getAchievementAccessory() {
		return achievementAccessory;
	}
	public void setAchievementAccessory(AchievementAccessory achievementAccessory) {
		this.achievementAccessory = achievementAccessory;
	}
	public String getFirstPicture() {
		return firstPicture;
	}
	public void setFirstPicture(String firstPicture) {
		this.firstPicture = firstPicture;
	}
	public Integer getBrowseVolume() {
		return browseVolume;
	}
	public void setBrowseVolume(Integer browseVolume) {
		this.browseVolume = browseVolume;
	}
	public Integer getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	@Override
	public String toString() {
		return "AOCSC [achievementId=" + achievementId + ", achievementName=" + achievementName
				+ ", achievementCategory=" + achievementCategory + ", achievementPhoto=" + achievementPhoto
				+ ", introduction=" + introduction + ", achievementDetail=" + achievementDetail + ", guidanceTeacher="
				+ guidanceTeacher + ", member=" + member + ", memberNum=" + memberNum + ", uploadAuthorId="
				+ uploadAuthorId + ", compere=" + compere + ", teamName=" + teamName + ", level=" + level + ", feature="
				+ feature + ", finishTime=" + finishTime + ", uploadTime=" + uploadTime + ", achievementAccessory="
				+ achievementAccessory + ", firstPicture=" + firstPicture + ", browseVolume=" + browseVolume
				+ ", deleteFlag=" + deleteFlag + "]";
	}
	public AOCSC(String achievementId, String achievementName, String achievementCategory,
			AchievementPicture achievementPhoto, String introduction, String achievementDetail, String guidanceTeacher,
			String member, String memberNum, String uploadAuthorId, String compere, String teamName, String level,
			String feature, Date finishTime, Timestamp uploadTime, AchievementAccessory achievementAccessory,
			String firstPicture, Integer browseVolume, Integer deleteFlag) {
		super();
		this.achievementId = achievementId;
		this.achievementName = achievementName;
		this.achievementCategory = achievementCategory;
		this.achievementPhoto = achievementPhoto;
		this.introduction = introduction;
		this.achievementDetail = achievementDetail;
		this.guidanceTeacher = guidanceTeacher;
		this.member = member;
		this.memberNum = memberNum;
		this.uploadAuthorId = uploadAuthorId;
		this.compere = compere;
		this.teamName = teamName;
		this.level = level;
		this.feature = feature;
		this.finishTime = finishTime;
		this.uploadTime = uploadTime;
		this.achievementAccessory = achievementAccessory;
		this.firstPicture = firstPicture;
		this.browseVolume = browseVolume;
		this.deleteFlag = deleteFlag;
	}
	public AOCSC() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

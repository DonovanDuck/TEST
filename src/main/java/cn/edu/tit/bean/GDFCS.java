package cn.edu.tit.bean;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * Graduation Design for College Students
 * 大学生毕业设计
 * */
public class GDFCS {
	private String achievementId; //大学生毕业设计ID
	private String achievementName; //大学生毕业设计名
	private String achievementCategory; // 大学生毕业设计类别
	private AchievementPicture achievementPhoto; //大学生毕业设计图片（多张),作为附件保存
	private String  introduction;//大学生毕业设计简介（50字以内）
	private String achievementDetail; // 大学生毕业设计详情
	private String guidanceTeacher; //大学生毕业设计指导教师
	private String compere; //项目负责人
	private String memberNum;//成员学号
	private String uploadAuthorId;//上传者ID
	private Date finishTime;//完成时间
	private Timestamp uploadTime;//上传时间
	private AchievementAccessory achievementAccessory;//大学生毕业设计附件
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
	public String getCompere() {
		return compere;
	}
	public void setCompere(String compere) {
		this.compere = compere;
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
		return "GDFCS [achievementId=" + achievementId + ", achievementName=" + achievementName
				+ ", achievementCategory=" + achievementCategory + ", achievementPhoto=" + achievementPhoto
				+ ", introduction=" + introduction + ", achievementDetail=" + achievementDetail + ", guidanceTeacher="
				+ guidanceTeacher + ", compere=" + compere + ", memberNum=" + memberNum + ", uploadAuthorId="
				+ uploadAuthorId + ", finishTime=" + finishTime + ", uploadTime=" + uploadTime
				+ ", achievementAccessory=" + achievementAccessory + ", firstPicture=" + firstPicture
				+ ", browseVolume=" + browseVolume + ", deleteFlag=" + deleteFlag + "]";
	}
	public GDFCS(String achievementId, String achievementName, String achievementCategory,
			AchievementPicture achievementPhoto, String introduction, String achievementDetail, String guidanceTeacher,
			String compere, String memberNum, String uploadAuthorId, Date finishTime, Timestamp uploadTime,
			AchievementAccessory achievementAccessory, String firstPicture, Integer browseVolume, Integer deleteFlag) {
		super();
		this.achievementId = achievementId;
		this.achievementName = achievementName;
		this.achievementCategory = achievementCategory;
		this.achievementPhoto = achievementPhoto;
		this.introduction = introduction;
		this.achievementDetail = achievementDetail;
		this.guidanceTeacher = guidanceTeacher;
		this.compere = compere;
		this.memberNum = memberNum;
		this.uploadAuthorId = uploadAuthorId;
		this.finishTime = finishTime;
		this.uploadTime = uploadTime;
		this.achievementAccessory = achievementAccessory;
		this.firstPicture = firstPicture;
		this.browseVolume = browseVolume;
		this.deleteFlag = deleteFlag;
	}
	public GDFCS() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

package cn.edu.tit.bean;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *课程拓展作品 
 **/
public class CourseExpand {
	private String achievementId; //课程拓展ID
	private String courseId;//课程ID
	private String achievementName; //课程拓展名
	private String achievementCategory; // 课程拓展类别
	private AchievementPicture achievementPhoto; //课程拓展图片（多张),作为附件保存
	private String  introduction;//课程拓展简介（50字以内）
	private String achievementDetail; // 课程拓展详情
	private String guidanceTeacher; //课程拓展指导教师
	private String member; //团队成员
	private String memberNum;//成员学号
	private Integer browseVolume;//浏览量
	private String uploadAuthorId;//上传者ID
	private String compere; //项目负责人
	private String teamName; //团队名
	private Date finishTime;//完成时间时间
	private Timestamp uploadTime;//上传时间
	private String firstPicture;//第一张图片
	private AchievementAccessory achievementAccessory;//课程拓展附件
	private Integer deleteFlag;//删除标志位,0为删除,1为没删除
	public String getAchievementId() {
		return achievementId;
	}
	public void setAchievementId(String achievementId) {
		this.achievementId = achievementId;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
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
	public Integer getBrowseVolume() {
		return browseVolume;
	}
	public void setBrowseVolume(Integer browseVolume) {
		this.browseVolume = browseVolume;
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
	public String getFirstPicture() {
		return firstPicture;
	}
	public void setFirstPicture(String firstPicture) {
		this.firstPicture = firstPicture;
	}
	public AchievementAccessory getAchievementAccessory() {
		return achievementAccessory;
	}
	public void setAchievementAccessory(AchievementAccessory achievementAccessory) {
		this.achievementAccessory = achievementAccessory;
	}
	public Integer getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	@Override
	public String toString() {
		return "CourseExpand [achievementId=" + achievementId + ", courseId=" + courseId + ", achievementName="
				+ achievementName + ", achievementCategory=" + achievementCategory + ", achievementPhoto="
				+ achievementPhoto + ", introduction=" + introduction + ", achievementDetail=" + achievementDetail
				+ ", guidanceTeacher=" + guidanceTeacher + ", member=" + member + ", memberNum=" + memberNum
				+ ", browseVolume=" + browseVolume + ", uploadAuthorId=" + uploadAuthorId + ", compere=" + compere
				+ ", teamName=" + teamName + ", finishTime=" + finishTime + ", uploadTime=" + uploadTime
				+ ", firstPicture=" + firstPicture + ", achievementAccessory=" + achievementAccessory + ", deleteFlag="
				+ deleteFlag + "]";
	}
	public CourseExpand(String achievementId, String courseId, String achievementName, String achievementCategory,
			AchievementPicture achievementPhoto, String introduction, String achievementDetail, String guidanceTeacher,
			String member, String memberNum, Integer browseVolume, String uploadAuthorId, String compere,
			String teamName, Date finishTime, Timestamp uploadTime, String firstPicture,
			AchievementAccessory achievementAccessory, Integer deleteFlag) {
		super();
		this.achievementId = achievementId;
		this.courseId = courseId;
		this.achievementName = achievementName;
		this.achievementCategory = achievementCategory;
		this.achievementPhoto = achievementPhoto;
		this.introduction = introduction;
		this.achievementDetail = achievementDetail;
		this.guidanceTeacher = guidanceTeacher;
		this.member = member;
		this.memberNum = memberNum;
		this.browseVolume = browseVolume;
		this.uploadAuthorId = uploadAuthorId;
		this.compere = compere;
		this.teamName = teamName;
		this.finishTime = finishTime;
		this.uploadTime = uploadTime;
		this.firstPicture = firstPicture;
		this.achievementAccessory = achievementAccessory;
		this.deleteFlag = deleteFlag;
	}
	public CourseExpand() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

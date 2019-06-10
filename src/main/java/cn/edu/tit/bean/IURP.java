package cn.edu.tit.bean;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * 产学研类
 * */
public class IURP {
	private String projectId; //产学研id
	private String projectName;//产学研名字
	private String introduction;//产学研简介（50字以内）
	private String projectDetail;//产学研详情
	private String compere;//主持人
	private String member;//成员
	private Float price;//价格
	private String memberNum;//成员学号
	private String uploadAuthorId;//上传者ID
	private Integer collectTheAmount;//进账金额
	private String cooperator;//合作单位
	private Date startTime;//开始时间
	private Date endTime;//结束时间
	private String status;//状态
	private AchievementPicture projectPhoto;//产学研照片
	private AchievementAccessory accessory;//产学研附件
	private String isshare;//是否分享
	private String projectCategory;//项目类别
	private String firstPicture;//第一张图片
	private Integer browseVolume;//浏览量
	private Integer deleteFlag;//删除标志位,0为删除,1为没删除
	private Timestamp uploadTime;
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getProjectDetail() {
		return projectDetail;
	}
	public void setProjectDetail(String projectDetail) {
		this.projectDetail = projectDetail;
	}
	public String getCompere() {
		return compere;
	}
	public void setCompere(String compere) {
		this.compere = compere;
	}
	public String getMember() {
		return member;
	}
	public void setMember(String member) {
		this.member = member;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
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
	public Integer getCollectTheAmount() {
		return collectTheAmount;
	}
	public void setCollectTheAmount(Integer collectTheAmount) {
		this.collectTheAmount = collectTheAmount;
	}
	public String getCooperator() {
		return cooperator;
	}
	public void setCooperator(String cooperator) {
		this.cooperator = cooperator;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public AchievementPicture getProjectPhoto() {
		return projectPhoto;
	}
	public void setProjectPhoto(AchievementPicture projectPhoto) {
		this.projectPhoto = projectPhoto;
	}
	public AchievementAccessory getAccessory() {
		return accessory;
	}
	public void setAccessory(AchievementAccessory accessory) {
		this.accessory = accessory;
	}
	public String getIsshare() {
		return isshare;
	}
	public void setIsshare(String isshare) {
		this.isshare = isshare;
	}
	public String getProjectCategory() {
		return projectCategory;
	}
	public void setProjectCategory(String projectCategory) {
		this.projectCategory = projectCategory;
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
	public Timestamp getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}
	@Override
	public String toString() {
		return "IURP [projectId=" + projectId + ", projectName=" + projectName + ", introduction=" + introduction
				+ ", projectDetail=" + projectDetail + ", compere=" + compere + ", member=" + member + ", price="
				+ price + ", memberNum=" + memberNum + ", uploadAuthorId=" + uploadAuthorId + ", collectTheAmount="
				+ collectTheAmount + ", cooperator=" + cooperator + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", status=" + status + ", projectPhoto=" + projectPhoto + ", accessory=" + accessory + ", isshare="
				+ isshare + ", projectCategory=" + projectCategory + ", firstPicture=" + firstPicture
				+ ", browseVolume=" + browseVolume + ", deleteFlag=" + deleteFlag + ", uploadTime=" + uploadTime + "]";
	}
	public IURP(String projectId, String projectName, String introduction, String projectDetail, String compere,
			String member, Float price, String memberNum, String uploadAuthorId, Integer collectTheAmount,
			String cooperator, Date startTime, Date endTime, String status, AchievementPicture projectPhoto,
			AchievementAccessory accessory, String isshare, String projectCategory, String firstPicture,
			Integer browseVolume, Integer deleteFlag, Timestamp uploadTime) {
		super();
		this.projectId = projectId;
		this.projectName = projectName;
		this.introduction = introduction;
		this.projectDetail = projectDetail;
		this.compere = compere;
		this.member = member;
		this.price = price;
		this.memberNum = memberNum;
		this.uploadAuthorId = uploadAuthorId;
		this.collectTheAmount = collectTheAmount;
		this.cooperator = cooperator;
		this.startTime = startTime;
		this.endTime = endTime;
		this.status = status;
		this.projectPhoto = projectPhoto;
		this.accessory = accessory;
		this.isshare = isshare;
		this.projectCategory = projectCategory;
		this.firstPicture = firstPicture;
		this.browseVolume = browseVolume;
		this.deleteFlag = deleteFlag;
		this.uploadTime = uploadTime;
	}
	public IURP() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}

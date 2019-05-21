package cn.edu.tit.bean;

import java.sql.Timestamp;

public class IndustryUniversityResearchProject {
	private String projectId;
	private String projectName;
	private String projectDetail;
	private String compere;//主持人
	private String member;
	private Integer collectTheAmoount;//进账金额
	private String cooperator;
	private Timestamp startTime;
	private Timestamp endTime;
	private String status;
	private String projectCategory;
	private String projectPhoto;
	private String isShare;
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
	public Integer getCollectTheAmoount() {
		return collectTheAmoount;
	}
	public void setCollectTheAmoount(Integer collectTheAmoount) {
		this.collectTheAmoount = collectTheAmoount;
	}
	public String getCooperator() {
		return cooperator;
	}
	public void setCooperator(String cooperator) {
		this.cooperator = cooperator;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getProjectCategory() {
		return projectCategory;
	}
	public void setProjectCategory(String projectCategory) {
		this.projectCategory = projectCategory;
	}
	public String getProjectPhoto() {
		return projectPhoto;
	}
	public void setProjectPhoto(String projectPhoto) {
		this.projectPhoto = projectPhoto;
	}
	public String getIsShare() {
		return isShare;
	}
	public void setIsShare(String isShare) {
		this.isShare = isShare;
	}
	public IndustryUniversityResearchProject(String projectId, String projectName, String projectDetail, String compere,
			String member, Integer collectTheAmoount, String cooperator, Timestamp startTime, Timestamp endTime,
			String status, String projectCategory, String projectPhoto, String isShare) {
		super();
		this.projectId = projectId;
		this.projectName = projectName;
		this.projectDetail = projectDetail;
		this.compere = compere;
		this.member = member;
		this.collectTheAmoount = collectTheAmoount;
		this.cooperator = cooperator;
		this.startTime = startTime;
		this.endTime = endTime;
		this.status = status;
		this.projectCategory = projectCategory;
		this.projectPhoto = projectPhoto;
		this.isShare = isShare;
	}
	public IndustryUniversityResearchProject() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

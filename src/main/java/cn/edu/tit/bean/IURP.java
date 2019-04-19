package cn.edu.tit.bean;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * 产学研类
 * */
public class IURP {
	private String projectId;
	private String projectName;
	private String projectDetail;
	private String compere;
	private String member;
	private Integer collectTheAmount;
	private String cooperator;
	private Date startTime;
	private Date endTime;
	private String status;
	private String projectPhoto;
	private String isshare;
	private String projectCategory;
	@Override
	public String toString() {
		return "IURP [projectId=" + projectId + ", projectName=" + projectName + ", projectDetail=" + projectDetail
				+ ", compere=" + compere + ", member=" + member + ", collectTheAmount=" + collectTheAmount
				+ ", cooperator=" + cooperator + ", startTime=" + startTime + ", endTime=" + endTime + ", status="
				+ status + ", projectPhoto=" + projectPhoto + ", isshare=" + isshare + ", projectCategory="
				+ projectCategory + "]";
	}
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
	public String getProjectPhoto() {
		return projectPhoto;
	}
	public void setProjectPhoto(String projectPhoto) {
		this.projectPhoto = projectPhoto;
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
	public IURP() {
		super();
		// TODO Auto-generated constructor stub
	}
	public IURP(String projectId, String projectName, String projectDetail, String compere, String member,
			Integer collectTheAmount, String cooperator, Date startTime, Date endTime, String status,
			String projectPhoto, String isshare, String projectCategory) {
		super();
		this.projectId = projectId;
		this.projectName = projectName;
		this.projectDetail = projectDetail;
		this.compere = compere;
		this.member = member;
		this.collectTheAmount = collectTheAmount;
		this.cooperator = cooperator;
		this.startTime = startTime;
		this.endTime = endTime;
		this.status = status;
		this.projectPhoto = projectPhoto;
		this.isshare = isshare;
		this.projectCategory = projectCategory;
	}
	
}

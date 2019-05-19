package cn.edu.tit.bean;

import java.sql.Timestamp;

public class Prize {
	private String prizeId;
	private String prizeProjectName;
	private String prizeLevel;
	private String thatOrganization;//认定单位
	private String compere;
	private String member;
	private Timestamp prizeTime;
	private Timestamp projectTime;
	private String isShare;
	private String certificatePhoto;//证书图片
	public String getPrizeId() {
		return prizeId;
	}
	public void setPrizeId(String prizeId) {
		this.prizeId = prizeId;
	}
	public String getPrizeProjectName() {
		return prizeProjectName;
	}
	public void setPrizeProjectName(String prizeProjectName) {
		this.prizeProjectName = prizeProjectName;
	}
	public String getPrizeLevel() {
		return prizeLevel;
	}
	public void setPrizeLevel(String prizeLevel) {
		this.prizeLevel = prizeLevel;
	}
	public String getThatOrganization() {
		return thatOrganization;
	}
	public void setThatOrganization(String thatOrganization) {
		this.thatOrganization = thatOrganization;
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
	public Timestamp getPrizeTime() {
		return prizeTime;
	}
	public void setPrizeTime(Timestamp prizeTime) {
		this.prizeTime = prizeTime;
	}
	public Timestamp getProjectTime() {
		return projectTime;
	}
	public void setProjectTime(Timestamp projectTime) {
		this.projectTime = projectTime;
	}
	public String getIsShare() {
		return isShare;
	}
	public void setIsShare(String isShare) {
		this.isShare = isShare;
	}
	public String getCertificatePhoto() {
		return certificatePhoto;
	}
	public void setCertificatePhoto(String certificatePhoto) {
		this.certificatePhoto = certificatePhoto;
	}
	public Prize(String prizeId, String prizeProjectName, String prizeLevel, String thatOrganization, String compere,
			String member, Timestamp prizeTime, Timestamp projectTime, String isShare, String certificatePhoto) {
		super();
		this.prizeId = prizeId;
		this.prizeProjectName = prizeProjectName;
		this.prizeLevel = prizeLevel;
		this.thatOrganization = thatOrganization;
		this.compere = compere;
		this.member = member;
		this.prizeTime = prizeTime;
		this.projectTime = projectTime;
		this.isShare = isShare;
		this.certificatePhoto = certificatePhoto;
	}
	public Prize() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

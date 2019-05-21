package cn.edu.tit.bean;

import java.sql.Timestamp;

public class Paper {
	private String paperId;
	private String paperTitle;
	private String summary;//摘要
	private String publishedJournals;//发表期刊
	private String journalsPhoto;//期刊首页，目录页，论文首页图片，逗号分隔
	private String publishingHouse;//出版社
	private Timestamp publishTime;//
	private String author;
	private String organization;//单位
	private String relevantProject;//相关项目
	private String isShare;//是否公开
	private String isCore;//是否为核心
	public String getPaperId() {
		return paperId;
	}
	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}
	public String getPaperTitle() {
		return paperTitle;
	}
	public void setPaperTitle(String paperTitle) {
		this.paperTitle = paperTitle;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getPublishedJournals() {
		return publishedJournals;
	}
	public void setPublishedJournals(String publishedJournals) {
		this.publishedJournals = publishedJournals;
	}
	public String getJournalsPhoto() {
		return journalsPhoto;
	}
	public void setJournalsPhoto(String journalsPhoto) {
		this.journalsPhoto = journalsPhoto;
	}
	public String getPublishingHouse() {
		return publishingHouse;
	}
	public void setPublishingHouse(String publishingHouse) {
		this.publishingHouse = publishingHouse;
	}
	public Timestamp getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Timestamp publishTime) {
		this.publishTime = publishTime;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getOrganization() {
		return organization;
	}
	public void setOrganization(String organization) {
		this.organization = organization;
	}
	public String getRelevantProject() {
		return relevantProject;
	}
	public void setRelevantProject(String relevantProject) {
		this.relevantProject = relevantProject;
	}
	public String getIsShare() {
		return isShare;
	}
	public void setIsShare(String isShare) {
		this.isShare = isShare;
	}
	public String getIsCore() {
		return isCore;
	}
	public void setIsCore(String isCore) {
		this.isCore = isCore;
	}
	public Paper(String paperId, String paperTitle, String summary, String publishedJournals, String journalsPhoto,
			String publishingHouse, Timestamp publishTime, String author, String organization, String relevantProject,
			String isShare, String isCore) {
		super();
		this.paperId = paperId;
		this.paperTitle = paperTitle;
		this.summary = summary;
		this.publishedJournals = publishedJournals;
		this.journalsPhoto = journalsPhoto;
		this.publishingHouse = publishingHouse;
		this.publishTime = publishTime;
		this.author = author;
		this.organization = organization;
		this.relevantProject = relevantProject;
		this.isShare = isShare;
		this.isCore = isCore;
	}
	public Paper() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}

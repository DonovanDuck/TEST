package cn.edu.tit.bean;

import java.sql.Timestamp;

import org.apache.poi.ss.formula.functions.T;

public class TeacherProject {
	private String teacherProjectId;
	private String teacherProjectName;
	private String teacherProjectDetail;
	private Timestamp declareTime;
	private Timestamp approvalTime;
	private Timestamp finishTime;
	private String approvalOrganization;
	private Integer fund;
	private String level;
	private String teacherProjectCategory;
	public String getTeacherProjectId() {
		return teacherProjectId;
	}
	public void setTeacherProjectId(String teacherProjectId) {
		this.teacherProjectId = teacherProjectId;
	}
	public String getTeacherProjectName() {
		return teacherProjectName;
	}
	public void setTeacherProjectName(String teacherProjectName) {
		this.teacherProjectName = teacherProjectName;
	}
	public String getTeacherProjectDetail() {
		return teacherProjectDetail;
	}
	public void setTeacherProjectDetail(String teacherProjectDetail) {
		this.teacherProjectDetail = teacherProjectDetail;
	}
	public Timestamp getDeclareTime() {
		return declareTime;
	}
	public void setDeclareTime(Timestamp declareTime) {
		this.declareTime = declareTime;
	}
	public Timestamp getApprovalTime() {
		return approvalTime;
	}
	public void setApprovalTime(Timestamp approvalTime) {
		this.approvalTime = approvalTime;
	}
	public Timestamp getFinishTime() {
		return finishTime;
	}
	public void setFinishTime(Timestamp finishTime) {
		this.finishTime = finishTime;
	}
	public String getApprovalOrganization() {
		return approvalOrganization;
	}
	public void setApprovalOrganization(String approvalOrganization) {
		this.approvalOrganization = approvalOrganization;
	}
	public Integer getFund() {
		return fund;
	}
	public void setFund(Integer fund) {
		this.fund = fund;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getTeacherProjectCategory() {
		return teacherProjectCategory;
	}
	public void setTeacherProjectCategory(String teacherProjectCategory) {
		this.teacherProjectCategory = teacherProjectCategory;
	}
	public TeacherProject(String teacherProjectId, String teacherProjectName, String teacherProjectDetail,
			Timestamp declareTime, Timestamp approvalTime, Timestamp finishTime, String approvalOrganization,
			Integer fund, String level, String teacherProjectCategory) {
		super();
		this.teacherProjectId = teacherProjectId;
		this.teacherProjectName = teacherProjectName;
		this.teacherProjectDetail = teacherProjectDetail;
		this.declareTime = declareTime;
		this.approvalTime = approvalTime;
		this.finishTime = finishTime;
		this.approvalOrganization = approvalOrganization;
		this.fund = fund;
		this.level = level;
		this.teacherProjectCategory = teacherProjectCategory;
	}
	public TeacherProject() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}

package cn.edu.tit.bean;

public class TeacherTeam {

	private String publishId;
	private String memberId;
	private String manager;
	public String getPublishId() {
		return publishId;
	}
	public void setPublishId(String publishId) {
		this.publishId = publishId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public TeacherTeam(String publishId, String memberId, String manager) {
		super();
		this.publishId = publishId;
		this.memberId = memberId;
		this.manager = manager;
	}
	public TeacherTeam() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}

package cn.edu.tit.bean;

import java.sql.Timestamp;
import java.util.List;

public class TurnClassTeam {
	private String teamId;//小组ID 
	private String leaderId;//小组领导者ID 
	private String leaderName;//小组领导者名
	private String memberId;//小组成员ID 
	private String memberName;//成员名
	private String taskId;//任务ID
	private Timestamp acceptTime;//接受任务时间
	private String virtualClassId;//虚拟班级号
	private String status;//小组状态
	private List<Student> listStu;
	private String projectName;
	private String projectIntro;
	public String getTeamId() {
		return teamId;
	}
	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}
	public String getLeaderId() {
		return leaderId;
	}
	public void setLeaderId(String leaderId) {
		this.leaderId = leaderId;
	}
	public String getLeaderName() {
		return leaderName;
	}
	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public Timestamp getAcceptTime() {
		return acceptTime;
	}
	public void setAcceptTime(Timestamp acceptTime) {
		this.acceptTime = acceptTime;
	}
	public String getVirtualClassId() {
		return virtualClassId;
	}
	public void setVirtualClassId(String virtualClassId) {
		this.virtualClassId = virtualClassId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public List<Student> getListStu() {
		return listStu;
	}
	public void setListStu(List<Student> listStu) {
		this.listStu = listStu;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getProjectIntro() {
		return projectIntro;
	}
	public void setProjectIntro(String projectIntro) {
		this.projectIntro = projectIntro;
	}
	public TurnClassTeam(String teamId, String leaderId, String leaderName, String memberId, String memberName,
			String taskId, Timestamp acceptTime, String virtualClassId, String status, List<Student> listStu,
			String projectName, String projectIntro) {
		super();
		this.teamId = teamId;
		this.leaderId = leaderId;
		this.leaderName = leaderName;
		this.memberId = memberId;
		this.memberName = memberName;
		this.taskId = taskId;
		this.acceptTime = acceptTime;
		this.virtualClassId = virtualClassId;
		this.status = status;
		this.listStu = listStu;
		this.projectName = projectName;
		this.projectIntro = projectIntro;
	}
	@Override
	public String toString() {
		return "TurnClassTeam [teamId=" + teamId + ", leaderId=" + leaderId + ", leaderName=" + leaderName
				+ ", memberId=" + memberId + ", memberName=" + memberName + ", taskId=" + taskId + ", acceptTime="
				+ acceptTime + ", virtualClassId=" + virtualClassId + ", status=" + status + ", listStu=" + listStu
				+ ", projectName=" + projectName + ", projectIntro=" + projectIntro + "]";
	}
	public TurnClassTeam() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}

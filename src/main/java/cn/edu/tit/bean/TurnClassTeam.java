package cn.edu.tit.bean;

import java.sql.Timestamp;

public class TurnClassTeam {
	private String teamId;
	private String leaderId;
	private String leaderName;
	private String memberId;
	private String memberName;
	private String taskId;
	private Timestamp acceptTime;
	private String virtualClassId;
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
	@Override
	public String toString() {
		return "TurnClassTeam [teamId=" + teamId + ", leaderId=" + leaderId + ", leaderName=" + leaderName
				+ ", memberId=" + memberId + ", memberName=" + memberName + ", taskId=" + taskId + ", acceptTime="
				+ acceptTime + ", virtualClassId=" + virtualClassId + "]";
	}
	public TurnClassTeam(String teamId, String leaderId, String leaderName, String memberId, String memberName,
			String taskId, Timestamp acceptTime, String virtualClassId) {
		super();
		this.teamId = teamId;
		this.leaderId = leaderId;
		this.leaderName = leaderName;
		this.memberId = memberId;
		this.memberName = memberName;
		this.taskId = taskId;
		this.acceptTime = acceptTime;
		this.virtualClassId = virtualClassId;
	}
	public TurnClassTeam() {
		super();
		// TODO Auto-generated constructor stub
	} 
	
	
}

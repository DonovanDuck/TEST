package cn.edu.tit.bean;

import java.sql.Timestamp;

/**
 * 任务表 任务与小组的对应关系
 * */
public class TurnClassTaskToTeam {
 private String id;
 private String teamId;
 private Timestamp acceptTaskTime;
 private String status;//任务状态
 private String taskId;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getTeamId() {
	return teamId;
}
public void setTeamId(String teamId) {
	this.teamId = teamId;
}
public Timestamp getAcceptTaskTime() {
	return acceptTaskTime;
}
public void setAcceptTaskTime(Timestamp acceptTaskTime) {
	this.acceptTaskTime = acceptTaskTime;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getTaskId() {
	return taskId;
}
public void setTaskId(String taskId) {
	this.taskId = taskId;
}
@Override
public String toString() {
	return "TurnClassTaskToTeam [id=" + id + ", teamId=" + teamId + ", acceptTaskTime=" + acceptTaskTime + ", status="
			+ status + ", taskId=" + taskId + "]";
}
public TurnClassTaskToTeam(String id, String teamId, Timestamp acceptTaskTime, String status, String taskId) {
	super();
	this.id = id;
	this.teamId = teamId;
	this.acceptTaskTime = acceptTaskTime;
	this.status = status;
	this.taskId = taskId;
}
public TurnClassTaskToTeam() {
	super();
	// TODO Auto-generated constructor stub
}
 
 
}

package cn.edu.tit.bean;

import java.sql.Timestamp;

/**
 * 
 * @author WENLI
 *考情表
 */
public class Attendance {
	private String attendanceId;
	private String virtualClassNum;
	private Integer index;
	private Timestamp attendanceTime;
	private Integer attendanceNum;
	private Integer totalNum;
	private Integer leaveNum;
	private Integer truancyNum;
	public String getAttendanceId() {
		return attendanceId;
	}
	public void setAttendanceId(String attendanceId) {
		this.attendanceId = attendanceId;
	}
	public String getVirtualClassNum() {
		return virtualClassNum;
	}
	public void setVirtualClassNum(String virtualClassNum) {
		this.virtualClassNum = virtualClassNum;
	}
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public Timestamp getAttendanceTime() {
		return attendanceTime;
	}
	public void setAttendanceTime(Timestamp attendanceTime) {
		this.attendanceTime = attendanceTime;
	}
	public Integer getAttendanceNum() {
		return attendanceNum;
	}
	public void setAttendanceNum(Integer attendanceNum) {
		this.attendanceNum = attendanceNum;
	}
	public Integer getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(Integer totalNum) {
		this.totalNum = totalNum;
	}
	public Integer getLeaveNum() {
		return leaveNum;
	}
	public void setLeaveNum(Integer leaveNum) {
		this.leaveNum = leaveNum;
	}
	public Integer getTruancyNum() {
		return truancyNum;
	}
	public void setTruancyNum(Integer truancyNum) {
		this.truancyNum = truancyNum;
	}
	public Attendance(String attendanceId, String virtualClassNum, Integer index, Timestamp attendanceTime,
			Integer attendanceNum, Integer totalNum, Integer leaveNum, Integer truancyNum) {
		super();
		this.attendanceId = attendanceId;
		this.virtualClassNum = virtualClassNum;
		this.index = index;
		this.attendanceTime = attendanceTime;
		this.attendanceNum = attendanceNum;
		this.totalNum = totalNum;
		this.leaveNum = leaveNum;
		this.truancyNum = truancyNum;
	}
	public Attendance() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Attendance [attendanceId=" + attendanceId + ", virtualClassNum=" + virtualClassNum + ", index=" + index
				+ ", attendanceTime=" + attendanceTime + ", attendanceNum=" + attendanceNum + ", totalNum=" + totalNum
				+ ", leaveNum=" + leaveNum + ", truancyNum=" + truancyNum + "]";
	}
	
}

/**
 * 教师在相应课程中创建的虚拟班级
 */
package cn.edu.tit.bean;

import java.sql.Timestamp;
import java.util.List;

public class VirtualClass {

	private String virtualClassNum; // 班级号
	private String virtualClassName; // 班级名称
	private String creatorId; // 创建者id
	private Timestamp createTime; // 创建时间
	private String virtualClassDetail; // 班级简介
	private Integer courseId; // 课程id
	private String faceImg; // 课程图标
	private List<RealClass> realClassList; // 包含自然班级集合
	
	// setter - getter
	public String getVirtualClassNum() {
		return virtualClassNum;
	}
	public void setVirtualClassNum(String virtualClassNum) {
		this.virtualClassNum = virtualClassNum;
	}
	public String getVirtualClassName() {
		return virtualClassName;
	}
	public void setVirtualClassName(String virtualClassName) {
		this.virtualClassName = virtualClassName;
	}
	public String getCreatorId() {
		return creatorId;
	}
	public void setCreatorId(String creatorId) {
		this.creatorId = creatorId;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public String getVirtualClassDetail() {
		return virtualClassDetail;
	}
	public void setVirtualClassDetail(String virtualClassDetail) {
		this.virtualClassDetail = virtualClassDetail;
	}
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public String getFaceImg() {
		return faceImg;
	}
	public void setFaceImg(String faceImg) {
		this.faceImg = faceImg;
	}
	public List<RealClass> getRealClassList() {
		return realClassList;
	}
	public void setRealClassList(List<RealClass> realClassList) {
		this.realClassList = realClassList;
	}
	@Override
	public String toString() {
		return "VirtualClass [virtualClassNum=" + virtualClassNum + ", virtualClassName=" + virtualClassName
				+ ", creatorId=" + creatorId + ", createTime=" + createTime + ", virtualClassDetail="
				+ virtualClassDetail + ", courseId=" + courseId + ", faceImg=" + faceImg + ", realClassList="
				+ realClassList + "]";
	}
	public VirtualClass(String virtualClassNum, String virtualClassName, String creatorId, Timestamp createTime,
			String virtualClassDetail, Integer courseId, String faceImg, List<RealClass> realClassList) {
		super();
		this.virtualClassNum = virtualClassNum;
		this.virtualClassName = virtualClassName;
		this.creatorId = creatorId;
		this.createTime = createTime;
		this.virtualClassDetail = virtualClassDetail;
		this.courseId = courseId;
		this.faceImg = faceImg;
		this.realClassList = realClassList;
	}
	
	
	
}

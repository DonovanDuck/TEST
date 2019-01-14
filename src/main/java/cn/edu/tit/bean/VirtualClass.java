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
	private String courseId; // 课程id
	private String faceImg; // 班级图标
	private String term; // 班级学期信息
	private Integer classStuentNum; // 班级人数
	private List<RealClass> realClassList; // 包含自然班级集合
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
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getFaceImg() {
		return faceImg;
	}
	public void setFaceImg(String faceImg) {
		this.faceImg = faceImg;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public Integer getClassStuentNum() {
		return classStuentNum;
	}
	public void setClassStuentNum(Integer classStuentNum) {
		this.classStuentNum = classStuentNum;
	}
	public List<RealClass> getRealClassList() {
		return realClassList;
	}
	public void setRealClassList(List<RealClass> realClassList) {
		this.realClassList = realClassList;
	}
	public VirtualClass() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}

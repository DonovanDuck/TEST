package cn.edu.tit.bean;

import java.io.File;

public class Course {

	private String courseId; // 课程id
	private String courseName; // 课程名
	private String courseDetail; // 课程描述
	private String courseCategory; // 课程分类
	private String publisherId; //发布者id
	private File courseImg; // 课程图标
	
	// setter - getter
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseDetail() {
		return courseDetail;
	}
	public void setCourseDetail(String courseDetail) {
		this.courseDetail = courseDetail;
	}
	public String getCourseCategory() {
		return courseCategory;
	}
	public void setCourseCategory(String courseCategory) {
		this.courseCategory = courseCategory;
	}
	public String getPublisherId() {
		return publisherId;
	}
	public void setPublisherId(String publisherId) {
		this.publisherId = publisherId;
	}
	public File getCourseImg() {
		return courseImg;
	}
	public void setCourseImg(File courseImg) {
		this.courseImg = courseImg;
	}
	
	
}

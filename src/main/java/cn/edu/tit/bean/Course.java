package cn.edu.tit.bean;

import java.io.File;

public class Course {

	private Integer courseId; // 课程id
	private String courseName; // 课程名
	private String courseDetail; // 课程描述
	private String courseCategory; // 课程分类
	private String publisherId; //发布者id 
	private String faceImg; // 课程图标
	private String fine;//精选课
	private Integer course_student_num;//课程学生数
	@Override
	public String toString() {
		return "Course [courseId=" + courseId + ", courseName=" + courseName + ", courseDetail=" + courseDetail
				+ ", courseCategory=" + courseCategory + ", publisherId=" + publisherId + ", faceImg=" + faceImg
				+ ", fine=" + fine + ", course_student_num=" + course_student_num + "]";
	}
	public Course(Integer courseId, String courseName, String courseDetail, String courseCategory, String publisherId,
			String faceImg, String fine, Integer course_student_num) {
		super();
		this.courseId = courseId;
		this.courseName = courseName;
		this.courseDetail = courseDetail;
		this.courseCategory = courseCategory;
		this.publisherId = publisherId;
		this.faceImg = faceImg;
		this.fine = fine;
		this.course_student_num = course_student_num;
	}
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
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
	public String getFaceImg() {
		return faceImg;
	}
	public void setFaceImg(String faceImg) {
		this.faceImg = faceImg;
	}
	public String getFine() {
		return fine;
	}
	public Course() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void setFine(String fine) {
		this.fine = fine;
	}
	public Integer getCourse_student_num() {
		return course_student_num;
	}
	public void setCourse_student_num(Integer course_student_num) {
		this.course_student_num = course_student_num;
	}
	
	
}

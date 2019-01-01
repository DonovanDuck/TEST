package cn.edu.tit.bean;

import java.io.File;

import cn.edu.tit.common.MyAnnotation;

public class Teacher {

	@MyAnnotation(columnIndex=0,columnName="教师工号")
	private String ememployeeNum; 
	@MyAnnotation(columnIndex=0,columnName="教师名")
	private String teacherName; 
	@MyAnnotation(columnIndex=0,columnName="教师密码")
	private String teacherPassword; 
	@MyAnnotation(columnIndex=0,columnName="教师性别")
	private String teacherGender; 
	@MyAnnotation(columnIndex=0,columnName="学历")
	private String educationBackground; 
	@MyAnnotation(columnIndex=0,columnName="职称")
	private String professionalTitles; 
	@MyAnnotation(columnIndex=0,columnName="电话")
	private String telephone; 
	@MyAnnotation(columnIndex=0,columnName="电子邮箱")
	private String email;
	@MyAnnotation(columnIndex=0,columnName="教师头像")
	private File faceImg;
	
	// setter - getter
	public String getEmemployeeNum() {
		return ememployeeNum;
	}
	public void setEmemployeeNum(String ememployeeNum) {
		this.ememployeeNum = ememployeeNum;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getTeacherPassword() {
		return teacherPassword;
	}
	public void setTeacherPassword(String teacherPassword) {
		this.teacherPassword = teacherPassword;
	}
	public String getTeacherGender() {
		return teacherGender;
	}
	public void setTeacherGender(String teacherGender) {
		this.teacherGender = teacherGender;
	}
	public String getEducationBackground() {
		return educationBackground;
	}
	public void setEducationBackground(String educationBackground) {
		this.educationBackground = educationBackground;
	}
	public String getProfessionalTitles() {
		return professionalTitles;
	}
	public void setProfessionalTitles(String professionalTitles) {
		this.professionalTitles = professionalTitles;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public File getFaceImg() {
		return faceImg;
	}
	public void setFaceImg(File faceImg) {
		this.faceImg = faceImg;
	}
	
	
}

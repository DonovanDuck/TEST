package cn.edu.tit.bean;

import java.io.File;

public class Teacher {

	private String employeeNum; // 教师工号
	private String teacherName; // 教师名
	private String teacherNickName; // 教师昵称
	private String teacherPassword; // 教师密码
	private String teacherGender; // 教师性别
	private String educationBackground; // 学历
	private String professionalTitles; // 职称
	private String telephone; // 电话
	private String email; // 电子邮箱
	private String faceImg; // 教师头像
	

	// setter - getter
	public String getEmployeeNum() {
		return employeeNum;
	}
	public void setEmployeeNum(String employeeNum) {
		this.employeeNum = employeeNum;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getTeacherNickName() {
		return teacherNickName;
	}
	public void setTeacherNickName(String teacherNickName) {
		this.teacherNickName = teacherNickName;
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
	public String getFaceImg() {
		return faceImg;
	}
	public void setFaceImg(String faceImg) {
		this.faceImg = faceImg;
	}

	@Override
	public String toString() {
		return "Teacher [employeeNum=" + employeeNum + ", teacherName=" + teacherName + ", teacherNickName="
				+ teacherNickName + ", teacherPassword=" + teacherPassword + ", teacherGender=" + teacherGender
				+ ", educationBackground=" + educationBackground + ", professionalTitles=" + professionalTitles
				+ ", telephone=" + telephone + ", email=" + email + ", faceImg=" + faceImg + "]";
	}
	public Teacher(String employeeNum, String teacherName, String teacherNickName, String teacherPassword,
			String teacherGender, String educationBackground, String professionalTitles, String telephone, String email,

			String faceImg) {

		super();
		this.employeeNum = employeeNum;
		this.teacherName = teacherName;
		this.teacherNickName = teacherNickName;
		this.teacherPassword = teacherPassword;
		this.teacherGender = teacherGender;
		this.educationBackground = educationBackground;
		this.professionalTitles = professionalTitles;
		this.telephone = telephone;
		this.email = email;
		this.faceImg = faceImg;
	}
	public Teacher() {
		super();
	}
	
	

}

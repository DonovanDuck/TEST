package cn.edu.tit.bean;


public class Student {

	private String studentId; // 学生学号
	private String studentName; // 学生姓名
	private String nickName; // 昵称
	private String studentGender; // 学生性别
	private String studentPassword; // 学生密码
	private String classNum; // 班级
	private String professional; // 专业
	private String telephone; // 电话
	private String email; // 电子邮件
	private String faceImg; //学生头像
	
	// setter - getter
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentGender() {
		return studentGender;
	}
	public void setStudentGender(String studentGender) {
		this.studentGender = studentGender;
	}
	public String getStudentPassword() {
		return studentPassword;
	}
	public void setStudentPassword(String studentPassword) {
		this.studentPassword = studentPassword;
	}
	public String getClassNum() {
		return classNum;
	}
	public void setClassNum(String classNum) {
		this.classNum = classNum;
	}
	public String getProfessional() {
		return professional;
	}
	public void setProfessional(String professional) {
		this.professional = professional;
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
	public String getNickname() {
		return nickName;
	}
	public void setNickname(String nickName) {
		this.nickName = nickName;
	}
	@Override
	public String toString() {
		return "Student [studentId=" + studentId + ", studentName=" + studentName + ", nickName=" + nickName
				+ ", studentGender=" + studentGender + ", studentPassword=" + studentPassword + ", classNum=" + classNum
				+ ", professional=" + professional + ", telephone=" + telephone + ", email=" + email + ", faceImg="
				+ faceImg + "]";
	}
	public Student(String studentId, String studentName, String nickName, String studentGender, String studentPassword,
			String classNum, String professional, String telephone, String email, String faceImg) {
		super();
		this.studentId = studentId;
		this.studentName = studentName;
		this.nickName = nickName;
		this.studentGender = studentGender;
		this.studentPassword = studentPassword;
		this.classNum = classNum;
		this.professional = professional;
		this.telephone = telephone;
		this.email = email;
		this.faceImg = faceImg;
	}
	
	
}

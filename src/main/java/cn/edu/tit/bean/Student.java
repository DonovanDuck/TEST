package cn.edu.tit.bean;


public class Student {

	private String studentId; // 学生学号
	private String studentName; // 学生姓名
	private String studentNickName; // 学生昵称
	private String studentGender; // 学生性别
	private String studentPassword; // 学生密码
	private String classNum; // 班级
	private String professional; // 专业
	private String telephone; // 电话
	private String email; // 电子邮件
	private String faceImg; //学生头像
	private String status; //学生状态
	private String studentNote; //学生留级后  旧学号
	@Override
	public String toString() {
		return "Student [studentId=" + studentId + ", studentName=" + studentName + ", studentNickName="
				+ studentNickName + ", studentGender=" + studentGender + ", studentPassword=" + studentPassword
				+ ", classNum=" + classNum + ", professional=" + professional + ", telephone=" + telephone + ", email="
				+ email + ", faceImg=" + faceImg + ", status=" + status + ", studentNote=" + studentNote + "]";
	}
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
	public String getStudentNickName() {
		return studentNickName;
	}
	public void setStudentNickName(String studentNickName) {
		this.studentNickName = studentNickName;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStudentNote() {
		return studentNote;
	}
	public void setStudentNote(String studentNote) {
		this.studentNote = studentNote;
	}
	public Student(String studentId, String studentName, String studentNickName, String studentGender,
			String studentPassword, String classNum, String professional, String telephone, String email,
			String faceImg, String status, String studentNote) {
		super();
		this.studentId = studentId;
		this.studentName = studentName;
		this.studentNickName = studentNickName;
		this.studentGender = studentGender;
		this.studentPassword = studentPassword;
		this.classNum = classNum;
		this.professional = professional;
		this.telephone = telephone;
		this.email = email;
		this.faceImg = faceImg;
		this.status = status;
		this.studentNote = studentNote;
	}
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

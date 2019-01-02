package cn.edu.tit.iservice;

import cn.edu.tit.bean.Student;

public interface IStudentService {
	
	/**
	 * @author LiMing
	 * 更新学生信息
	 * */
	public void UpdateStudent(Student student);
	
	/**
	 * @author LiMing
	 * 通过学号登录学生
	 * */
	public Student studentLoginByEmployeeNum(String employeeNum);	
}

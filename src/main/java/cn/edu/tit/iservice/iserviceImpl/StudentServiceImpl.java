package cn.edu.tit.iservice.iserviceImpl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.tit.bean.Student;
import cn.edu.tit.idao.IStudentDao;
import cn.edu.tit.iservice.IStudentService;

/*
 * actor:wenli
 * context:学生Service层实体类
 */
@Service
public class StudentServiceImpl implements IStudentService{
	
	@Autowired
	IStudentDao iStudentDao;
	/**
	 * @author LiMing
	 *@param 学生对象
	 *更新学生信息操作
	 */
	@Override
	public void UpdateStudent(Student student) {
		iStudentDao.UpdateStudent(student);
	}
	
	/**
	 * @author LiMing
	 * 通过学号登录学生
	 * */
	@Override
	public Student studentLoginByEmployeeNum(String employeeNum) {
		return iStudentDao.studentLoginByEmployeeNum(employeeNum);
	}

}

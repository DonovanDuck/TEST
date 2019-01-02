package cn.edu.tit.iservice.iserviceImpl;

import javax.annotation.Resource;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.tit.bean.Student;
import cn.edu.tit.idao.IStudentDao;
import cn.edu.tit.iservice.IStudentService;

/*
 * actor:wenli
 * context:学生Service层实体类
 */
import cn.edu.tit.bean.Accessory;
import cn.edu.tit.bean.Task;
import cn.edu.tit.bean.VirtualClass;

@Service
public class StudentServiceImpl implements IStudentService{

	@Autowired
	IStudentDao studentDao;
	
	@Autowired
	IStudentDao iStudentDao;
	/**
	 * @author LiMing
	 *@param 学生对象
	 *更新学生信息操作
	 */
	@Override
	public void UpdateStudent(Student student) {
		studentDao.UpdateStudent(student);
	}
	
	/**
	 * @author LiMing
	 * 通过学号登录学生
	 * */
	

	@Override
	public Student studentLoginByEmployeeNum(String employeeNum) {
		// TODO Auto-generated method stub
		return studentDao.studentLoginByEmployeeNum(employeeNum);
	}

	@Override
	public Student studentLoginByTelephone(String telephone) {
		// TODO Auto-generated method stub
		return studentDao.studentLoginByTelephone(telephone);
	}

	@Override
	public Student studentLoginByEmail(String email) {
		// TODO Auto-generated method stub
		return studentDao.studentLoginByEmail(email);
	}

	@Override
	public List<String> studentVirtualClassId(String classnum) {
		// TODO Auto-generated method stub
		return studentDao.studentVirtualClassId(classnum);
	}

	@Override
	public List<VirtualClass> studentVirtualClass(List<String> virtualClassNums) {
		// TODO Auto-generated method stub
		return studentDao.studentVirtualClass(virtualClassNums);
	}

	@Override
	public void upTask(String studentId, String taskId, String upTaskDetail) {
		// TODO Auto-generated method stub
		studentDao.upTask(studentId, taskId, upTaskDetail);
		
	}

	@Override
	public void upAccessory(List<Accessory> accessories, String studentId) {
		// TODO Auto-generated method stub
		studentDao.upAccessory(accessories, studentId);
	}

	@Override
	public List<String> searchTaskId(String virtualClassNum) {
		// TODO Auto-generated method stub
		return studentDao.searchTaskId(virtualClassNum);
	}

	@Override
	public List<Task> TaskList(List<String> taskIds) {
		// TODO Auto-generated method stub
		return studentDao.TaskList(taskIds);
	}

	@Override
	public Task searchTask(String taskId) {
		// TODO Auto-generated method stub
		return studentDao.searchTask(taskId);
	}

	@Override
	public Accessory searchAccessory(String taskId) {
		// TODO Auto-generated method stub
		return studentDao.searchAccessory(taskId);
	}

	@Override
	public List<String> searchRealClassNum(String virtualClassNum) {
		// TODO Auto-generated method stub
		return studentDao.searchRealClassNum(virtualClassNum);
	}

	@Override
	public Student searchStudent(String studentId) {
		// TODO Auto-generated method stub
		return studentDao.searchStudent(studentId);
	}

	@Override
	public List<Student> studentList(List<String> classNum) {
		// TODO Auto-generated method stub
		return studentDao.studentList(classNum);
	}

}

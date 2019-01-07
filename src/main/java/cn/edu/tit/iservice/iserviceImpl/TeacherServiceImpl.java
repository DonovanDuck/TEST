package cn.edu.tit.iservice.iserviceImpl;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.edu.tit.bean.Accessory;
import cn.edu.tit.bean.Admin;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Task;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.bean.VirtualClass;
import cn.edu.tit.common.ReadTeacherExcel;
import cn.edu.tit.idao.ITeacherDao;
import cn.edu.tit.iservice.ITeacherService;

/*
 * actor:wenli
 * context:教师service层实体类
 */
@Service
public class TeacherServiceImpl implements ITeacherService{
	@Autowired
	private  ITeacherDao teacherDao ;

	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#createCourse(cn.edu.tit.bean.Course)
	 * @context 创建课程模块
	 * @Param1(课程对象)
	 */
	@Override
	public void createCourse(Course course) {
		teacherDao.createCourse(course);
	}

	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#deleteCourse(java.lang.Integer)
	 * @context 删除课程模块
	 * @Param1(课程ID)
	 */
	@Override
	public void deleteCourse(Integer courseId) {
		// TODO Auto-generated method stub
		teacherDao.deleteCourse(courseId);
	}
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#createVirtualClass(cn.edu.tit.bean.VirtualClass)
	 * @context 创建虚拟班级模块
	 * @Param1(虚拟班级对象)
	 */
	@Override
	public void createVirtualClass(VirtualClass virtualClass) {
		// TODO Auto-generated method stub
		teacherDao.createVirtualClass(virtualClass);

	}
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#updateCourse(cn.edu.tit.bean.Course)
	 * @context 修改班级信息
	 * @Param1(课程对象)
	 */
	@Override
	public void updateCourse(Course course) {
		// TODO Auto-generated method stub
		teacherDao.updateCourse(course);
	}
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#studentList(java.lang.String)
	 * @context 学生列表模块
	 * @Param1(自然班级班号)
	 */
	@Override
	public List<Student> studentList(List<String> classNum) {
		// TODO Auto-generated method stub	
		return teacherDao.studentList(classNum);
	}
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#searchStudent(java.lang.String)
	 * @context 查看单个学生信息
	 * @Param1(学生ID)
	 */
	@Override
	public Student searchStudent(String studentId) {
		// TODO Auto-generated method stub
		return teacherDao.searchStudent(studentId);
	}
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#courseList(java.lang.String)
	 * @context 查询发布者对应的课程列表
	 * @Param1(发布者ID)
	 */
	@Override
	public List<Integer> courseIdList(String employeeNum,Integer manager) {
		// TODO Auto-generated method stub
		return teacherDao.courseIdList(employeeNum,manager);
	}
	
	@Override
	public List<Course> courseList(List<Integer> courseIds) {
		// TODO Auto-generated method stub
		return teacherDao.courseList(courseIds);
	}
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#searchRealClassNum(java.lang.String)
	 * @context 查询虚拟班对应的自然班列表
	 * @Param1(虚拟班班号)
	 */
	@Override
	public List<String> searchRealClassNum(String virtualClassNum) {
		// TODO Auto-generated method stub
		return teacherDao.searchRealClassNum(virtualClassNum);
	}
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#mapVirtualRealClass(java.lang.String, java.lang.String)
	 * @context  映射虚拟班和自然班
	 * @Param1(自然班班号)
	 * @Param2(虚拟班班号)
	 */
	@Override
	public void mapVirtualRealClass(String realClassNum, String virtualClassNUm) {
		// TODO Auto-generated method stub
		teacherDao.mapVirtualRealClass(realClassNum, virtualClassNUm);

	}



	@Override
	public void createTask(Task task) {
		// TODO Auto-generated method stub
		teacherDao.createTask(task);
	}

	@Override
	public void stopTask(String taskId) {
		// TODO Auto-generated method stub
		teacherDao.stopTask(taskId);
	}

	@Override
	public void restartTask(String taskId) {
		// TODO Auto-generated method stub
		teacherDao.restartTask(taskId);
	}

	@Override
	public void restartTaskSetEndTime(String taskId, Timestamp taskEndTime) {
		// TODO Auto-generated method stub
		teacherDao.restartTaskSetEndTime(taskId, taskEndTime);
	}

	@Override
	public void deleteTask(String taskId) {
		// TODO Auto-generated method stub
		teacherDao.deleteTask(taskId);
	}

	@Override
	public void mapClassTask(String virtualClassNum, String taskId) {
		// TODO Auto-generated method stub
		teacherDao.mapClassTask(virtualClassNum, taskId);
	}

	@Override
	public void addAccessory(List<Accessory> accessoris) {
		// TODO Auto-generated method stub
		teacherDao.addAccessory(accessoris);
		
	}

	@Override
	public List<String> searchTaskId(String virtualClassNum) {
		// TODO Auto-generated method stub
		return teacherDao.searchTaskId(virtualClassNum);
	}

	@Override
	public List<Task> TaskList(List<String> taskIds) {
		// TODO Auto-generated method stub
		return teacherDao.TaskList(taskIds);
	}

	@Override
	public Task searchTask(String taskId) {
		// TODO Auto-generated method stub
		return teacherDao.searchTask(taskId);
	}

	@Override
	public Accessory searchAccessory(String taskId) {
		// TODO Auto-generated method stub
		return teacherDao.searchAccessory(taskId);
	}
	@Override
	public void createSignIn(Integer courseId) {
		// TODO Auto-generated method stub
		int signPoint = teacherDao.getSignPoint(); // 获取签到积分
		// 
	}
	@Override
	public void addOtherToMyCourse(String employeeNum) {
		// TODO Auto-generated method stub
		teacherDao.addOtherToMyCourse(employeeNum);
	}

	@Override
	public Integer permissionAddOthers(String employeeNum, Integer courseId) {
		// TODO Auto-generated method stub
		return teacherDao.permissionAddOthers(employeeNum, courseId);
	}

	@Override
	public Teacher teacherLoginByEmployeeNum(String employeeNum) {
		// TODO Auto-generated method stub
		return teacherDao.teacherLoginByEmployeeNum(employeeNum);
	}

	@Override
	public Teacher teacherLoginByTelephone(String telephone) {
		// TODO Auto-generated method stub
		return teacherDao.teacherLoginByTelephone(telephone);
	}

	@Override
	public Teacher teacherLoginByEmail(String email) {
		// TODO Auto-generated method stub
		return teacherDao.teacherLoginByEmail(email);
	}
	
	/**
	 * @author LiMing
	 * @param 教师对象
	 * */
	@Override
	public void UpdateTeacher(Teacher teacher) {
		teacherDao.UpdateTeacher(teacher);
	}

	@Override
	public List<VirtualClass> virtualsForCourse(Integer courseId) {
		// TODO Auto-generated method stub
		return teacherDao.virtualsForCourse(courseId);
	}

	/* (non-Javadoc)
	 * @see cn.edu.tit.iservice.ITeacherService#readCategory()
	 */
	@Override
	public List<Category> readCategory() {
		return teacherDao.readCategory();
	}

}

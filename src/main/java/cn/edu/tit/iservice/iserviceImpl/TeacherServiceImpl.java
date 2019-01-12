package cn.edu.tit.iservice.iserviceImpl;

import java.sql.Timestamp;
import java.util.ArrayList;
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
import cn.edu.tit.bean.RealClass;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Task;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.bean.Term;
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
	public void createCourse(Course course) throws Exception {
		try {
			teacherDao.createCourse(course);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层createCourse出问题");
		}
	}

	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#deleteCourse(java.lang.Integer)
	 * @context 删除课程模块
	 * @Param1(课程ID)
	 */
	@Override
	public void deleteCourse(String courseId)throws Exception {
		// TODO Auto-generated method stub
		try {
			teacherDao.deleteCourse(courseId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层deleteCourse出问题");
		}
	}
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#createVirtualClass(cn.edu.tit.bean.VirtualClass)
	 * @context 创建虚拟班级模块
	 * @Param1(虚拟班级对象)
	 */
	@Override
	public void createVirtualClass(VirtualClass virtualClass)throws Exception {
		// TODO Auto-generated method stub
		try {
			teacherDao.createVirtualClass(virtualClass);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层createVirtualClass出问题");
		}

	}
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#updateCourse(cn.edu.tit.bean.Course)
	 * @context 修改班级信息
	 * @Param1(课程对象)
	 */
	@Override
	public void updateCourse(Course course) throws Exception{
		// TODO Auto-generated method stub
		try {
			teacherDao.updateCourse(course);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层updateCourse出问题");
		}
	}
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#studentList(java.lang.String)
	 * @context 学生列表模块
	 * @Param1(自然班级班号)
	 */
	@Override
	public List<Student> studentList(List<String> classNum) throws Exception{
		// TODO Auto-generated method stub	
		try {
			return teacherDao.studentList(classNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层studentList出问题");
			return null;
		}
	}
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#searchStudent(java.lang.String)
	 * @context 查看单个学生信息
	 * @Param1(学生ID)
	 */
	@Override
	public Student searchStudent(String studentId) throws Exception{
		// TODO Auto-generated method stub
		try {
			return teacherDao.searchStudent(studentId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层searchStudent出问题");
			return null;
		}
	}
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#courseList(java.lang.String)
	 * @context 查询发布者对应的课程列表
	 * @Param1(发布者ID)
	 */
	@Override
	public List<String> courseIdList(String employeeNum,Integer manager)throws Exception {
		// TODO Auto-generated method stub
		try {
			return teacherDao.courseIdList(employeeNum,manager);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层courseIdList出问题");
			return null;
		}
	}
	
	@Override
	public List<Course> courseList(List<String> courseIds) throws Exception{
		// TODO Auto-generated method stub
		try {
			if (!courseIds.isEmpty()) {
				return teacherDao.courseList(courseIds);
			}
			else
				return null;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层courseList出问题");
			return null;
		}
	}
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#searchRealClassNum(java.lang.String)
	 * @context 查询虚拟班对应的自然班列表
	 * @Param1(虚拟班班号)
	 */
	@Override
	public List<String> searchRealClassNum(String virtualClassNum)throws Exception {
		// TODO Auto-generated method stub
		try {
			return teacherDao.searchRealClassNum(virtualClassNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层searchRealClassNum出问题");
			return null;
		}
	}
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#mapVirtualRealClass(java.lang.String, java.lang.String)
	 * @context  映射虚拟班和自然班
	 * @Param1(自然班班号)
	 * @Param2(虚拟班班号)
	 */
	@Override
	public void mapVirtualRealClass(String realClassNum, String virtualClassNUm) throws Exception{
		// TODO Auto-generated method stub
		try {
			teacherDao.mapVirtualRealClass(realClassNum, virtualClassNUm);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层mapVirtualRealClass出问题");
		}

	}



	@Override
	public void createTask(Task task)throws Exception {
		// TODO Auto-generated method stub
		try {
			teacherDao.createTask(task);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层createTask出问题");
		}
		
	}

	@Override
	public void stopTask(String taskId)throws Exception {
		// TODO Auto-generated method stub
		try {
			teacherDao.stopTask(taskId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层stopTask出问题");
		}
	}

	@Override
	public void restartTask(String taskId)throws Exception {
		// TODO Auto-generated method stub
		try {
			teacherDao.restartTask(taskId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层restartTask出问题");
		}
	}

	@Override
	public void restartTaskSetEndTime(String taskId, Timestamp taskEndTime)throws Exception {
		// TODO Auto-generated method stub
		try {
			teacherDao.restartTaskSetEndTime(taskId, taskEndTime);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层restartTaskSetEndTime出问题");
		}
	}

	@Override
	public void deleteTask(String taskId)throws Exception {
		// TODO Auto-generated method stub
		try {
			teacherDao.deleteTask(taskId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层deleteTask出问题");
		}
	}

	@Override
	public void mapClassTask(String virtualClassNum, String taskId) throws Exception{
		// TODO Auto-generated method stub
		try {
			teacherDao.mapClassTask(virtualClassNum, taskId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层mapClassTask出问题");
		}
	}

	@Override
	public void addAccessory(List<Accessory> accessoris)throws Exception {
		// TODO Auto-generated method stub
		try {
			teacherDao.addAccessory(accessoris);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层addAccessory出问题");
		}
		
	}

	@Override
	public List<String> searchTaskId(String virtualClassNum) throws Exception{
		// TODO Auto-generated method stub
		try {
			return teacherDao.searchTaskId(virtualClassNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层searchTaskId出问题");
			return null;
		}
	}

	@Override
	public List<Task> TaskList(List<String> taskIds) throws Exception{
		// TODO Auto-generated method stub
		try {
			return teacherDao.TaskList(taskIds);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层TaskList出问题");
			return null;
		}
	}

	@Override
	public Task searchTask(String taskId)throws Exception {
		// TODO Auto-generated method stub
		try {
			return teacherDao.searchTask(taskId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层searchTask出问题");
			return null;
		}
	}

	@Override
	public List<Accessory> searchAccessory(String taskId) throws Exception{
		// TODO Auto-generated method stub
		try {
			return teacherDao.searchAccessory(taskId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层searchAccessory出问题");
			return null;
		}
	}
	@Override
	public void createSignIn(String courseId) throws Exception{
		// TODO Auto-generated method stub
		int signPoint = teacherDao.getSignPoint(); // 获取签到积分
		// 
	}
	@Override
	public void addOtherToMyCourse(String employeeNum, String courseId,int manager) throws Exception{
		// TODO Auto-generated method stub
		try {
			teacherDao.addOtherToMyCourse(employeeNum,courseId,manager);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层addOtherToMyCourse出问题");
		}
	}

	@Override
	public Integer permissionAddOthers(String employeeNum, String courseId) throws Exception{
		// TODO Auto-generated method stub
		try {
			return teacherDao.permissionAddOthers(employeeNum, courseId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层permissionAddOthers出问题");
			return null;
		}
	}

	@Override
	public Teacher teacherLoginByEmployeeNum(String employeeNum) throws Exception{
		// TODO Auto-generated method stub
	
			System.out.println(employeeNum+"--------");
			Teacher teacher = teacherDao.teacherLoginByEmployeeNum(employeeNum);
			System.out.println(teacher.toString());
			return teacherDao.teacherLoginByEmployeeNum(employeeNum);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			System.out.println("teachDao层teacherLoginByEmployeeNum出问题");
//			return null;
//		}
	}

	@Override
	public Teacher teacherLoginByTelephone(String telephone)throws Exception {
		// TODO Auto-generated method stub
		try {
			return teacherDao.teacherLoginByTelephone(telephone);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层teacherLoginByTelephone出问题");
			return null;
		}
	}

	@Override
	public Teacher teacherLoginByEmail(String email) throws Exception{
		// TODO Auto-generated method stub
		try {
			return teacherDao.teacherLoginByEmail(email);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层teacherLoginByEmail出问题");
			return null;
		}
	}
	
	/**
	 * @author LiMing
	 * @param 教师对象
	 * */
	@Override
	public void UpdateTeacher(Teacher teacher) throws Exception{
		try {
			teacherDao.UpdateTeacher(teacher);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层UpdateTeacher出问题");
		}
	}

	@Override
	public List<VirtualClass> virtualsForCourse(String courseId) throws Exception{
		// TODO Auto-generated method stub
		try {
			return teacherDao.virtualsForCourse(courseId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("teachDao层virtualsForCourse出问题");
			return null;
		}
	}

	@Override
	public Course getCourseById(String courseId) throws Exception{
		// 调用dao
		return teacherDao.searchCourseById(courseId);
	}

	@Override
	public List<Teacher> getTeachersByCourseId(String courseId)throws Exception {
		// 通过课程id获取教师工号
		List<String> employeeNumList = teacherDao.getEmployeeNumByCourseId(courseId);
		//通过教师工号获得教师圈教师集合
		return teacherDao.getTeachersById(employeeNumList);
	}
	
	public Integer searchTaskPoint(String taskCategory) throws Exception {
		// TODO Auto-generated method stub
		return teacherDao.searchTaskPoint(taskCategory);

	}
	/**
	 * @author LiMing
	 * 读取所有分类
	 * */
	@Override
	public List<Category> readCategory() throws Exception {
		List<Category> list = new ArrayList<Category>();
		try {
			list= teacherDao.readCategory();
		} catch (Exception e) {
			e.printStackTrace();
			list =null;
		}
		return list;
	}

	@Override
	public List<Teacher> getTeachers() {
		
		return teacherDao.getTeacher();
	}

	/**
	 * @author LiMing
	 * 根据 分类 查询 课程
	 * */
	@Override
	public List<Course> readCourseInfoByCategory(String category) throws Exception {
		List<Course> list = new ArrayList<Course>();
		try {
			list = teacherDao.readCourseInfoByCategory(category);
			System.out.println("readCourseInfoByCategory-------持久层执行成功");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			list =null;
			System.out.println("readCourseInfoByCategory-------持久层执行失败");
		}
		return list;
	}

	/**
	 * @author LiMing
	 * 通过教师的ID得到教师的名字
	 * */
	@Override
	public String getTeacherNameById(String employeeNum) throws Exception {
		String list = null;
		try {
			list = teacherDao.getTeacherNameById(employeeNum);
			System.out.println("getTeacherNameById-------持久层执行成功");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			list =null;
			System.out.println("getTeacherNameById-------持久层执行失败");
		}
		return list;
	}

	/**
	 * @author LiMing
	 * 读取所有实体班级
	 * */
	@Override
	public List<RealClass> readRealClass(String realClassNum) throws Exception {
		List<RealClass> list = null;
		try {
			list = teacherDao.readRealClass(realClassNum);
			System.out.println("readRealClasss-------持久层执行成功");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			list =null;
			System.out.println("readRealClasss-------持久层执行失败");
		}
		return list;
	}

	/**
	 * @author LiMing
	 * 读取所有课程
	 * */
	@Override
	public List<Course> readCourse(String courseName) throws Exception {
		List<Course> list = new ArrayList<Course>();
		try {
			list =teacherDao.readCourse(courseName);
			System.out.println("readCourse-------持久层执行成功");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			list =null;
			System.out.println("readCourse-------持久层执行失败");
		}
		return list;
	}

	/**
	 * @author LiMing
	 * 读取所有学期
	 * */
	@Override
	public List<Term> readTerm() throws Exception {
		List<Term> list = new ArrayList<Term>();
		try {
			list = teacherDao.readTerm();
			System.out.println("readTerm-------持久层执行成功");
		} catch (Exception e) {
			e.printStackTrace();
			list =null;
			System.out.println("readTerm-------持久层执行失败");
		}
		return list;
	}
	
	/**
	 * @author LiMing
	 * 通过课程ID查询课程信息
	 * */
	@Override
	public Course readCourseByCourseId(String courseId) throws Exception {
		Course course = new Course();
		try {
			course = teacherDao.readCourseByCourseId(courseId);
			System.out.println("readCourseByCourseId-------持久层执行成功");
		} catch (Exception e) {
			e.printStackTrace();
			course =null;
			System.out.println("readCourseByCourseId-------持久层执行失败");
		}		
		return course;
	}
	@Override
	public List<Task> teacherTaskAssortmentList(List<String> taskId, String taskCategory) throws Exception {
		// TODO Auto-generated method stub
		List<Task> taskList = new ArrayList<Task>();
		try {
			taskList = teacherDao.teacherTaskAssortmentList(taskId, taskCategory);
			System.out.println("teacherTaskAssortmentList-------持久层执行成功");
			return taskList;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("teacherTaskAssortmentList-------持久层执行失败");
			return null;
		}
	}


}

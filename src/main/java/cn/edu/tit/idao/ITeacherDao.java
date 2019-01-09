package cn.edu.tit.idao;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.tit.bean.Accessory;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Task;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.bean.VirtualClass;

@Component
public interface ITeacherDao {
	public void createCourse(Course course) throws Exception;	//创建课程模块1
	public void deleteCourse(Integer courseId)throws Exception;	//删除课程模块1
	public void createVirtualClass(VirtualClass virtualClass)throws Exception;		//创建虚拟班级模块1
	public void updateCourse(Course course)throws Exception;	//修改课程模块1
	//public List<Integer> courseIdList(String employeeNum);		//课程id列表模块1，已停用
	public List<Integer> courseIdList(@Param("employeeNum")String employeeNum,@Param("manager")Integer manager)throws Exception;		//课程id列表模块1
	public List<Course>	 courseList(List<Integer> courseIds)throws Exception;	//根据课程ID列表查询课程实体列表1
	public Course searchCourseById(Integer courseId); // 根据courseId查询
	public List<Student> studentList(List<String> classNums)throws Exception;		//学生列表模块1
	public Student searchStudent(String studentId)throws Exception;		//查看学生信息模块1
	public List<String> searchRealClassNum(String virtualClassNum)throws Exception;		//查询虚拟班级对应的自然班列表模块1
	public void mapVirtualRealClass(@Param("realClassNum")String realClassNum,@Param("virtualClassNum")String virtualClassNUm)throws Exception;	//创建虚拟班和自然班映射模块1
	public Teacher teacherLoginByEmployeeNum(String employeeNum)throws Exception;	//通过职工号登录教师
	public Teacher teacherLoginByTelephone(String telephone)throws Exception;	//通过手机号登录教师
	public Teacher teacherLoginByEmail(String email)throws Exception;	//通过邮件登录教师
	public List<VirtualClass> virtualsForCourse(Integer courseId )throws Exception;//根据课程查询虚拟班级1
	public void createSignIn(@Param("taskId")String taskId,@Param("signPoint")String signPoint)throws Exception;	//wei实现
	public Integer getSignPoint()throws Exception; // 获取签到的信息
	public void UpdateTeacher(Teacher teacher)throws Exception;
	
	public void createTask(Task task)throws Exception;	//创建任务1
	public void mapClassTask(@Param("virtualClassNum")String virtualClassNum,@Param("taskId")String taskId)throws Exception;	//1把任务映射到班级任务表中
	
	public void stopTask(String taskId)throws Exception;	//截止任务1
	public void restartTask(String taskId)throws Exception;	//重新启动任务，任务未过期1
	public void restartTaskSetEndTime(@Param("taskId")String taskId,@Param("taskEndTime")Timestamp taskEndTime)throws Exception;	//1重新启动任务，任务过期
	public void deleteTask(String taskId)throws Exception;	//删除任务1
	
	public void addAccessory(List<Accessory> accessoris)throws Exception;	//添加附件1
	
	public List<String> searchTaskId(String virtualClassNum)throws Exception;//查找班级对应的taskid号1
	public List<Task> TaskList(List<String> taskIds)throws Exception;	//显示所有任务列表1
	
	public Task searchTask(String taskId)throws Exception;	//查看单个任务详情1
	public Integer searchTaskPoint(String taskCategory)throws Exception;	//根据任务类型查找分值
	public List<Accessory> searchAccessory(String taskId)throws Exception;	//查询任务附件1
	
	public void addOtherToMyCourse(@Param("employeeNum")String employeeNum,@Param("courseId")String courseId,@Param("manager")int manager )throws Exception;	//拉取别人加入自己课程
	public Integer permissionAddOthers(@Param("employeeNum")String employeeNum,@Param("courseId")Integer courseId)throws Exception;	//判断是否允许加入其他人到自己课程
	public List<String> getEmployeeNumByCourseId(Integer courseId); //通过courseId获得教师工号集合
	public List<Teacher> getTeachersById(List<String> employeeNums); // 通过工号集合获取教师集合
	public String getTeacherNameById(String employeeNum); // 通过工号查询教师名
	public List<Teacher> getTeacher(); //获取所有教师
	/**
	 *@author LiMing
	 * @return
	 */
	public List<Category> readCategory();
}

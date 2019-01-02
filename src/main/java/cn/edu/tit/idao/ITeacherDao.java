package cn.edu.tit.idao;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.tit.bean.Accessory;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Task;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.bean.VirtualClass;

@Component
public interface ITeacherDao {

	public void createCourse(Course course);	//创建课程模块1
	public void deleteCourse(Integer courseId);	//删除课程模块1
	public void createVirtualClass(VirtualClass virtualClass);		//创建虚拟班级模块1
	public void updateCourse(Course course);	//修改课程模块1
	//public List<Integer> courseIdList(String employeeNum);		//课程id列表模块1
	public List<Integer> courseIdList(@Param("employeeNum")String employeeNum,@Param("manager")Integer manager);		//课程id列表模块1
	public List<Course>	 courseList(List<Integer> courseIds);	//根据课程ID列表查询课程实体列表1
	public List<Student> studentList(List<String> classNums);		//学生列表模块1
	public Student searchStudent(String studentId);		//查看学生信息模块1
	public List<String> searchRealClassNum(String virtualClassNum);		//查询虚拟班级对应的自然班列表模块1
	public void mapVirtualRealClass(@Param("realClassNum")String realClassNum,@Param("virtualClassNum")String virtualClassNUm);	//创建虚拟班和自然班映射模块1
	public Teacher teacherLoginByEmployeeNum(String employeeNum);	//通过职工号登录教师
	public Teacher teacherLoginByTelephone(String telephone);	//通过手机号登录教师
	public Teacher teacherLoginByEmail(String email);	//通过邮件登录教师
	public void createTask(Task task);	//创建任务1
	public void stopTask(String taskId);	//截止任务1
	public void restartTask(String taskId);	//重新启动任务，任务未过期1
	public void restartTaskSetEndTime(@Param("taskId")String taskId,@Param("taskEndTime")Timestamp taskEndTime);	//1重新启动任务，任务过期
	public void deleteTask(String taskId);	//删除任务1
	public void mapClassTask(@Param("virtualClassNum")String virtualClassNum,@Param("taskId")String taskId);	//1把任务映射到班级任务表中
	public void addAccessory(List<Accessory> accessoris);	//添加附件1
	public List<String> searchTaskId(String virtualClassNum);//查找班级对应的taskid号1
	public List<Task> TaskList(List<String> taskIds);	//显示所有任务列表1
	public Task searchTask(String taskId);	//查看单个任务详情1
	public Accessory searchAccessory(String taskId);	//查询任务附件1
	public void addOtherToMyCourse(String employeeNum);	//拉取别人加入自己课程
	public Integer permissionAddOthers(@Param("employeeNum")String employeeNum,@Param("courseId")Integer courseId);	//判断是否允许加入其他人到自己课程
}

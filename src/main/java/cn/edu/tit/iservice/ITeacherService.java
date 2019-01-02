package cn.edu.tit.iservice;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import cn.edu.tit.bean.Accessory;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Task;
import cn.edu.tit.bean.VirtualClass;
public interface ITeacherService {
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#createCourse(cn.edu.tit.bean.Course)
	 * @context 创建课程模块
	 * @Param1(课程对象)
	 */
	//public void createCourse(Course course);	//创建课程模块
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#deleteCourse(java.lang.Integer)
	 * @context 删除课程模块
	 * @Param1(课程ID)
	 */
	//public void deleteCourse(Integer courseId);	//删除课程模块
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#createVirtualClass(cn.edu.tit.bean.VirtualClass)
	 * @context 创建虚拟班级模块
	 * @Param1(虚拟班级对象)
	 */
	public void createVirtualClass(VirtualClass virtualClass);		//创建虚拟班级模块
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#updateCourse(cn.edu.tit.bean.Course)
	 * @context 修改班级信息
	 * @Param1(课程对象)
	 */
	//public void updateCourse(Course course);	//修改课程模块
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#courseList(java.lang.String)
	 * @context 查询发布者对应的课程id列表
	 * @Param1(发布者ID)
	 */
	public List<Integer> courseIdList(String employeeNum);		//课程id列表模块
	/**
	 * @author wenli
	 * @param courseIds
	 * @return
	 * 根据课程ID列表查询课程实体列表
	 */
	public List<Course>	 courseList(List<Integer> courseIds);	//根据课程ID列表查询课程实体列表
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#studentList(java.lang.String)
	 * @context 学生列表模块
	 * @Param1(自然班级班号)
	 */
	
	public List<Student> studentList(List<String> classNums);		//学生列表模块
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#searchStudent(java.lang.String)
	 * @context 查看单个学生信息
	 * @Param1(学生ID)
	 */
	public Student searchStudent(String studentId);		//查看学生信息模块
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#searchRealClassNum(java.lang.String)
	 * @context 查询虚拟班对应的自然班列表
	 * @Param1(虚拟班班号)
	 */
	public List<String> searchRealClassNum(String virtualClassNum);		//查询虚拟班级对应的自然班列表模块
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#mapVirtualRealClass(java.lang.String, java.lang.String)
	 * @context  映射虚拟班和自然班
	 * @Param1(自然班班号)
	 * @Param2(虚拟班班号)
	 */
	public void mapVirtualRealClass(String realClassNum,String virtualClassNUm);	//创建虚拟班和自然班映射模块


	/**
	 * @author LiMing
	 * 添加教师信息,通过Excel表导入
	 */
	//public String addTeacherInfo(MultipartFile file);	//创建虚拟班和自然班映射模块
	
	
	/**
	 * @author wenli
	 * @param task
	 * 创建新任务
	 */
	public void createTask(Task task);	//创建任务
	/**
	 * @author wenli
	 * @param taskId
	 * 截止任务
	 */
	public void stopTask(String taskId);	//截止任务
	/**
	 * @author wenli
	 * @param taskId
	 * 如果任务是由于手动截止的，而非到达终止时间而截止，使用此方法修改任务状态即可
	 */
	public void restartTask(String taskId);	//重新启动任务，任务未过期
	/**
	 * @author wenli
	 * @param taskId
	 * @param taskEndTime
	 * 如果任务是由于终止时间而截止，使用此方法重新开始任务
	 */
	public void restartTaskSetEndTime(@Param("taskId")String taskId,@Param("taskEndTime")Timestamp taskEndTime);	//重新启动任务，任务过期
	/**
	 * @author wenli
	 * @param taskId
	 * 删除任务
	 */
	public void deleteTask(String taskId);	//删除任务
	/**
	 * @author wenli
	 * @param virtualClassNum
	 * @param taskId
	 * 把任务映射到班级任务表中
	 */
	public void mapClassTask(String virtualClassNum,String taskId);	//把任务映射到班级任务表中
	/**
	 * @author wenli
	 * @param accessoris
	 * 添加附件
	 */
	public void addAccessory(List<Accessory> accessoris);	//添加附件
	/**
	 * @author wenli
	 * @param virtualClassNum
	 * @return	任务号列表
	 * 查找班级对应的任务号列表
	 */
	public List<String> searchTaskId(String virtualClassNum);//查找班级对应的任务号列表
	/**
	 * @author wenli
	 * @param taskIds
	 * @return	本课程任务列表
	 * 根据任务号列表查询task列
	 */
	public List<Task> TaskList(List<String> taskIds);	//根据任务号列表查询task列
	/**
	 * @author wenli
	 * @param taskId
	 * @return	任务详情
	 * 查看单个任务详情
	 */
	public Task searchTask(String taskId);	//查看单个任务详情
	/**
	 * @author wenli
	 * @param taskId
	 * @return	附件信息
	 * 查询任务附件
	 */
	public Accessory searchAccessory(String taskId);	//查询任务附件
	/**
	 * 开启签到
	 * @param courseId
	 */
	public void createSignIn(Integer courseId);

}

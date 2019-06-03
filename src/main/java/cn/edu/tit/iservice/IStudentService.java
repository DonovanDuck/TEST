package cn.edu.tit.iservice;

import cn.edu.tit.bean.Student;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.tit.bean.Accessory;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Task;
import cn.edu.tit.bean.Term;

import cn.edu.tit.bean.UpTask;
import cn.edu.tit.bean.VirtualClass;

public interface IStudentService {
	public Student studentLoginByEmployeeNum (String employeeNum) throws Exception;	//通过学号登录学生
	public Student studentLoginByTelephone(String telephone) throws Exception;	//通过手机号登录学生
	public Student studentLoginByEmail(String email) throws Exception;	//通过邮件登录学生
	public List<String> studentVirtualClassId(String classnum) throws Exception;		//查询学生所在虚拟班级班级号列表，即班级列表	
	public List<VirtualClass> studentVirtualClass(List<String> virtualClassNums) throws Exception;	//根据虚拟班号列表查询所有虚拟班级实体
	public void upTask(@Param("studentId")String studentId,@Param("taskId")String taskId,@Param("upTaskDetail")String upTaskDetail) throws Exception;	//提交任务


	public List<String> searchTaskId(String virtualClassNum) throws Exception;//查找班级对应的taskid号
	public List<Task> TaskList(List<String> taskIds) throws Exception;	//显示所有任务列表
	public Task searchTask(String taskId) throws Exception;	//查看单个任务详情
	public Accessory searchAccessory(String taskId) throws Exception;	//查询任务附件
	public List<String> searchRealClassNum(String virtualClassNum) throws Exception;		//查询虚拟班级对应的自然班列表模块
	public Student searchStudent(String studentId) throws Exception;		//查看学生信息模块
	public List<Student> studentList(List<String> classNum) throws Exception;	//查询班级学生列表

	public void upTask(UpTask upTask,String virtualClassNum); //提交作业
	public void upAccessory(@Param("accessories")List<Accessory> accessories,@Param("studentId")String studentId) throws Exception;//提交作业中的附件
	public String getUpTaskDetail(String taskId,String studentId);//根据作业号和学号找提交的作业内容
	public List<String> getUpAccessories(String taskId,String studentId);//根据作业号和学号找提交的附件

	/**
	 * @author LiMing
	 * 更新学生信息
	 * */
	public void updateStudent(Student student)  throws Exception;
	/**
	 * @author LiMing
	 * 查询学生课程信息
	 * @param status 当status为1时，加入课程。
	 * @param status 当status为0时，关注课程
	 * @param studentId 学生ID
	 * */
	public List<String> getStudentCourse(String status,String studentId)  throws Exception;
	
	/**
	 * @author LiMing
	 * 查询学生课程信息
	 * @param categoryId 系部ID
	 * */
	public Category getCategoryById(String categoryId)  throws Exception;
	
	/**
	 * 学生关注课程
	 * @param courseId
	 * @param employeeNum
	 */
	public void studentAttentionCourse(String courseId,String studentId);
	
	/**
	 * @param termId
	 * @return 返回学期信息
	 */
	public Term readTermById(String termId);

	/**
	 * 获取标志位，查学生manager
	 * @return
	 */
	public Integer getManagerByStudentId(String studentId, String courseId,int manager);
	
	/**
	 * 取消关注
	 * @param courseId
	 * @param getEmployeeNum
	 */
	public void studentExitAttentionCourse(String courseId, String studentId);
	
	/**
	 * 获取提交的作业内容
	 */
	public UpTask getUpTask(String taskId,String studentId);
	
	/**
	 * 获取提交的作业附件
	 */
	public Accessory getUpAcc(String taskId,String studentId);
	/**
	 * @author WENLI
	 * @param virtualClassNum
	 * @param taskCategory
	 * @return
	 * 查找班级对应任务
	 */
	public Integer getMaxGradeInTask(String taskId);
	/**
	 * @author WENLI
	 * @param virtualClassNum
	 * @param taskCategory
	 * @return
	 * 查找班级对应任务
	 */
	public Integer getMinGradeInTask(String taskId);
	/**
	 * @author WENLI
	 * @param attendanceId
	 * @param studentId
	 * @return
	 * 查看该学生是否签到
	 */
	public Boolean isAttenced(String attendanceId,String studentId);
	/**
	 * @author WENLI
	 * @param attendanceId
	 * @param studentId
	 * @return
	 * 查看该学生是否请假
	 */
	public Boolean isLeaved(String attendanceId,String studentId);
	/**
	 * @author WENLI
	 * @param attendanceId
	 * @param studentId
	 * @return
	 * 查看该学生是否旷课
	 */
	public Boolean isTruancied(String attendanceId,String studentId);
	
	/**
	 * 根据班级号获取课程id
	 * @param virtualClassNum
	 * @return
	 */
	public String getCourseIdByvId(String virtualClassNum);

}

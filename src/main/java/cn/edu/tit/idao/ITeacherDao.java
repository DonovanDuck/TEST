package cn.edu.tit.idao;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.tit.bean.Accessory;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.RealClass;
import cn.edu.tit.bean.Resource;
import cn.edu.tit.bean.ResourceType;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Task;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.bean.Term;
import cn.edu.tit.bean.VirtualClass;

@Component
public interface ITeacherDao {
	public void createCourse(Course course) throws Exception;	//创建课程模块1
	public void deleteCourse(String courseId)throws Exception;	//删除课程模块1
	public void createVirtualClass(VirtualClass virtualClass)throws Exception;		//创建虚拟班级模块1
	public void updateCourse(Course course)throws Exception;	//修改课程模块1
	//public List<Integer> courseIdList(String employeeNum);		//课程id列表模块1，已停用
	public List<String> courseIdList(@Param("employeeNum")String employeeNum,@Param("manager")Integer manager)throws Exception;		//课程id列表模块1
	public List<Course>	 courseList(List<String> courseIds)throws Exception;	//根据课程ID列表查询课程实体列表1
	public Course searchCourseById(String courseId); // 根据courseId查询
	public List<Student> studentList(List<String> classNums)throws Exception;		//学生列表模块1
	public Student searchStudent(String studentId)throws Exception;		//查看学生信息模块1
	public List<String> searchRealClassNum(String virtualClassNum)throws Exception;		//查询虚拟班级对应的自然班列表模块1
	public void mapVirtualRealClass(@Param("realClassNum")String realClassNum,@Param("virtualClassNum")String virtualClassNum)throws Exception;	//创建虚拟班和自然班映射模块1
	public Teacher teacherLoginByEmployeeNum(@Param("employeeNum")String employeeNum)throws Exception;	//通过职工号登录教师
	public Teacher teacherLoginByTelephone(String telephone)throws Exception;	//通过手机号登录教师
	public Teacher teacherLoginByEmail(String email)throws Exception;	//通过邮件登录教师
	public List<VirtualClass> virtualsForCourse(String courseId )throws Exception;//根据课程查询虚拟班级1
	public List<VirtualClass> virtualsForCourseBycreatorId(@Param("courseId")String courseId ,@Param("creatorId")String creatorId)throws Exception;//根据课程和教师id查询虚拟班级1
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
	public List<Task> teacherTaskAssortmentList(@Param("taskIds")List<String> taskId,@Param("taskCategory")String taskCategory)throws Exception;//根据不同任务类型显示作业列表
	
	public Task searchTask(String taskId)throws Exception;	//查看单个任务详情1
	public Integer searchTaskPoint(String taskCategory)throws Exception;	//根据任务类型查找分值
	public List<Accessory> searchAccessory(String taskId)throws Exception;	//查询任务附件1
	
	public void addOtherToMyCourse(@Param("employeeNum")String employeeNum,@Param("courseId")String courseId,@Param("manager")int manager )throws Exception;	//拉取别人加入自己课程
	public Integer permissionAddOthers(@Param("employeeNum")String employeeNum,@Param("courseId")String courseId)throws Exception;	//判断是否允许加入其他人到自己课程
	public List<String> getEmployeeNumByCourseId(String courseId); //通过courseId获得教师工号集合
	public List<Teacher> getTeachersById(List<String> employeeNums); // 通过工号集合获取教师集合
	
	public String getTeacherNameById(String employeeNum); // 通过工号查询教师名
	
	public List<Teacher> getTeacher(); //获取所有教师
	/**
	 *@author LiMing
	 * @return
	 */
	public List<Category> readCategory();
	
	/**
	 *@author LiMing
	 * @param category
	 * @return 根据分类查询课程
	 */
	public List<Course> readCourseInfoByCategory(String category);

	/**
	 *@author LiMing
	 * @param realClassNum 
	 * @return
	 * 查询所有实体班级
	 */
	public List<RealClass> readRealClass(@Param(value="realClassNum")String realClassNum);
	
	/**
	 *@author LiMing
	 * @return
	 * 读取所有课程信息
	 */
	public List<Course> readCourse(@Param(value="courseName")String courseName);
	
	/**
	 *@author LiMing
	 * @return 返回学期列表
 	 */
	public List<Term> readTerm();
	
	/**
	 *@author LiMing
	 * @param courseId
	 * @return
	 */
	public Course readCourseByCourseId(String courseId);
	
	/**
	 * 根据学生的自然班级号查虚拟班级号
	 * @return
	 */
	public List<String> getVirtualNumByreal(String realClassNum);
	/**
	 * 根据虚拟班号查虚拟班
	 * @param virtualClassNum
	 * @return
	 */
	public VirtualClass getVirtualById(String virtualClassNum);
	
	/**
	 * 通过学生id获取自然班级号
	 * @param studentId
	 * @return
	 */
	public String getrealClassNumBySid(String studentId);
	
	/**
	 * 通过id获取用户关注的课程id集合
	 * @param id
	 * @return
	 */
	public List<String> getAttentionCid(String id);
	
	/**
	 * 获取教师加入的课程的id
	 * @return
	 */
	public List<String> getJoinCourseByTid(String employeeNum);
	
	/**
	 * 通过课程id和教师工号获取相关班级
	 * @param courseId
	 * @param employeeNum
	 * @return
	 */
	public List<VirtualClass> getClassById(@Param(value="courseId") String courseId, @Param(value="employeeNum") String employeeNum);
	/**
	 * @author wenli
	 * @param creatorId
	 * @return
	 * 根据创建者Id获得他创建的所有班级列表
	 */
	public List<VirtualClass> getVirtualClassByCreatorId(String creatorId);
	/**
	 * 通过虚拟班级号查课程id
	 * @param virtualClassNum
	 * @return
	 */
	public String getCourseIdByVirtualId(String virtualClassNum);
	public List<String> getTaskCategory();
	

	/**
	 * 通过课程名查课程
	 * @param courseName
	 * @return
	 */
	public Course searchCourseByName(String courseName);
	
	/**
	 * 通过班级名查班级
	 */
	public VirtualClass searchClassByName(String virtualClassName);
	
	/**
	 * 根据自然班级id查询
	 * @param realClassNum
	 * @return
	 */
	public RealClass searchRealClassById(String realClassNum);
	/**
	 * @author wenli
	 * @param virtualClassNum
	 * @return
	 * 根据虚拟班级号找到所对应的实体班级号列表
	 */
	public List<String> searchRealClassIdList(String virtualClassNum);
	/**
	 * 根据id查图片
	 * @param courseId
	 * @return
	 */
	public String getImgpathByCourseId(String courseId);
	
	/**
	 * @author LiMing
	 * @return 返回资源分类信息
	 * 查询 资源 分类的信息,分了几种类，只返回类型ID
	 * */
	
	public List<ResourceType> readResourceCategoried();
	/**
	 * @author wenli
	 * @param resourceTye
	 * @return
	 * 返回当前资源的id号
	 */
	public int getResourceTypeId(String resourceTye)throws Exception;
	/**
	 * @author wenli
	 * @param resource
	 * 创建资源
	 */
	public void addResource(Resource resource)throws Exception;
	
	
	
	/**
	 * 获取标志位，查老师是否是课程创建者
	 * @return
	 */
	public Integer getManagerByEmployeeNum(@Param(value="employeeNum")String employeeNum, @Param(value="courseId")String courseId,@Param(value="manager")int manager);
	
	/**
	 * 根据时间获取前十二个课程信息到首页
	 * @return
	 */
	public List<Course> getCourseByLimit();
	/**
	 * 根据类型id查类型
	 * @param categoryId
	 * @return
	 */
	public String getCategoryById(String categoryId);
	
	/**
	 * 教师关注课程
	 * @param courseId
	 * @param employeeNum
	 */
	public void teacherAttentionCourse(@Param(value="courseId")String courseId,@Param(value="employeeNum")String employeeNum);
	
	/**
	 * 通过虚拟班级号和自然班级号查对应的虚拟班级号
	 * （方法中多个虚拟班级号循环遍历，结果集只有一个）
	 * @return
	 */
	public String getVirtualClassNumByVidAndRid(@Param(value="realClassNum")String realClassNum,@Param(value="virtualClassNum")String virtualClassNum);
	
	/**
	 * 取消关注
	 * @param courseId
	 * @param getEmployeeNum
	 */
	public void teacherExitAttentionCourse(@Param(value="courseId")String courseId, @Param(value="employeeNum")String employeeNum);

	/**
	 *@author LiMing
	 * @param search
	 * @return
	 */
	public List<Course> searchCourse(@Param(value="courseName")String courseName);
	
	
	/**
	 *@author LiMing
	 * @param realClass
	 * @return 实体班级的集合
	 * 实体班级的模糊查询
	 */
	public List<RealClass> readRealClassToSelect(@Param(value="realClass")String realClass);
	
	/**
	 * 通过教师工号模糊查找教师列表
	 * @param employeeNum
	 * @return
	 */
	public List<Teacher> vagueSearchTeachers(String employeeNum);

	 /**@author LiMing
	 * @param 任务分类
	 * @return 返回任务列表
	 * 根据任务类型和课程查询该课程下的任务
	 */
	public List<Task> getTaskByPointAndCourse(@Param(value="taskCategory")String taskCategory,@Param(value="courseId")String courseId);
}


package cn.edu.tit.iservice;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import cn.edu.tit.bean.Accessory;

import cn.edu.tit.bean.Achievement;
import cn.edu.tit.bean.Attendance;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.IndustryUniversityResearchProject;
import cn.edu.tit.bean.Paper;
import cn.edu.tit.bean.Prize;

import cn.edu.tit.bean.RealClass;
import cn.edu.tit.bean.Resource;
import cn.edu.tit.bean.ResourceType;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Task;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.bean.TeacherProject;
import cn.edu.tit.bean.Term;
import cn.edu.tit.bean.UpTask;
import cn.edu.tit.bean.VirtualClass;
public interface ITeacherService {
	public List<Prize> prizeList();
	public List<TeacherProject> teacherProjectList();
	public List<IndustryUniversityResearchProject> industryUniversityResearchProjectList();
	public List<Achievement> achievementList();
	public List<Paper> paperList();
	/**
	 * @author wenli
	 * @param virtualClassNum
	 * @return
	 * 根据虚拟班级号找到所对应的实体班级号列表
	 */
	public List<String> searchRealClassIdList(String virtualClassNum);
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#createCourse(cn.edu.tit.bean.Course)
	 * @context 创建课程模块
	 * @Param1(课程对象)
	 */
	public void createCourse(Course course)throws Exception;	//创建课程模块
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#deleteCourse(java.lang.Integer)
	 * @context 删除课程模块
	 * @Param1(课程ID)
	 */
	public void deleteCourse(String courseId)throws Exception;	//删除课程模块
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#createVirtualClass(cn.edu.tit.bean.VirtualClass)
	 * @context 创建虚拟班级模块
	 * @Param1(虚拟班级对象) 
	 */
	public void createVirtualClass(VirtualClass virtualClass)throws Exception;		//创建虚拟班级模块
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#updateCourse(cn.edu.tit.bean.Course)
	 * @context 修改班级信息
	 * @Param1(课程对象)
	 */
	public void updateCourse(Course course)throws Exception;	//修改课程模块
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#courseList(java.lang.String)
	 * @context 查询发布者对应的课程id列表
	 * @Param1(发布者ID)
	 */
	public List<String> courseIdList(String employeeNum,Integer manager)throws Exception;		//课程id列表模块
	/**
	 * @author wenli
	 * @param courseIds
	 * @return
	 * 根据课程ID列表查询课程实体列表
	 */
	public List<Course>	 courseList(List<String> courseIds)throws Exception;	//根据课程ID列表查询课程实体列表


	/**
	 * 根据courseid查课程
	 * @param courseId
<<<<<<< HEAD
<<<<<<< HEAD
	 * @return 返回课程信息（注意：数据库中存储为分类ID，但是读取过程中修改为分类名）
=======
	 * @return
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
=======
	 * @return 返回课程信息（注意：数据库中存储为分类ID，但是读取过程中修改为分类名）
>>>>>>> 8b686c47d14ac368571e08f4b308c03cc9fa9818
	 */
	public Course getCourseById(String courseId)throws Exception;
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#studentList(java.lang.String)
	 * @context 学生列表模块
	 * @Param1(自然班级班号)
	 */

	public List<Student> studentList(List<String> classNums)throws Exception;		//学生列表模块
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#searchStudent(java.lang.String)
	 * @context 查看单个学生信息
	 * @Param1(学生ID)
	 */
	public Student searchStudent(String studentId)throws Exception;		//查看学生信息模块
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#searchRealClassNum(java.lang.String)
	 * @context 查询虚拟班对应的自然班列表
	 * @Param1(虚拟班班号)
	 */
	public List<String> searchRealClassNum(String virtualClassNum)throws Exception;		//查询虚拟班级对应的自然班列表模块
	/**
	 * @author wenli
	 * @see cn.edu.tit.iservice.ITeacherService#mapVirtualRealClass(java.lang.String, java.lang.String)
	 * @context  映射虚拟班和自然班 插入
	 * @Param1(自然班班号)
	 * @Param2(虚拟班班号)
	 */
	public void mapVirtualRealClass(String realClassNum,String virtualClassNum)throws Exception;	//创建虚拟班和自然班映射模块

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
	public void createTask(Task task)throws Exception;	//创建任务
	/**
	 * @author wenli
	 * @param taskId
	 * 截止任务
	 */
	public void stopTask(String taskId)throws Exception;	//截止任务
	/**
	 * @author wenli
	 * @param taskId
	 * 如果任务是由于手动截止的，而非到达终止时间而截止，使用此方法修改任务状态即可
	 */
	public void restartTask(String taskId)throws Exception;	//重新启动任务，任务未过期
	/**
	 * @author wenli
	 * @param taskId
	 * @param taskEndTime
	 * 如果任务是由于终止时间而截止，使用此方法重新开始任务
	 */
	public void restartTaskSetEndTime(@Param("taskId")String taskId,@Param("taskEndTime")Timestamp taskEndTime)throws Exception;	//重新启动任务，任务过期
	/**
	 * @author wenli
	 * @param taskId
	 * 删除任务
	 */
	public void deleteTask(String taskId)throws Exception;	//删除任务
	/**
	 * @author wenli
	 * @param virtualClassNum
	 * @param taskId
	 * 把任务映射到班级任务表中
	 */

	public void mapClassTask(String virtualClassNum,String taskId,Timestamp taskEndTime)throws Exception;	//把任务映射到班级任务表中
	/**
	 * @author wenli
	 * @param accessoris
	 * 添加附件
	 */
	public void addAccessory(List<Accessory> accessoris)throws Exception;	//添加附件
	/**
	 * @author wenli
	 * @param virtualClassNum
	 * @return	任务号列表
	 * 查找班级对应的任务号列表
	 */
	public List<String> searchTaskId(String virtualClassNum)throws Exception;//查找班级对应的任务号列表
	/**
	 * @author wenli
	 * @param taskIds
	 * @return	本课程任务列表
	 * 根据任务号列表查询task列
	 */
	public List<Task> TaskList(List<String> taskIds)throws Exception;	//根据任务号列表查询task列
	/**
	 * @author wenli
	 * @param taskId
	 * @param taskCategory
	 * @return
	 * @throws Exception
	 * 根据任务类别查找任务列
	 */
	public List<Task> teacherTaskAssortmentList(List<String> taskId,String taskCategory)throws Exception;
	/**
	 * @author wenli
	 * @param taskId
	 * @return	任务详情
	 * 查看单个任务详情
	 */

	public Task searchTask(String taskId)throws Exception;	//查看单个任务详情
	/**
	 * @author wenli
	 * @param taskId
	 * @return	附件信息
	 * 查询任务附件
	 */
	public List<Accessory> searchAccessory(String taskId)throws Exception;	//查询任务附件
	/**
	 * 开启签到
	 * @param courseId
	 */
	public void createSignIn(String courseId)throws Exception;
	/**
	 * @author LiMing
	 * @param 教师对象，用作更新教师信息
	 */
	public void UpdateTeacher(Teacher teacher)throws Exception;	//查询任务附件

	/**
	 * @author wenli
	 * @param employeeNum
	 * @throws Exception
	 * 拉去别人进入自己课程
	 */
	public void addOtherToMyCourse(String employeeNum, String CourseId, int manager)throws Exception;	//拉取别人加入自己课程

	/**
	 * @author wenli
	 * @param employeeNum
	 * @param courseId
	 * @return
	 * @throws Exception
	 * 判断是否允许拉取其他人到自己课程
	 */
	public Integer permissionAddOthers(@Param("employeeNum")String employeeNum,@Param("courseId")String courseId)throws Exception;	//判断是否允许加入其他人到自己课程

	/**
	 * @author wenli
	 * @param employeeNum
	 * @return
	 * @throws Exception
	 * 通过职工号登录教师
	 */
	public Teacher teacherLoginByEmployeeNum(String employeeNum)throws Exception;	//通过职工号登录教师

	/**
	 * @author wenli
	 * @param telephone
	 * @return
	 * @throws Exception
	 * 通过手机号登录教师
	 */
	public Teacher teacherLoginByTelephone(String telephone)throws Exception;	//通过手机号登录教师
	/**
	 * @author wenli
	 * @param email
	 * @return
	 * @throws Exception
	 * 通过邮箱登录教师
	 */
	public Teacher teacherLoginByEmail(String email)throws Exception;	//通过邮件登录教师

	/**
	 * @author wenli
	 * @param courseId
	 * @return
	 * @throws Exception
	 * 根据课程查询虚拟班级
	 */
	public List<VirtualClass> virtualsForCourse(String courseId )throws Exception;//根据课程查询虚拟班级
	/**
	 * @author wenli
	 * @param courseId
	 * @param creatorId
	 * @return
	 * @throws Exception
	 * 根据课程和教师id查询虚拟班级
	 */
	public List<VirtualClass> virtualsForCourseBycreatorId(String courseId ,String creatorId)throws Exception;//根据课程和教师id查询虚拟班级1


	/**
	 * 通过courseId查教师圈的老师列表
	 * @param courseId
	 * @return
	 */
	public List<Teacher> getTeachersByCourseId(String courseId);
	/**
	 * @author wenli
	 * @param creatorId
	 * @return
	 * 根据创建者Id获得他创建的所有班级列表
	 */
	public List<VirtualClass> getVirtualClassByCreatorId(String creatorId);

	/**
	 * @author wenli
	 * @param taskCategory
	 * @return
	 * @throws Exception
	 */
	public Integer searchTaskPoint(String taskCategory)throws Exception;	//根据任务类型查找分值

	/**
	 * 查询所有系部
	 * @author LiMing
	 * @return
	 * @throws Exception
	 */
	public List<Category> readCategory() throws Exception;

	/**
	 * 获取所有教师
	 * @return
	 */
	public List<Teacher> getTeachers();

	/**
	 * 
	 * @param category
	 * @return
	 * @throws Exception
	 */
	public List<Course> readCourseInfoByCategory(String category) throws Exception;

	/**
	 * @author LiMing
	 * @param employeeNum
	 * @return
	 * @throws Exception
	 */
	public String getTeacherNameById(String employeeNum)throws Exception; 

	/**
	 * @author LiMing
	 * @param 条件查找的参数
	 * @throws Exception
	 * 查找实体班级信息,当参数不为空时，为条件查找,按照班号查找班级信息
	 */
	public List<RealClass> readRealClass(String realClassNum)throws Exception; 

	/**
	 *@author LiMing
	 * @return
	 * 读取课程
	 *  当Course 为空时，读取全部课程
	 *  当Course 不是空时，按照课程名查找课程,当为此情况，则取集合中第一个对象
	 */
	public List<Course> readCourse(String courseName)throws Exception;

	/**
	 *@author LiMing
	 * @return
	 * 读取课程
	 *  当Course 为空时，读取全部课程
	 *  当Course 不是空时，按照课程名查找课程
	 */
	public Course readCourseByCourseId(String courseId)throws Exception;

	/**
	 *@author LiMing
	 * @return
	 *读取学期
	 */
	public List<Term> readTerm()throws Exception;

	/**
	 * 通过学生的自然班级号查其所在的虚拟班级
	 * @param realClassNum
	 * @return
	 * @throws Exception 
	 */
	public List<VirtualClass> getVirtualClassNumByreal(String realClassNum) throws Exception;

	/**
	 * 通过学生id获取自然班级号
	 * @param studentId
	 * @return
	 * @throws Exception 
	 */
	public String getrealClassNumBySid(String studentId) throws Exception;

	/**
	 * 获取用户关注课程
	 * @return
	 * @throws Exception 
	 */
	public List<Course> getAttentionCourse(String id) throws Exception;

	/**
	 * 获取所有课程中教师创建的班级
	 * @param employeeNum
	 * @return
	 * @throws Exception 
	 */
	public List<VirtualClass> getTeacherCreateClass(String employeeNum) throws Exception;

	/**
	 * 通过学生所在的自然班级号得到其所参与课程列表
	 * @param realClassNum
	 * @return
	 * @throws Exception 
	 */
	public List<Course> getStudentJoinCourseByrealNum(String realClassNum) throws Exception;


	/**
	 * 通过课程名查课程
	 * @param courseName
	 * @return
	 */
	public Course getCourseByName(String courseName);

	/**
	 * 通过班级名查班级
	 * @param virtualClassName
	 * @return
	 */
	public VirtualClass getClassByName(String virtualClassName);

	/**
	 * 根据虚拟班级id获取自然班级列表
	 * @param virtualClassNum
	 * @return
	 */
	public List<RealClass> getRealClassList(String virtualClassNum);
	/**
	 * 根据courseId查路径
	 * @param courseId
	 * @return
	 */
	public String getImgpathByCourseId(String courseId);
	/**
	 * @author wenli
	 * @return
	 * 查询任务分类
	 */
	public List<String> getTaskCategory()throws Exception;
	/**
	 *@author LiMing
	 * @return 分类ID集合
	 * 查询 资源 分类的信息,分了几种类，只返回类型ID
	 * @throws Exception 
	 */
	public List<ResourceType> readResourceCategoried() throws Exception;
	/**
	 * @author wenli
	 * @param resourceTye
	 * @return
	 * 返回当前资源的id号
	 */
	public int getResourceTypeId(String resourceTye)throws Exception;

	/**
	 * @author LiMing
	 * @param 添加的资源
	 * */
	public void addResource(Resource resource)throws Exception;

	public void updateResource(Resource re);

	/**
	 * 获取标志位，查老师manager
	 * @return
	 */
	public Integer getManagerByEmployeeNum(String employeeNum, String courseId,int manager);




	/**
	 * @author wenli
	 * 根据虚拟班号查虚拟班
	 * @param virtualClassNum
	 * @return
	 */
	public VirtualClass getVirtualById(String virtualClassNum);

	/**
	 * 根据时间获取前8个课程信息到首页
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
	public void teacherAttentionCourse(String courseId,String employeeNum);

	/**
	 * 根据学生自然班id和课程id查询所在虚拟班信息
	 * @param studentId
	 * @return
	 */
	public VirtualClass getVirtualClassByRidAndCid(String realClassNum, String courseId);


	/**
	 * 取消关注
	 * @param courseId
	 * @param getEmployeeNum
	 */
	public void teacherExitAttentionCourse(String courseId, String getEmployeeNum);

	/**@author LiMing
	 * @param 课程名
	 * @return 返回查询到的课程信息
	 * 课程二级页面的搜索功能，模糊查询
	 */
	public List<Course> searchCourse(String courseName);

	/**
	 *@author LiMing
	 * @param realClass
	 * @return 实体班级的集合
	 * 实体班级的模糊查询
	 */
	public List<RealClass> readRealClassToSelect(String realClass);

	/**
	 * 通过教师工号模糊查找教师列表
	 * @param employeeNum
	 * @return
	 */
	public List<Teacher> vagueSearchTeachers(String employeeNum);


	/**@author LiMing
	 * @param 任务分类
	 * @param 课程ID
	 * @return 返回任务列表
	 * 根据任务类型和课程查询该课程下的任务
	 * 类型有（暂时2019.02.15）
	 *   work  作业   
	 * 	 trial  实验
	 */
	public List<Task> getTaskByPointAndCourse(String taskCategory,String courseId);

	/**
	 * @author wenli
	 * @return
	 * 获得已提交作业的所有学生
	 */
	public List<Student> getStudentListOfUped(String taskId,String virtualClassNum);
	/**
	 * @author wenli
	 * @param taskId
	 * @return
	 * 获得未提交作业的所有学生
	 */
	public List<Student> getStudentListOfNotUp(String taskId,String virtualClassNum)throws Exception;
	public List<Student> getStudentList(String virtualClassNum);
	/**
	 * @author wenli
	 * @param virtualClassNum
	 * @param taskId
	 * @return
	 * 获取虚拟班中已经提交作业的人数
	 */
	public Integer getUpNum(String virtualClassNum,String taskId);
	/**
	 * @author wenli
	 * @param comment
	 * @param grade
	 * 设置作业的评语和分数
	 */
	public void setGradeAndComment(String comment,Integer grade,String studentId,String taskId,Timestamp commentTime);
	/**
	 * @author wenli
	 * @param taskId
	 * @param studentId
	 * @return
	 * 获得学生作业的分数
	 */
	public Integer getGrade(String taskId,String studentId);
	/**
	 * @author WENLI
	 * @param taskId
	 * @param studentId
	 * @return
	 * 获得学生提交任务详情
	 */
	public UpTask getUpTask(String taskId,String studentId);
	/**
	 * @author wenli
	 * @param taskId
	 * @param studentId
	 * @return
	 * 获得学生作业的评语
	 */
	public String getComment(String taskId,String studentId);
	/**
	 * @author WENLI
	 * @param courseId
	 * @param taskCategory
	 * @return
	 * 用于教师选择发布作业模块，根据课程和类型查找作业
	 */
	public List<Task> getTaskListPage(String courseId,String taskCategory);
	/**
	 * @author WENLI
	 * @param VirtualClassNum
	 * @param taskId
	 * @return
	 * 在class_task表中获得任务截至时间
	 */
	public Timestamp getTaskEndTime(String virtualClassNum,String taskId);
	/**
	 * @author WENLI
	 * @param taskId
	 * 当以选择形式发布作业时，作业watchnum为虚拟班级人数
	 */
	public void addUseNum(String taskId);
	public void addWatchNum(String taskId,int taskSumNum);
	public Term getTermById(String term);

	/**
	 * 关于教师Id的模糊查询
	 * */
	public List<Teacher> teacherForFuzzyQueryById(String teacherNum);

	/**
	 * @author WENLI
	 * @param virtualClassNum
	 * @param taskCategory
	 * @return
	 * 获得这个任务在该班级发布过几次
	 */
	public int gettaskTypePublishNum(String virtualClassNum,String taskCategory);
	/**
	 * @author WENLI
	 * @param virtualClassNum
	 * @param taskCategory
	 * @return
	 */
	public Integer getStudentGrade(String studentId,String virtualClassNum,String taskCategory);
	/**
	 * @author WENLI
	 * @param virtualClassNum
	 * @param taskCategory
	 * @return
	 */
	public Integer getStudentGradeNum(String studentId,String virtualClassNum,String taskCategory);

	/**
	 * 获得所有任务
	 */
	public List<Task> getAllTask();

	/**
	 * 获取老师所有发布的任务
	 * @param userId
	 * @return
	 */
	public	List<Task> getTaskByUserId(String userId);

	/**
	 * @author WENLI
	 * @param virtualClassNum
	 * @return
	 * 获得该班级所有考勤信息
	 */
	public List<Attendance> getAttendanceDetail(String virtualClassNum);
	/**
	 * @author WENLI
	 * @param attendanceId
	 * @return
	 * 获得请假的学生实体
	 */
	public List<Student> getLeaveStudent(String attendanceId);
	/**
	 * @author WENLI
	 * @param attendanceId
	 * @return
	 * 获得旷课的学生实体
	 */
	public List<Student> getTruancyStudent(String attendanceId);
	/**
	 * @author WENLI
	 * @param virtualClassNum
	 * @param taskCategory
	 * @return
	 * 获得指定类型的班级任务
	 */
	public List<Task> getTaskByCategory(String virtualClassNum,String taskCategory);

	/**
	 * 获取任务引用次数--虚拟班级人数
	 * @param virtualClassNum
	 * @return
	 */
	public int getTaskUserNum(String virtualClassNum);
	

	/**
	 * 获得已打卡的学生
	 * @param virtualClassNum
	 * @return
	 */
	public List<Student> getStuAttended(String attendanceId);
	
	/**
	 * 获取某个班最近一次打卡是第几次
	 * @param virtualClassNum
	 * @return
	 */
	public Integer getLastAttIndex(String virtualClassNum);
	
	/**
	 * 添加打卡
	 * @param att
	 */
	public void addAttendance(Attendance att);
	
	/**
	 * 通过id获取任务
	 * @param taskId
	 * @return
	 */
	public Task getTaskById(String taskId);
	
	/**
	 * 修改任务
	 * @param task
	 */
	public void updateTask(Task task);
	
	/**
	 * 修改任务附件
	 * @param acc
	 */
	public void updateAccessory(List<Accessory> acc);
	

	public List<Course> getAllCourse();
	public List<Course> queryCourseByPartName(String courseName);
	
	/**
	 * 修改课程学生人数
	 * @param count
	 * @param courseId
	 */
	public void updateCourseStudentNum(Integer count,String courseId);
	
	/**
	 * 学生打卡
	 */
	public void attend(String studentId,String attendanceId,Timestamp atttime);
	
	/**
	 * 获取所有打卡记录
	 * @return
	 */
	public List<Attendance> getALLAtt();
	
	/**
	 * 查询某学生是否有此打卡记录
	 * @param studentId
	 * @param attendanceId
	 * @return
	 */
	public String getAttRecordById(String studentId,String attendanceId);
	
	/**
	 * 设置缺勤
	 * @param studentId
	 * @param tid
	 */
	public void setTruancy(String studentId, String tid);
	
	/**
	 * 设置请假
	 * @param studentId
	 * @param tid
	 */
	public void setLeave(String studentId, String tid);
	
	
	/**
	 * 获取打卡时间
	 * @param studentId
	 * @param attendanceId
	 * @return
	 */
	public String getAttTime(String studentId,String attendanceId);
	
	/**
	 * 判断班级是否有为结束的打卡
	 * @param virtualClassNum
	 * @return
	 */
	public boolean isAttend(String virtualClassNum);
	
	/**
	 * 教师关闭打卡
	 * @param attendanceId
	 */
	public void endAttendance(String attendanceId);
	
	/**
	 * 获取当前打卡id
	 * @return
	 */
	public String getCurrentAttend(String virtualClassNum);
	
	/**
	 * 开启打卡时所有学生默认缺勤
	 */
	public void stuSetTruancy();
	
	/**
	 * 获得请假的学生列表
	 * @return
	 */
	public List<Student> getStuLeaveList(String attendanceId);
	
	/**
	 * 获得缺勤的学生列表
	 * @return
	 */
	public List<Student> getStuTruancyList(String attendanceId);
	
}

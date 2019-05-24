package cn.edu.tit.controller.wxController;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

import cn.edu.tit.bean.Accessory;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.RealClass;
import cn.edu.tit.bean.Resource;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Task;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.bean.Term;
import cn.edu.tit.bean.UpTask;
import cn.edu.tit.bean.VirtualClass;
import cn.edu.tit.common.Common;
import cn.edu.tit.iservice.IResourceService;
import cn.edu.tit.iservice.IStudentService;
import cn.edu.tit.iservice.ITeacherService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 提供给微信的接口
 * 
 * @author 20586
 *
 */
@RequestMapping("WxTeacherController")
@RestController
public class WxTeacherController {

	@Autowired
	private ITeacherService teacherService;

	@Autowired
	private IStudentService studentService;
	@Autowired
	private IResourceService resourceService;

	/**
	 * 微信端登录
	 * 
	 * @param request
	 * @param userId
	 * @param password
	 */
	@RequestMapping(value = "userLogin")
	public Map<String, Object> userLogin(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "id", required = false) String userid,
			@RequestParam(value = "password", required = false) String password) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Map<String, Object> ret = new HashMap<String, Object>();
		response.setContentType("text/plain;charset=UTF-8");
		String readResult = null;
		String userPassword = null;
		if (userid == null || password == null) {
			return null;
		} else {
			try {
				Teacher teacher = teacherService.teacherLoginByEmployeeNum(userid);
				Student student = studentService.studentLoginByEmployeeNum(userid);
				userPassword = Common.eccryptMD5(password);
				if (teacher != null) {
					if (userPassword.equals(teacher.getTeacherPassword())) {
						request.getSession().setAttribute("user", teacher);
						request.getSession().setAttribute("userId", teacher.getEmployeeNum());
						ret.put("user", teacher);
						System.out.println("ttahcer========================================");
						return ret;
					} else {
						ret.put("status", "ERROR");
						ret.put("msg", "密码错误");
						return ret;
					}
				} else if (student != null) {
					if (userPassword.equals(student.getStudentPassword())) {
						ret.put("user", student);
						request.getSession().setAttribute("user", student);
						request.getSession().setAttribute("userId", student.getStudentId());
						System.out.println("ttahcer========================================");
						return ret;

					} else {
						ret.put("status", "ERROR");
						ret.put("msg", "密码错误");
						return ret;
					}
				} else {
					ret.put("status", "ERROR");
					ret.put("msg", "用户名错误");
					return ret;
				}

			} catch (Exception e) {
				e.printStackTrace();
				ret.put("status", "ERROR");
				ret.put("msg", "用户名或密码错误");
				return ret;
			}
		}
	}

	/**
	 * 创建课程
	 * 
	 * @param request
	 * @param teachers
	 * @return
	 */
	@RequestMapping(value = "createCourse")
	@SuppressWarnings({ "unused", "unchecked" })
	@ResponseBody
	public Map<String, Object> createCourse(HttpServletRequest request) {
		Map<String, Object> ret = new HashMap<String, Object>();
		String courseId = Common.uuid();
		try {
			Object[] obj = Common.fileFactory(request, courseId);
			List<File> files = (List<File>) obj[0]; // 获取课程图片
			Map<String, Object> formdata = (Map<String, Object>) obj[1]; // 获取课程内容
			// 封装课程类
			Course course = new Course();
			course.setCourseId(courseId);
			course.setCourseName((String) formdata.get("courseName"));
			// 校验课程名
			if (teacherService.getCourseByName(course.getCourseName()) != null) {
				ret.put("msg", "课程已存在");
				ret.put("status", "ERROR");
				return ret;
			}
			course.setCourseDetail((String) formdata.get("courseDetail"));
			course.setCourseCategory((String) formdata.get("courseCategory"));
			Timestamp publishTime = new Timestamp(System.currentTimeMillis());
			course.setPublishTime(publishTime);
			String employeeNum = (String) formdata.get("publisherId");
			String teacher = (String) formdata.get("teachers");
			String[] teachers = teacher.split(",");
			course.setPublisherId(employeeNum);
			for (File f : files) {
				course.setFaceImg(Common.readProperties("path") + "/" + f.getName());
			}
			teacherService.createCourse(course); // 添加课程
			teacherService.addOtherToMyCourse(employeeNum, courseId, 1);// 把课程创建者初始化到教师圈
			// 通过课程id和获取教师圈的id集合绑定教师到课程
			if (teachers != null) {
				for (int i = 0; i < teachers.length; i++) {
					teacherService.addOtherToMyCourse(teachers[i], courseId, 0);
				}
			}
			ret.put("status", "OK");
			return ret;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			ret.put("status", "ERROR");
			return ret;
		}
	}

	/**
	 * 创建课程（不加图片）
	 * 
	 * @param request
	 * @param teachers
	 * @return
	 */
	@RequestMapping(value = "createCourseNoImg")
	@SuppressWarnings({ "unused", "unchecked" })
	@ResponseBody
	public Map<String, Object> createCourseNoImg(HttpServletRequest request) {
		Map<String, Object> ret = new HashMap<String, Object>();
		String courseId = Common.uuid();
		try {
			// 封装课程类
			Course course = new Course();
			course.setCourseId(courseId);
			course.setCourseName(request.getParameter("courseName"));
			// 校验课程名
			if (teacherService.getCourseByName(course.getCourseName()) != null) {
				ret.put("msg", "课程已存在");
				ret.put("status", "ERROR");
				return ret;
			}
			course.setCourseDetail(request.getParameter("courseDetail"));
			course.setCourseCategory(request.getParameter("courseCategory"));
			Timestamp publishTime = new Timestamp(System.currentTimeMillis());
			course.setPublishTime(publishTime);
			String employeeNum = request.getParameter("publisherId");
			String teacher = request.getParameter("teachers");
			String[] teachers = teacher.split(",");
			course.setPublisherId(employeeNum);
			teacherService.createCourse(course); // 添加课程
			teacherService.addOtherToMyCourse(employeeNum, courseId, 1);// 把课程创建者初始化到教师圈
			// 通过课程id和获取教师圈的id集合绑定教师到课程
			if (teachers != null) {
				for (int i = 0; i < teachers.length; i++) {
					teacherService.addOtherToMyCourse(teachers[i], courseId, 0);
				}
			}
			ret.put("status", "OK");
			return ret;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			ret.put("status", "ERROR");
			return ret;
		}
	}

	/**
	 * 创建班级
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "createClass")
	@ResponseBody
	public Map<String, Object> createClass(HttpServletRequest request) {
		try {
			try {
				request.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Map<String, Object> ret = new HashMap<String, Object>();
		try {
			VirtualClass virtualClass = new VirtualClass();
			// 接收参数
			String virtualClassNUm = Common.uuid();
			virtualClass.setVirtualClassNum(virtualClassNUm);
			virtualClass.setVirtualClassName(request.getParameter("virtualClassName"));
			// 校验班级名
			if (teacherService.getCourseByName(virtualClass.getVirtualClassName()) != null) {
				ret.put("msg", "班级已存在");
				ret.put("status", "ERROR");
				return ret;
			}
			virtualClass.setCreatorId(request.getParameter("creator"));
			virtualClass.setCourseId(request.getParameter("courseId"));
			virtualClass.setCreateTime(new Timestamp(System.currentTimeMillis()));
			virtualClass.setTerm(request.getParameter("term"));
			String[] realClassNums = request.getParameter("realClassNums").split(",");// ====================error
			// String[] realClassNums = null;
			// 绑定自然班和虚拟班的关系
			int count = 0; // 班级总数
			List<RealClass> realClassList = new ArrayList<RealClass>();
			if (realClassNums.length != 0) {

				for (String realClassNum : realClassNums) {
					realClassList.add(teacherService.readRealClass(realClassNum).get(0)); // 根据自然班级号获取对应的自然班级
				}
				// 计算总人数
				for (RealClass realClass : realClassList) {
					count += realClass.getRealPersonNum();
				}
				virtualClass.setClassStuentNum(count);
				teacherService.createVirtualClass(virtualClass); // 创建班级
				// 绑定创建的虚拟班级和其对应的自然班
				for (String realClassNum : realClassNums) {
					teacherService.mapVirtualRealClass(realClassNum, virtualClassNUm);
				}
				ret.put("status", "OK");
				return ret;
			} else {
				ret.put("msg", "请选择班级");
				ret.put("status", "ERROR");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			ret.put("msg", "添加异常，请检查信息重试！");
			ret.put("status", "ERROR");
			return ret;
		}
	}

	/**
	 * 修改课程
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "wxModifyCourse")
	public Map<String, Object> wxModifyCourse(HttpServletRequest request) {
		Map<String, Object> ret = new HashMap<String, Object>();
		try {
			Object[] obj = Common.fileFactory(request, "");
			List<File> files = (List<File>) obj[0]; // 获取课程图片
			Map<String, Object> formdata = (Map<String, Object>) obj[1]; // 获取课程内容
			// 封装课程类
			Course course = new Course();
			course.setCourseId((String) formdata.get("courseId"));
			course.setCourseName((String) formdata.get("courseName"));
			// 校验课程名
			if (teacherService.getCourseByName(course.getCourseName()) != null) {
				ret.put("msg", "课程已存在");
				ret.put("status", "ERROR");
				return ret;
			}
			course.setCourseDetail((String) formdata.get("courseDetail"));
			course.setCourseCategory((String) formdata.get("courseCategory"));
			Timestamp publishTime = new Timestamp(System.currentTimeMillis());
			course.setPublishTime(publishTime);
			String employeeNum = (String) formdata.get("publisherId");
			course.setPublisherId(employeeNum);
			for (File f : files) {
				course.setFaceImg(Common.readProperties("path") + "/" + f.getName());
			}
			teacherService.updateCourse(course); // 修改课程
			// teacherService.addOtherToMyCourse(employeeNum, courseId,
			// 1);//把课程创建者初始化到教师圈
			// //通过课程id和获取教师圈的id集合绑定教师到课程
			// if(teachers != null){
			// for(int i = 0; i < teachers.length; i++){
			// teacherService.addOtherToMyCourse(teachers[i], courseId, 0);
			// }
			// }
			ret.put("status", "OK");
			return ret;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			ret.put("status", "ERROR");
			return ret;
		}
	}

	/**
	 * 修改班级
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "wxModifyClass")
	@ResponseBody
	public Map<String, Object> modifyClass(HttpServletRequest request) {
		Map<String, Object> ret = new HashMap<String, Object>();
		try {
			VirtualClass virtualClass = new VirtualClass();
			// 接收参数
			String virtualClassNUm = request.getParameter("virtualClassNum");
			virtualClass.setVirtualClassName(request.getParameter("virtualClassName"));
			// 校验班级名
			if (teacherService.getCourseByName(virtualClass.getVirtualClassName()) != null) {
				ret.put("msg", "班级已存在");
				ret.put("status", "ERROR");
				return ret;
			}
			virtualClass.setCreatorId("1");
			virtualClass.setCourseId(request.getParameter("courseId"));
			virtualClass.setTerm(request.getParameter("term"));
			String[] realClassNums = request.getParameter("realClassNums").split(",");
			teacherService.createVirtualClass(virtualClass); // 创建班级
			// 绑定自然班和虚拟班的关系
			// if(realClassNums.length != 0){
			// for(String realClassNum : realClassNums){
			// teacherService.mapVirtualRealClass(realClassNum,
			// virtualClassNUm);
			// }
			// ret.put("status", "OK");
			// return ret;
			// }
			// else{
			// ret.put("msg", "请选择班级");
			// ret.put("status","ERROR");
			// return ret;
			// }
			return ret;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			ret.put("msg", "添加异常，请检查信息重试！");
			ret.put("status", "ERROR");
			return ret;
		}
	}

	/**
	 * 教师显示“我的课程”信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "wxShowTeacherCourse", method = { RequestMethod.GET })
	public Map<String, Object> wxShowTeacherCoure(HttpServletRequest request) {
		Map<String, Object> ret = new HashMap<>();
		try {
			// 得到老师创建的课程
			String employeeNum = request.getParameter("employeeNum");
			List<String> createCourseIdList = teacherService.courseIdList(employeeNum, 1);
			List<Course> createCourse = new ArrayList<>();
			if (createCourseIdList != null) {
				for (String cid : createCourseIdList) {
					Course course = teacherService.getCourseById(cid);
					createCourse.add(course);
				}
			}
			// 得到老师加入的课程
			List<String> joinCourseIdList = teacherService.courseIdList(employeeNum, 0);
			List<Course> joinCourse = new ArrayList<>();
			if (joinCourseIdList != null) {
				for (String cid : joinCourseIdList) {
					Course course = teacherService.getCourseById(cid);
					joinCourse.add(course);
				}
			}
			ret.put("createCourse", createCourse);
			ret.put("joinCourse", joinCourse);
			ret.put("status", "OK");
			return ret;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			ret.put("status", "异常，请重试");
			return ret;
		}
	}

	/**
	 * 学生显示“我的课程”页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "wxShowStudentCourse")
	public Map<String, Object> wxShowStudentCourse(HttpServletRequest request,
			@RequestParam(value = "studentId") String studentId) {
		Map<String, Object> ret = new HashMap<>();
		try {
			// 通过学生id获取自然班级号
			String realClassNum = teacherService.getrealClassNumBySid(studentId);
			// 通过学生所在的realclass查出其参与的课程
			List<Course> joinCourses = teacherService.getStudentJoinCourseByrealNum(realClassNum);
			// 查出学生关注的课程集合
			List<Course> attentionCourse = teacherService.getAttentionCourse(studentId);
			ret.put("joinCourses", joinCourses);
			ret.put("attentionCourse", attentionCourse);
			ret.put("status", "OK");
			return ret;
		} catch (Exception e) {  
			// TODO: handle exception
			e.printStackTrace();
			ret.put("status", "ERROR");
			return ret;
		}
	}

	/**
	 * 获取教师列表
	 */
	@RequestMapping(value = "getTeachers")
	public Map<String, Object> getTeachers(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "employeeNum") String employeeNum) {
		Map<String, Object> ret = new HashMap<>();
		try {
			List<Teacher> teacherList = new ArrayList<>();
			List<Teacher> teachers = teacherService.getTeachers();
			if (teachers != null) {
				for (Teacher teacher : teachers) {
					if (!teacher.getEmployeeNum().equals(employeeNum)) { // 在选择的教师中过滤掉当前的操作者
						teacherList.add(teacher);
					}
				}
			}
			ret.put("teacherList", teacherList);
			ret.put("status", "OK");
			return ret;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			ret.put("status", "ERROR");
			return ret;
		}
	}

	/**
	 * 获取系部
	 * 
	 * @param request
	 * @param employeeNum
	 * @return
	 */
	@RequestMapping("getCategory")
	public Map<String, Object> toCreateCourse(HttpServletRequest request) {
		Map<String, Object> ret = new HashMap<>();
		try {
			// 查找所有系部列表
			List<Category> categoryList = teacherService.readCategory();
			ret.put("categoryList", categoryList);
			ret.put("status", "OK");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			ret.put("status", "ERROR");
		}
		return ret;
	}

	/**
	 * 显示教师创建的班级列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "showTeacherCreateClass")
	public Map<String, Object> showTeacherCreateClass(HttpServletRequest request,
			@RequestParam(value = "employeeNum") String employeeNum) {
		Map<String, Object> ret = new HashMap<>();
		try {
			// 获取教师创建的所有班级
			List<VirtualClass> virtualClassList = teacherService.getTeacherCreateClass(employeeNum);
			//获取自然班级列表
			if(virtualClassList.contains(null) || virtualClassList != null){
				for(int i = 0; i < virtualClassList.size(); i++){
					// 根据虚拟班级id获取自然班级列表
					virtualClassList.get(i).setRealClassList(teacherService.getRealClassList(virtualClassList.get(i).getVirtualClassNum()));
				}
			}
			ret.put("virtualClassList", virtualClassList);
			ret.put("status", "OK");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			ret.put("status", "ERROR");
		}
		return ret;
	}

	/**
	 * 查出学生所属虚拟班级列表
	 * 
	 * @param request
	 * @param studentId
	 * @return
	 */
	@RequestMapping(value = "showStudentJoinClass")
	public Map<String, Object> showStudentJoinClass(HttpServletRequest request,
			@RequestParam(value = "studentId") String studentId) {
		Map<String, Object> ret = new HashMap<>();
		try {
			// 通过学生id获取自然班级号
			String realClassNum = teacherService.getrealClassNumBySid(studentId);
			// 通过学生所在的realclass查出virtualclass
			List<VirtualClass> virtualClassList = teacherService.getVirtualClassNumByreal(realClassNum);
			//获取自然班级列表
			if(virtualClassList.contains(null) || virtualClassList != null){
				for(int i = 0; i < virtualClassList.size(); i++){
					// 根据虚拟班级id获取自然班级列表
					virtualClassList.get(i).setRealClassList(teacherService.getRealClassList(virtualClassList.get(i).getVirtualClassNum()));
				}
			}
			ret.put("virtualClassList", virtualClassList);
			ret.put("status", "OK");
			return ret;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			ret.put("status", "ERROR");
			return ret;
		}
	}

	/**
	*直接一次性查出所有的数据,返回给前端
	*/
	@RequestMapping("/getTaskListPage")
	@ResponseBody
	public  Map<String, Object> getTaskListPage(HttpServletRequest request,@RequestParam(value = "taskCategory")String taskCategory){
		Map<String, Object> ret = new HashMap<>();
		List<Task> list = new ArrayList<Task>();
		String courseId = (String) request.getSession().getAttribute("courseId");
		list = teacherService.getTaskListPage(courseId, taskCategory);
		ret.put("taskList", list);
		return ret;
	} 
	
	/**
	 * 提供课程详细
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "toCourseDetail")
	public Map<String, Object> toCourseDetail(HttpServletRequest request, @RequestParam(value = "courseId") String courseId) {
		Map<String, Object> ret = new HashMap<>();
		try {
			// 通过courseid查询课程
			Course course = teacherService.getCourseById(courseId);
			// 查询教师圈教师信息
			List<Teacher> teacherList = teacherService.getTeachersByCourseId(courseId);
			request.getSession().setAttribute("course", course);
			ret.put("course", course);
			ret.put("teacherList", teacherList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	/**
	 * 获取课程资源
	 * @param request
	 * @param courseId
	 * @return
	 */
	@RequestMapping(value="toTeachResource")
	public Map<String, Object> toTeachResource(HttpServletRequest request,  @Param(value="courseId") String courseId){
		Map<String, Object> ret = new HashMap<>();
		try {
			//通过课程id查询音频类型资源
			Object[] obj = resourceService.showResourceByTypeAndCId(2, courseId);
			ret.put("audioresourceList", obj[0]);
			ret.put("audioteacherNames", obj[1]);
			//通过课程id查询视频类型资源
			Object[] obj2 = resourceService.showResourceByTypeAndCId(3, courseId);
			ret.put("videoresourceList", obj2[0]);
			ret.put("videoteacherNames", obj2[1]);
			//通过课程id查询图片类型资源
			Object[] obj3 = resourceService.showResourceByTypeAndCId(4, courseId);
			ret.put("imgresourceList", obj3[0]);
			ret.put("imgteacherNames", obj3[1]);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
			return ret;
		
	}

	/**
	 * @author LiMing
	 * @param request
	 * @return 获取创建虚拟班级数据
	 * @throws Exception
	 */
	@RequestMapping(value = "toCreateVirtualClass")
	public Map<String, Object> toCreateVirtualClass(@RequestParam(value = "courseId") String courseId,
			HttpServletRequest request) throws Exception {
		Map<String, Object> ret = new HashMap<>();
		try {
			List<Term> listTerm = new ArrayList<Term>();
			List<RealClass> listRealClass = new ArrayList<RealClass>();
			Course course = new Course();

			// course = teacherService.readCourseByCourseId(courseId);
			listTerm = teacherService.readTerm(); // 获取学期信息
			listRealClass = teacherService.readRealClass(null); // 获取自然班级列表
			request.getSession().setAttribute("virtualCourse", course);// 将course放入SESSION
			ret.put("listTerm", listTerm);
			ret.put("listRealClass", listRealClass);
			ret.put("courseId", courseId);
			ret.put("status", "OK");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ret;
	}
	
	/**
	 * 跳转到首页
	 * @param request
	 * @return
	 */
	@RequestMapping(value="toMain")
	public Map<String, Object> toMain(HttpServletRequest request){
		Map<String, Object> ret = new HashMap<>();
		try {
			//按时间查询前12个课程信息
			List<Course> courseList = teacherService.getCourseByLimit();
			//获取创课教师
			List<String> teacherNameList = new ArrayList<>();
			for(Course course : courseList){
				teacherNameList.add(teacherService.getTeacherNameById(course.getPublisherId()));
			}
			ret.put("courseList",courseList);
			ret.put("teacherNameList",teacherNameList);
			ret.put("teacher",request.getSession().getAttribute("teacher"));
			ret.put("student",request.getSession().getAttribute("student"));
			ret.put("status", "OK");
		} catch (Exception e) {
			// TODO: handle exception
			ret.put("status", "ERROR");
			e.printStackTrace();
			return ret;
		}
		return ret;
	}
	
	/**
	 * @author wenli
	 * @param request
	 * @return
	 * 跳转到添加任务发布页面
	 */
	@RequestMapping(value="toPublishTask")
	@SuppressWarnings({ "unused", "unchecked" })
	public Map<String, Object> toPublishTask(HttpServletRequest request,@RequestParam("course") Course course) {
		Map<String, Object> ret = new HashMap<>();
		//Course course;
		try {
			List<String> taskCategoryList=null;
			//course = (Course) request.getSession().getAttribute("course");
			taskCategoryList = teacherService.getTaskCategory();
			request.getSession().setAttribute("taskCategoryList", taskCategoryList);
			request.getSession().setAttribute("courseId", course.getCourseId());
			ret.put("taskCategoryList", taskCategoryList);
			ret.put("courseId", course.getCourseId());
		} catch (Exception e) {
			ret.put("status", "ERROR");
			e.printStackTrace();
			return ret;
		}
		return ret;
	}
	
	/**
	 * @author LiMing
	 * 通过分类筛选 课程
	 * */
	@RequestMapping(value="readCourseInfoByCategory",method= {RequestMethod.GET})
	public Map<String, Object> readCategoryInfo(@RequestParam(value="categoryId") String categoryId) {		
		List<Category> categories = new ArrayList<>();
		Map<String, Object> ret = new HashMap<>();
		String category = categoryId;
		List<Course> list = new ArrayList<Course>();
		List<String> teacherNames = new ArrayList<String>();
		try {
			categories = teacherService.readCategory();
			list = teacherService.readCourseInfoByCategory(category);
			for (Course course : list) {
				teacherNames.add(teacherService.getTeacherNameById(course.getPublisherId()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		ret.put("teacherNames",teacherNames);
		ret.put("categories",categories);
		ret.put("courseList", list);
		return ret;
	}
	
	/**
	 * @author wenli
	 * @param request
	 * @return
	 * 到班级作业列表页
	 */
	@RequestMapping("/toteacherTaskListContent")
	public Map<String, Object> toteacherTaskListContent(HttpServletRequest request ) {
		Map<String, Object> ret = new HashMap<>();
		Integer upNum =0;
		List<String> taskIdList;
		List<Task> taskList=new ArrayList<Task>();
		String readResult =null;
		Integer point=0;
		String upTaskDetail = null;
		Timestamp now = new Timestamp(System.currentTimeMillis());
		HashMap<String, String> upTaskDetail2taskList = new HashMap<String, String>();
		HashMap<String, List<String>> accessoriesName2taskList  = new HashMap<String, List<String>>();
		HashMap<String, Integer> grade2taskList  = new HashMap<String, Integer>();
		HashMap<String, Boolean> isEnd2taskList = new HashMap<String, Boolean>();
		HashMap<String, String> timeEnd2taskList = new HashMap<String, String>();//计算时间差
		List<String> accessoriesName = new ArrayList<String>();
		//upTaskDetail = studentService.getUpTaskDetail(taskId, studentId);
		//accessoriesName = studentService.getUpAccessories(taskId, studentId);
		String virtualClassNum = (String) request.getParameter("virtualClassNum");//获取当前虚拟班级
		System.out.println("virtualClassNum========="+virtualClassNum);
		VirtualClass virtualClass = teacherService.getVirtualById(virtualClassNum);//获取虚拟班级实体
		Integer studentNum = virtualClass.getClassStuentNum();	//获取班级总人数
		try {
			taskIdList = teacherService.searchTaskId(virtualClassNum);//根据虚拟班级号获得任务列表
			taskList = teacherService.TaskList(taskIdList);	//根据任务ID号获得任务实体
			ret.put("taskList", taskList);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ret;
	}
	
	/**
	 * @author wenli
	 * @param request
	 * @return
	 * 发布任务
	 */
	@RequestMapping(value="publishTask")
	@SuppressWarnings({ "unused", "unchecked" })
	public Map<String, Object> publishTask(HttpServletRequest request) {
		
		String taskId =  Common.uuid();	//设置任务id
		Map<String, Object> ret = new HashMap<>();
		Object[] obj = Common.fileFactory(request,taskId);
		Map<String, Object> formdata = (Map<String, Object>) obj[1];
		List<File> returnFileList = (List<File>) obj[0]; // 要返回的文件集合
		String virtualClassNum = (String) formdata.get("virtualClassNum");
		// 创建list集合用于获取文件上传返回路径名
		List<String> list = new ArrayList<String>();
		List<Accessory> accessories  = new ArrayList<Accessory>();
		List<Resource> resources = new ArrayList<Resource>();
		Task task=new Task();
		task.setTaskId(taskId);
		task.setTaskTitle((String) formdata.get("taskTitle"));
		task.setTaskDetail((String) formdata.get("taskDetail"));
		//task.setTaskEndTime(Timestamp.valueOf((String) formdata.get("taskEndTime")));
		//	task.setTaskType((String) formdata.get("taskType"));
		task.setPublisherId((String) formdata.get("userId"));
		task.setPublishTime(new Timestamp(System.currentTimeMillis()));
		task.setVirtualClassNum(virtualClassNum);
		task.setUseNum(1);//设置使用次数为1
		task.setCourseId((String) formdata.get("courseId"));
		System.out.println("作业类型是："+(String) formdata.get("taskCategory"));
		task.setTaskType((String) formdata.get("taskCategory"));
		task.setStatus(0);

		try {
			teacherService.createTask(task);		//创建任务
			teacherService.mapClassTask(task.getVirtualClassNum(), taskId,Timestamp.valueOf((String) formdata.get("taskEndTime")));		//映射班级任务表

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(!returnFileList.isEmpty()) {
			for (File file : returnFileList) {
				Accessory accessory = new Accessory();
				accessory.setAccessoryName(file.getName());
				accessory.setAccessoryPath(file.getPath());
				accessory.setTaskId(taskId);
				accessory.setAccessoryTime(Common.TimestamptoString());
				accessories.add(accessory);
//				Resource resource = new Resource();
//				resource.setResourceId(Common.uuid());
//				resource.setResourceName(file.getName());
//				resource.setResourceDetail(null);
//				resource.setPublishTime(new Timestamp(System.currentTimeMillis()));
//				resource.setPublisherId((String) request.getSession().getAttribute("teacherId"));
//				resource.setResourceTypeId(Common.fileType(file.getName(), teacherService));//需要判断文件类型
//				resource.setResourcePath(file.getPath());
//				resource.setCourseId((String) formdata.get("courseId"));
//				resource.setSize(file.length()/1024.0+"KB");
//				resources.add(resource);
			}
			try {
				teacherService.addAccessory(accessories);	//添加任务附件
//				resourceService.upLoadResource(resources);//添加资源
				ret.put("status", "OK");
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				ret.put("status", e.getMessage());
				ret.put("s",(String) formdata.get("userId") );
			}
			
		}
		return ret;
	}
	
	/**
	 * 提交作业
	 * @param request
	 * @param taskId
	 * @return
	 */
	@RequestMapping(value="toUpTask")
	public Map<String, Object> toUpTask(HttpServletRequest request) {
		Map<String, Object> ret = new HashMap<>();
		
		Object[] obj = Common.fileFactory(request,null);
		Map<String, Object> formdata = (Map<String, Object>) obj[1];
		List<File> returnFileList = (List<File>) obj[0]; // 要返回的文件集合
		// 创建list集合用于获取文件上传返回路径名
		String studentId = (String) formdata.get("studentId");
		String virtualClassNum = (String) formdata.get("virtualClassNum");
		String term = teacherService.getVirtualById(virtualClassNum).getTerm();
		List<String> list = new ArrayList<String>();
		List<Accessory> accessories  = new ArrayList<Accessory>();
		UpTask upTask = new UpTask();
		upTask.setTaskId((String) formdata.get("taskId"));
		upTask.setStudentId(studentId);
		upTask.setTerm(term);
		upTask.setUpTaskDetail((String) formdata.get("upTaskDetail"));
		studentService.upTask(upTask, virtualClassNum);
		
		if(!returnFileList.isEmpty()) {
			for (File file : returnFileList) {
				Accessory accessory = new Accessory();
				accessory.setAccessoryName(file.getName());
				accessory.setAccessoryPath(file.getPath());
				accessory.setTaskId((String) formdata.get("taskId"));
				accessory.setAccessoryTime(Common.TimestamptoString());
				accessories.add(accessory);
			}
			try {
				studentService.upAccessory(accessories, studentId);
				ret.put("status", "OK");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				ret.put("status", "error");
				e.printStackTrace();
			}
		}
		return ret;
	}
}

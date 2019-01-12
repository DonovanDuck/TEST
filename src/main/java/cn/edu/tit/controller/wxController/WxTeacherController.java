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

import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.bean.VirtualClass;
import cn.edu.tit.common.Common;
import cn.edu.tit.iservice.IStudentService;
import cn.edu.tit.iservice.ITeacherService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@RequestMapping("WxTeacherController")
@RestController
public class WxTeacherController {
	
	@Autowired
	private ITeacherService teacherService;
	
	@Autowired
	private IStudentService studentService;
	
	/**
	 * 微信端登录
	 * @param request
	 * @param userId
	 * @param password
	 */
	@RequestMapping(value="userLogin")
	public Map<String, Object> userLogin(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="id",required=false) String userid,@RequestParam(value="password",required=false) String password){
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Map<String, Object> ret = new HashMap<String, Object>();
		response.setContentType("text/plain;charset=UTF-8");
		String readResult =null;
		String userPassword = null;
		if(userid==null || password==null){
			return null;
		}
		else{
			try {
				Teacher teacher = teacherService.teacherLoginByEmployeeNum(userid);
				Student student = studentService.studentLoginByEmployeeNum(userid);
				userPassword = password;
				if(teacher != null){
					if(password.equals(teacher.getTeacherPassword()))
					{	
						ret.put("user", teacher);
						System.out.println("ttahcer========================================");
						return ret;
					}
					else {
						ret.put("status", "ERROR");
						ret.put("msg", "密码错误");
						return ret;
					}
				}
				else if(student != null){
					if(userid.equals(student.getStudentPassword()))
					{	
						ret.put("user", student);
						System.out.println("ttahcer========================================");
						return ret;

					}
					else {
						ret.put("status", "ERROR");
						ret.put("msg", "密码错误");
						return ret;
					}
				}else{
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
	 * @param request
	 * @param teachers
	 * @return
	 */
	@RequestMapping(value="createCourse")
	@SuppressWarnings({ "unused", "unchecked" })
	@ResponseBody
	public Map<String, Object> createCourse(HttpServletRequest request, @RequestBody String[] teachers){
		Map<String, Object> ret = new HashMap<String, Object>();
		String courseId = Common.uuid();
		try {
			Object[] obj = Common.fileFactory(request,courseId);
			List<File> files = (List<File>) obj[0];	// 获取课程图片
			Map<String, Object> formdata = (Map<String, Object>) obj[1]; // 获取课程内容
			//封装课程类
			Course course = new Course();
			course.setCourseId(courseId);
			course.setCourseName((String)formdata.get("courseName"));
			course.setCourseDetail((String)formdata.get("courseDetail"));
			course.setCourseCategory((String)formdata.get("courseCategory"));
			Timestamp publishTime = new Timestamp(System.currentTimeMillis());
			course.setPublishTime(publishTime);
			String employeeNum = (String)formdata.get("publisherId");
			course.setPublisherId(employeeNum);
			for(File f : files){
				course.setFaceImg(Common.readProperties("path")+"/"+f.getName());
			}
			teacherService.createCourse(course); // 添加课程
			teacherService.addOtherToMyCourse(employeeNum, courseId, 1);//把课程创建者初始化到教师圈
			//通过课程id和获取教师圈的id集合绑定教师到课程
			if(teachers != null){
				for(int i = 0; i < teachers.length; i++){
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
	 * @param request
	 * @return
	 */
	@RequestMapping(value="createClass")
	@ResponseBody
	public Map<String, Object> createClass(HttpServletRequest request){
		Map<String, Object> ret = new HashMap<String, Object>();
		try {
			VirtualClass virtualClass = new VirtualClass();
			//接收参数
			String virtualClassNUm = Common.uuid();
			virtualClass.setVirtualClassNum(virtualClassNUm);
			virtualClass.setVirtualClassName(request.getParameter("virtualClassName"));
			virtualClass.setCreatorId("1");
			virtualClass.setCourseId(request.getParameter("courseId"));
			virtualClass.setCreateTime(new Timestamp(System.currentTimeMillis()));
			virtualClass.setVirtualClassDetail(request.getParameter("virtualClassDetail"));
			virtualClass.setTerm(request.getParameter("term"));
			String realClassNumstr = request.getParameter("realClassNums");//====================error
			String[] realClassNums = null;
			teacherService.createVirtualClass(virtualClass); // 创建班级
			// 绑定自然班和虚拟班的关系
			if(realClassNums.length != 0){
				for(String realClassNum : realClassNums){
					teacherService.mapVirtualRealClass(realClassNum, virtualClassNUm);
				}
				ret.put("status", "OK");
				return ret;
			}
			else{
				ret.put("msg", "请选择班级");
				ret.put("status","ERROR");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			ret.put("msg", "添加异常，请检查信息重试！");
			ret.put("status","ERROR");
			return ret;
		}
	}
	
	/**
	 * 修改课程
	 * @param request
	 * @return
	 */
	@RequestMapping(value="wxModifyCourse")
	public Map<String, Object> wxModifyCourse(HttpServletRequest request){
		Map<String, Object> ret = new HashMap<String, Object>();
		try {
			Object[] obj = Common.fileFactory(request,"");
			List<File> files = (List<File>) obj[0];	// 获取课程图片
			Map<String, Object> formdata = (Map<String, Object>) obj[1]; // 获取课程内容
			//封装课程类
			Course course = new Course();
			course.setCourseId((String)formdata.get("courseId"));
			course.setCourseName((String)formdata.get("courseName"));
			course.setCourseDetail((String)formdata.get("courseDetail"));
			course.setCourseCategory((String)formdata.get("courseCategory"));
			Timestamp publishTime = new Timestamp(System.currentTimeMillis());
			course.setPublishTime(publishTime);
			String employeeNum = (String)formdata.get("publisherId");
			course.setPublisherId(employeeNum);
			for(File f : files){
				course.setFaceImg(Common.readProperties("path")+"/"+f.getName());
			}
			teacherService.updateCourse(course); // 修改课程
//			teacherService.addOtherToMyCourse(employeeNum, courseId, 1);//把课程创建者初始化到教师圈
//			//通过课程id和获取教师圈的id集合绑定教师到课程
//			if(teachers != null){
//				for(int i = 0; i < teachers.length; i++){
//					teacherService.addOtherToMyCourse(teachers[i], courseId, 0);
//				}
//			}
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
	 * @param request
	 * @return
	 */
	@RequestMapping(value="modifyClass")
	@ResponseBody
	public Map<String, Object> modifyClass(HttpServletRequest request){
		Map<String, Object> ret = new HashMap<String, Object>();
		try {
			VirtualClass virtualClass = new VirtualClass();
			//接收参数
			String virtualClassNUm = request.getParameter("virtualClassNUm");
			virtualClass.setVirtualClassName(request.getParameter("virtualClassName"));
			virtualClass.setCreatorId("1");
			virtualClass.setCourseId(request.getParameter("courseId"));
			virtualClass.setVirtualClassDetail(request.getParameter("virtualClassDetail"));
			virtualClass.setTerm(request.getParameter("term"));
			String[] realClassNums = request.getParameter("realClassNums").split(",");
			teacherService.createVirtualClass(virtualClass); // 创建班级
			// 绑定自然班和虚拟班的关系
			if(realClassNums.length != 0){
				for(String realClassNum : realClassNums){
					teacherService.mapVirtualRealClass(realClassNum, virtualClassNUm);
				}
				ret.put("status", "OK");
				return ret;
			}
			else{
				ret.put("msg", "请选择班级");
				ret.put("status","ERROR");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			ret.put("msg", "添加异常，请检查信息重试！");
			ret.put("status","ERROR");
			return ret;
		}
	}
	
	/**
	 * 教师显示“我的课程”信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="wxShowTeacherCoure",method= {RequestMethod.GET})
	public Map<String, Object> wxShowTeacherCoure(HttpServletRequest request){
		Map<String, Object> ret = new HashMap<>();
		try {
			// 得到老师创建的课程
			String employeeNum = request.getParameter("employeeNum");
			List<String> createCourseIdList = teacherService.courseIdList(employeeNum, 1);
			List<Course> createCourse = new ArrayList<>();
			if(createCourseIdList != null){
				for(String cid : createCourseIdList){
					Course course = teacherService.getCourseById(cid);
					createCourse.add(course);
				}
			}
			// 得到老师加入的课程
			List<String> joinCourseIdList = teacherService.courseIdList(employeeNum, 0);
			List<Course> joinCourse = new ArrayList<>();
			if(joinCourseIdList != null){
				for(String cid : joinCourseIdList){
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
	 * @param request
	 * @return
	 */
	@RequestMapping(value="wxShowStudentCourse")
	public  Map<String, Object> wxShowStudentCourse(HttpServletRequest request,@RequestParam(value="studentId")String studentId){
		Map<String, Object> ret = new HashMap<>();
		try {
			//通过学生id获取自然班级号
			String realClassNum  = teacherService.getrealClassNumBySid(studentId);
			// 通过学生所在的realclass查出virtualclass
			List<VirtualClass> virtualClasses = teacherService.getVirtualClassNumByreal(realClassNum);
			ret.put("virtualClasses", virtualClasses);
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
	@RequestMapping(value="getTeachers")
	public Map<String, Object> getTeachers(HttpServletRequest request, HttpServletResponse response,@RequestParam(value="employeeNum")String employeeNum){
		Map<String, Object> ret = new HashMap<>();
		try {
			List<Teacher> teacherList = new ArrayList<>();
			List<Teacher> teachers = teacherService.getTeachers();
			if(teachers != null){
				for(Teacher teacher : teachers){
					if(!teacher.getEmployeeNum().equals(employeeNum)){ // 在选择的教师中过滤掉当前的操作者
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
	 * @param request
	 * @param employeeNum
	 * @return
	 */
	@RequestMapping("getCategory")
	public Map<String, Object> toCreateCourse(HttpServletRequest request){
		Map<String, Object> ret = new HashMap<>();
		try {
			//查找所有系部列表
			List<Category> categoryList =  teacherService.readCategory();
			ret.put("categoryList", categoryList);
			ret.put("status", "OK");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			ret.put("status", "ERROR");
		}
		return ret;
	}
}

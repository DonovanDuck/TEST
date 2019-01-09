package cn.edu.tit.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

import cn.edu.tit.bean.Accessory;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Task;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.bean.VirtualClass;
import cn.edu.tit.common.Common;
import cn.edu.tit.iservice.IAdminService;
import cn.edu.tit.iservice.ITeacherService;

@RequestMapping("/teacher")
@Controller
public class TeacherController {
	/**
	 * 声明变量
	 * */
	@Autowired
	private ITeacherService teacherService;
	private List<Category> categories = null;//将  分类 信息作为全局变量，避免多次定义,在首次登陆教师页面时 在  方法teacherCourseList（） 处即初始化成功
	private Teacher teacher =null;//将teacher 设定为全局变量

	@RequestMapping(value="teacherLogin",method= {RequestMethod.GET})
	public ModelAndView teacherLogin( @RequestParam("employeeNum")String teacherId,@RequestParam("password")String password,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		String teacherPassword = null;
		try {
			teacher = teacherService.teacherLoginByEmployeeNum(teacherId);
			//teacherPassword = Common.eccryptMD5(password);
			System.out.println(teacher.toString());
			if(password.equals(teacher.getTeacherPassword()))
			{	
				request.getSession().setAttribute("teacherId", teacher.getEmployeeNum());
				mv = teacherCourseList(request);
				mv.addObject("readResult", "登录成功");//返回信息
				mv.addObject("teacher",teacher);
			}
			else {
				mv.addObject("readResult", "密码错误");//返回信息
				mv.setViewName("/jsp/Teacher/index");//设置返回页面
			}
		} catch (Exception e) {
			mv.addObject("readResult", "异常");//返回信息
			mv.setViewName("/jsp/Teacher/index");//设置返回页面
			e.printStackTrace();
		}
		return mv;	
	}

	/**
	 * 跳转到教师的课程详细页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value="toCourseDetail/{courseId}")
	public String toCourseDetail(HttpServletRequest request, @PathVariable Integer courseId){
		try {
			// 通过courseid查询课程
			Course course = teacherService.getCourseById(courseId);
			// 查询教师圈教师信息
			List<Teacher> teacherList = teacherService.getTeachersByCourseId(courseId);
			request.setAttribute("course", course);
			request.setAttribute("teacherList", teacherList); //通过存入request在前台访问
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "jsp/Teacher/course_detail";
	}

	/**
	 * @author wenli
	 * @param request
	 * @return
	 * 发布任务
	 */
	@RequestMapping(value="publishTask")
	@SuppressWarnings({ "unused", "unchecked" })
	public String publishTask(HttpServletRequest request) {

		Object[] obj = Common.fileFactory(request);		//解析任务form的各个字段
		List<File> files = (List<File>) obj[0];			//获得任务中文件内容
		List<Accessory> accessories = new ArrayList<Accessory>();
		Map<String, Object> formdata = (Map<String, Object>) obj[1];	//获得任务中文本内容
		String taskId =  UUID.randomUUID().toString().replaceAll("-", "");		//设置任务id
		Task task=new Task();
		task.setTaskId(taskId);
		task.setTaskTitle((String) formdata.get("taskTitle"));
		task.setTaskDetail((String) formdata.get("taskDetail"));
		task.setTaskEndTime((Timestamp) formdata.get("taskEndTime"));
		task.setTaskType((String) formdata.get("taskType"));
		task.setPublisherId((String) formdata.get("employeeNum"));
		task.setPublishTime(new Timestamp(System.currentTimeMillis()));
		task.setVirtualClassNum((String) formdata.get("virtual_class_num"));
		String status =  (String) formdata.get("status");
		task.setStatus(Integer.parseInt(status));

		try {
			teacherService.createTask(task);		//创建任务
			teacherService.mapClassTask(task.getVirtualClassNum(), taskId);		//映射班级任务表
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for (File file : files) {
			Accessory accessory = new Accessory();
			accessory.setAccessoryName(file.getName());
			accessory.setAccessoryPath(file.getPath());
			accessory.setTaskId(taskId);
			accessory.setAccessoryTime(Common.TimestamptoString());
			accessories.add(accessory);
		}
		try {
			teacherService.addAccessory(accessories);	//添加任务附件
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/jsp/Teacher/publishTask";

	}

	/**
	 * 添加教师的方法  excel 相关的操作,将数据插入到数据库 
	 * 使用spring的MultipartFile上传文件
	 * */
	@RequestMapping(value="DoExcel",method= {RequestMethod.POST})
	public ModelAndView DoExcel(@RequestParam(value="file_excel") MultipartFile file,HttpServletRequest request) {			
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		try {
			//调用ITeacherService 下的方法，完成增加教师
			//readResult = teacherService.addTeacherInfo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("readResult", readResult);//返回信息
		mv.setViewName("/success");//设置返回页面
		return mv;
	}

	/**
	 * @author wenli
	 * @return
	 * 教师通过点击课程显示自己所带班级
	 */
	@RequestMapping(value="teacherClassList/{courseId}",method= {RequestMethod.GET})
	public ModelAndView teacherClassList(@PathVariable String courseId) {
		ModelAndView mv = new ModelAndView();
		List<VirtualClass> virtualClassList = null;
		try {
			virtualClassList = teacherService.virtualsForCourse(Integer.valueOf(courseId));//根据课程ID显示该课程所带班级
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("virtualClassList", virtualClassList);
		mv.setViewName("/jsp/Teacher/teacherClassList");
		return mv;
	}

	public ModelAndView teacherTaskList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		List<String> taskIdList;
		List<Task> taskList;
		String readResult =null;
		Integer point=0;
		try {
			taskIdList = teacherService.searchTaskId("E56FE27F03344091BE8BDD698426EC22");//根据虚拟班级号获得任务列表
			taskList = teacherService.TaskList(taskIdList);	//根据任务ID号获得任务实体
			for (Task task : taskList) {
				point = teacherService.searchTaskPoint(task.getTaskType());//任务实体对象加入任务分值信息
				task.setTaskPoint(point);
			}
			mv.addObject("taskList", taskList);
			mv.addObject("readResult", readResult);
			mv.setViewName("/jsp/Teacher/classTask");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;	
	}


	/**
	 * @author LiMing
	 * @param request
	 * @return
	 * @throws Exception 
	 * 教师登陆后进入的第一个页面
	 */
	@RequestMapping(value="teacherCourseList",method= {RequestMethod.POST})
	public ModelAndView teacherCourseList(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		categories = teacherService.readCategory();
		List<Course> list = new ArrayList<Course>();
		List<String> teacherNames = new ArrayList<String>();
		list = teacherService.readCourse(null);
		for (Course course : list) 
		{
			System.out.println(course.toString());
			teacherNames.add(teacherService.getTeacherNameById(course.getPublisherId()));
		}
		mv.addObject("categories", categories);
		mv.addObject("courseList", list);
		mv.addObject("teacherNames", teacherNames);
		mv.setViewName("/jsp/CourseJsp/courseSecond");
		return mv;
	}

	/**
	 * @author LiMing
	 * 通过分类筛选 课程
	 * */
	@RequestMapping(value="readCourseInfoByCategory/{categoryId}",method= {RequestMethod.GET})
	public ModelAndView readCategoryInfo(@PathVariable String categoryId) {			
		ModelAndView mv = new ModelAndView();
		String category = categoryId;
		List<Course> list = new ArrayList<Course>();
		List<String> teacherNames = new ArrayList<String>();
		try {
			list = teacherService.readCourseInfoByCategory(category);
			for (Course course : list) {
				teacherNames.add(teacherService.getTeacherNameById(course.getPublisherId()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("teacherNames",teacherNames);
		mv.addObject("courseList", list);
		mv.setViewName("/jsp/CourseJsp/courseIframe");//设置返回页面
		return mv;
	}


	/**
	 * @author LiMing
	 * @param request
	 * @return
	 * 查找对应老师的课程列表，加入
	 * @throws Exception 
	 */
	@RequestMapping(value="toMyJoinCourse")
	public ModelAndView toMyJoinCourse(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<Integer> courseIdListByOthers;		//加入别人的课程ID号
		List<Course> courseListByOthers = null;		//别人课程实体
		List<String> teacherNames = new ArrayList<String>();
		System.out.println(request.getSession().getAttribute("teacherId"));
		try {
			courseIdListByOthers =teacherService.courseIdList((String) request.getSession().getAttribute("teacherId"), 0);
			courseListByOthers = teacherService.courseList(courseIdListByOthers);
			for (Course course : courseListByOthers) {
				teacherNames.add(teacherService.getTeacherNameById(course.getPublisherId()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("teacherNames",teacherNames);
		mv.addObject("courseList", courseListByOthers);
		mv.setViewName("/jsp/CourseJsp/courseIframe");
		return mv;
	}

	/**
	 * @author LiMing
	 * @param request
	 * @return
	 * 查找对应老师的课程列表，创建
	 * @throws Exception 
	 */
	@RequestMapping(value="toMyCreateCourse")
	public ModelAndView toMyCreateCourse(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<Integer> courseIdListforMe ;	//自己创建的课程ID号
		List<Course> courseListforMe = null ;		//自己课程实体
		//创建老师集合的目的是：课程与创建者的匹配
		List<String> teacherNames = new ArrayList<String>();
		try {
			courseIdListforMe = teacherService.courseIdList((String) request.getSession().getAttribute("teacherId"), 1);
			courseListforMe = teacherService.courseList(courseIdListforMe);
			for (int i = 0; i < courseListforMe.size(); i++) {
				teacherNames.add(teacher.getTeacherName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("teacherNames",teacherNames);
		mv.addObject("courseList", courseListforMe);
		mv.setViewName("/jsp/CourseJsp/courseIframe");
		return mv;
	}


	/**
	 * @author LiMing
	 * @param request
	 * @return
	 * 查找对应老师的课程列表，创建
	 * @throws Exception 
	 */
//	@RequestMapping(value="searchCourse")
//	public JSONObject searchCourse(HttpServletRequest request,HttpServletResponse response) throws Exception {
//		JSONObject jsonObject = new JSONObject();
//		String content = request.getParameter("content");
//		List<Course> courseList = null ;
//		//通过课程名查询课程，由于课程名不重复，故只取返回集合中的第一个
//		courseList = teacherService.readCourse(content);
//		Course course = courseList.get(0);
//	
//		jsonObject.toString();
//		response.getWriter().print(course);
//		return jsonObject;
//	}

}

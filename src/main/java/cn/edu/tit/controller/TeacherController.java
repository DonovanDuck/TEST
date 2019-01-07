package cn.edu.tit.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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
	@RequestMapping(value="teacherLogin",method= {RequestMethod.GET})
	public ModelAndView teacherLogin( @RequestParam("teacherId")String teacherId,@RequestParam("teacherPassword")String password,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		Teacher teacher =null;
		String teacherPassword = null;
		try {
			teacher = teacherService.teacherLoginByEmployeeNum(teacherId);
			//teacherPassword = Common.eccryptMD5(password);
			if(password.equals(teacher.getTeacherPassword()))
			{	
				request.getSession().setAttribute("teacherId", teacher.getEmployeeNum());
				mv = teacherCourseList(request);
				mv.addObject("readResult", "登录成功");//返回信息
				mv.addObject("teacher",teacher);
				//mv.setViewName("/jsp/Teacher/teacherCourseList");//设置返回页面
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
	
	@RequestMapping(value="publishTask")
	@SuppressWarnings({ "unused", "unchecked" })
	public String publishTask(HttpServletRequest request) {

		Object[] obj = Common.fileFactory(request);
		List<File> files = (List<File>) obj[0];
		List<Accessory> accessories = new ArrayList<Accessory>();
		Map<String, Object> formdata = (Map<String, Object>) obj[1];
		String taskId =  UUID.randomUUID().toString().replaceAll("-", "");
		Task task=new Task();
		task.setTaskId(taskId);
		task.setTaskTitle((String) formdata.get("taskTitle"));
		task.setTaskDetail((String) formdata.get("taskDetail"));
		task.setTaskEndTime((Timestamp) formdata.get("taskEndTime"));
		task.setTaskType((String) formdata.get("taskType"));
		task.setPublisherId((String) formdata.get("employeeNum"));
		task.setPublishTime(new Timestamp(System.currentTimeMillis()));
		task.setVirtualClassNum((String) formdata.get("virtual_class_num"));
		task.setChapter((String) formdata.get("chapter"));
		String status =  (String) formdata.get("status");
		task.setStatus(Integer.parseInt(status));
		teacherService.createTask(task);
		teacherService.mapClassTask(task.getVirtualClassNum(), taskId);
		for (File file : files) {
			Accessory accessory = new Accessory();
			accessory.setAccessoryName(file.getName());
			accessory.setAccessoryPath(file.getPath());
			accessory.setTaskId(taskId);
			accessory.setAccessoryTime(Common.TimestamptoString());
			accessories.add(accessory);
		}
		teacherService.addAccessory(accessories);
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
	 * @param request
	 * @return
	 * 查找对应老师的课程列表，包括加入的和创建的
	 */
	@RequestMapping(value="teacherCourseList",method= {RequestMethod.POST})
	public ModelAndView teacherCourseList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		System.out.println("!!!!!!!!!!1");
		String readResult =null;
		List<Integer> courseIdListforMe ;  //创建一个“自己创建课程”的课程ID 集合
		List<Integer> courseIdListByOthers;//创建一个“别人自己加入的课程” 的课程ID集合
		List<Course> courseListforMe ;//创建一个“自己创建课程”的实体类
		List<Course> courseListByOthers; //创建一个“自己加入的课程” 的实体类
		List<Category> categories;//分类信息
		//从表中获取数据,1是自己创建的,获取课程ID
		courseIdListforMe = teacherService.courseIdList((String) request.getSession().getAttribute("teacherId"), 1);
		//从表中获取数据，0是自己加入别人创建的课程，获取课程ID
		courseIdListByOthers =teacherService.courseIdList((String) request.getSession().getAttribute("teacherId"), 0);
		for (int i = 0; i < courseIdListforMe.size(); i++) {
			System.out.println(courseIdListforMe.get(i));
		}
		for (int i = 0; i < courseIdListByOthers.size(); i++) {
			System.out.println(courseIdListByOthers.get(i));
		}
		//根据 自己创建课程的ID集合  进行搜索，课程列表（自己创建课程的详情）
		courseListforMe = teacherService.courseList(courseIdListforMe);
		//根据 自己加入课程的ID集合  进行搜索，课程列表（自己课程的详情）
		courseListByOthers = teacherService.courseList(courseIdListByOthers);
		mv.addObject("courseListforMe", courseListforMe);
		mv.addObject("courseListByOthers", courseListByOthers);
		categories = teacherService.readCategory();
		mv.addObject("categories", categories);
		for (Category category : categories) {
			System.out.println(category);
		}
		mv.setViewName("/jsp/CourseJsp/courseSecond");
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
		List<VirtualClass> virtualClassList;
		virtualClassList = teacherService.virtualsForCourse(Integer.valueOf(courseId));
		mv.addObject("virtualClassList", virtualClassList);
		mv.setViewName("/jsp/Teacher/teacherClassList");
		return mv;
	}
}

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
	public ModelAndView teacherLogin( @RequestParam("employeeNum")String teacherId,@RequestParam("password")String password,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		Teacher teacher =null;
		System.out.println(teacherId);
		String teacherPassword = null;
		try {
			teacher = teacherService.teacherLoginByEmployeeNum(teacherId);
			teacherPassword = Common.eccryptMD5(password);
			System.out.println(teacher.toString());
			if(teacherPassword.equals(teacher.getTeacherPassword()))
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
		
		try {
			teacherService.createTask(task);
			teacherService.mapClassTask(task.getVirtualClassNum(), taskId);
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
			teacherService.addAccessory(accessories);
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
	 * @param request
	 * @return
	 * 查找对应老师的课程列表，包括加入的和创建的
	 * @throws Exception 
	 */
	@RequestMapping(value="teacherCourseList",method= {RequestMethod.POST})
	public ModelAndView teacherCourseList(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("!!!!!!!!!!1");
		String readResult =null;

		List<Integer> courseIdListforMe ;
		List<Integer> courseIdListByOthers;
		List<Course> courseListforMe = null ;
		List<Course> courseListByOthers = null;
		List<Category> categories;//分类信息
		System.out.println(request.getSession().getAttribute("teacherId"));
		try {
			courseIdListforMe = teacherService.courseIdList((String) request.getSession().getAttribute("teacherId"), 1);
			courseIdListByOthers =teacherService.courseIdList((String) request.getSession().getAttribute("teacherId"), 0);
			courseListforMe = teacherService.courseList(courseIdListforMe);
			courseListByOthers = teacherService.courseList(courseIdListByOthers);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
		List<VirtualClass> virtualClassList = null;
		try {
			virtualClassList = teacherService.virtualsForCourse(Integer.valueOf(courseId));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.addObject("virtualClassList", virtualClassList);
		mv.setViewName("/jsp/Teacher/teacherClassList");
		return mv;
	}
}

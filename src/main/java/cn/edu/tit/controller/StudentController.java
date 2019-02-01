/**
 * 
 */
package cn.edu.tit.controller;

import java.io.File;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.ResourceType;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.bean.VirtualClass;
import cn.edu.tit.common.Common;
import cn.edu.tit.iservice.IAdminService;
import cn.edu.tit.iservice.IResourceService;
import cn.edu.tit.iservice.IStudentService;
import cn.edu.tit.iservice.ITeacherService;

/**
 * @author LiMing
 *
 */
@RequestMapping("/student")
@Controller
public class StudentController {
	/**
	 * 声明变量
	 * */
	@Autowired
	private ITeacherService teacherService;
	@Autowired
	private IStudentService studentService;
	@Autowired
	public MainController mainController;

	@RequestMapping(value="LoginStudent")
	public ModelAndView LoginStudent(@RequestParam(value="employeeNum") String employeeNum,@RequestParam(value="password") String password,HttpServletRequest request) {			
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		String psw = null;
		Student student = new Student();
		request.getSession().setAttribute("studentId", null);
		try {
			student = studentService.studentLoginByEmployeeNum(employeeNum);
			psw = Common.eccryptMD5(password);
			if(!psw.equals(student.getStudentPassword()))
			{
				mv.addObject("readResult", "密码错误");//返回信息
				mv.setViewName("/jsp/Teacher/index");//设置返回页面
			}
			else {
				mv.addObject("readResult", readResult);//返回信息
				request.getSession().setAttribute("studentId", student.getStudentId());
				request.getSession().setAttribute("student", student);
				mv=mainController.toMain(request); //去首页
			}

		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("readResult", "密码错误");//返回信息
			mv.setViewName("/jsp/Teacher/index");//设置返回页面
		}
		return mv;
	}

	/**
	 * @author LiMing
	 * 跳转到学生中心,此方法作为第一入口
	 * @throws Exception 
	 * */
	@RequestMapping(value="toStudentPage")
	public ModelAndView toStudentPage(HttpServletRequest request) throws Exception {			
		ModelAndView mv = new ModelAndView();
		Student student = (Student) request.getSession().getAttribute("student");
		/*******************定义集合*********************/
		//我加入的课程ID集合
		List<String> listCourseId_MyCourse = new ArrayList<String>();
		//我加入的课程 发布者名字集合
		List<String> listCourseId_MyCourse_publishName = new ArrayList<String>();
		//我关注的课程ID集合
		List<String> listCourseId_Myattention = new ArrayList<String>();
		//我关注的课程 发布者名字集合
		List<String> listCourseId_Myattention_publishName = new ArrayList<String>();
		//我加入的课程集合
		List<Course> listCourse_MyCourse = new ArrayList<Course>();
		//我关注的课程集合
		List<Course> listCourse_Myattention = new ArrayList<Course>();
		/*******************数据获取*********************/
		try {
			//获取所有关注课程ID
			listCourseId_MyCourse = studentService.getStudentCourse("0",student.getStudentId());
			//获取所有加入课程ID
			listCourseId_Myattention = studentService.getStudentCourse("1",student.getStudentId());

			//获取课程ID对应的课程
			listCourse_MyCourse = teacherService.courseList(listCourseId_MyCourse);
			listCourse_Myattention = teacherService.courseList(listCourseId_Myattention);

			for (Course co : listCourse_MyCourse) {
				listCourseId_MyCourse_publishName.add(teacherService.getTeacherNameById(co.getPublisherId()));
			}
			for (Course co : listCourse_Myattention) {
				listCourseId_Myattention_publishName.add(teacherService.getTeacherNameById(co.getPublisherId()));
			}
			mv.addObject("listCourse_MyCourse", listCourse_MyCourse);//返回信息
			mv.addObject("listCourseId_MyCourse_publishName", listCourseId_MyCourse_publishName);//返回信息
			mv.addObject("listCourse_Myattention", listCourse_Myattention);//返回信息
			mv.addObject("listCourseId_Myattention_publishName", listCourseId_Myattention_publishName);//返回信息
			mv.setViewName("/jsp/StudentJsp/studentCenter_MyCourse");//设置返回页面
		} catch (Exception e) {
			// TODO: handle exception
			mv.setViewName("/jsp/StudentJsp/studentCenter_MyCourse");//设置返回页面
		}		
		return mv;
	}

	/**
	 * @author LiMing
	 * 跳转到我的课程(个人信息中心页面)
	 * @throws Exception 
	 * */
	@RequestMapping(value="toStudentCenter_MyCourse")
	public ModelAndView toStudentCenter_MyCourse(HttpServletRequest request) throws Exception {			
		ModelAndView mv = new ModelAndView();
		mv = toStudentPage(request);
		return mv;
	}

	/**
	 * @author LiMing
	 * 跳转到我的班级(个人信息中心页面)
	 * @throws Exception 
	 * */
	@RequestMapping(value="toStudentCenter_MyClass")
	public ModelAndView toStudentCenter_MyClass(HttpServletRequest request) throws Exception {	
		ModelAndView mv = new ModelAndView();
		Student student = (Student) request.getSession().getAttribute("student");
		String studentClass = student.getClassNum();
		List<VirtualClass> virtualList = new ArrayList<VirtualClass>();
		virtualList = teacherService.getVirtualClassNumByreal(studentClass);
		mv.addObject("virtualClassList", virtualList);//返回信息
		mv.setViewName("/jsp/StudentJsp/studentCenter_MyClass");//设置返回页面
		return mv;
	}

	/**
	 * @author LiMing
	 * 跳转到我的讨论(个人信息中心页面)
	 * @throws Exception 
	 * */
	@RequestMapping(value="toStudentCenter_MyDiscuss")
	public ModelAndView toStudentCenter_MyDiscuss(HttpServletRequest request) {			
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jsp/StudentJsp/studentCenter_MyDiscuss");//设置返回页面
		return mv;
	}

	/**
	 * @author LiMing
	 * 跳转到我的信息(个人信息中心页面)
	 * @throws Exception 
	 * */
	@RequestMapping(value="toStudentCenter_MyInfo")
	public ModelAndView toStudentCenter_MyInfo(HttpServletRequest request) throws Exception {			
		ModelAndView mv = new ModelAndView();
		Student student = (Student) request.getSession().getAttribute("student");
		Category category = new Category();
		category = studentService.getCategoryById(student.getStudentCategory());
		mv.addObject("student", student);//返回信息
		mv.addObject("category", category);//返回信息
		mv.setViewName("/jsp/StudentJsp/studentCenter_MyInfo");//设置返回页面
		return mv;
	}

	/**
	 * 更新学生信息
	 * @throws Exception 
	 * */
	@RequestMapping(value="updateStudent")
	public ModelAndView updateStudent(HttpServletRequest request) throws Exception {	
		ModelAndView mv = new ModelAndView();
		Student student = new Student();
		student = (Student) request.getSession().getAttribute("student");
		System.out.println("更新数据");
		String nickName=request.getParameter("nickName");
		String password= null;
		password = request.getParameter("password");
		if(!password.isEmpty())
		{
			String pws = Common.eccryptMD5(password);
			student.setStudentPassword(pws);
		}
		String date=request.getParameter("date");
		String part=request.getParameter("part");
		String studyResult=request.getParameter("studyResult");
		String prize=request.getParameter("prize");
		String others=request.getParameter("others");
		student.setStudentNickName(nickName);
		studentService.updateStudent(student);
		mv = toStudentPage(request);
		return mv;
	}
}

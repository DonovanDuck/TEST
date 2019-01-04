package cn.edu.tit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.tit.bean.Admin;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.iservice.IAdminService;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	IAdminService iAdminService;

	/**
	 * 添加教师的方法  excel 相关的操作,将数据插入到数据库 
	 * 使用spring的MultipartFile上传文件
	 * */
	@RequestMapping(value="AddTeacher",method= {RequestMethod.POST})
	public ModelAndView DoExcelTeacher(@RequestParam(value="file_excel") MultipartFile file,HttpServletRequest request) {			
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		try {
			//调用ITeacherService 下的方法，完成增加教师
			readResult = iAdminService.addTeacherInfo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("readResult", readResult);//返回信息
		mv.setViewName("/jsp/AdminJsp/teacherManager");//设置返回页面
		return mv;
	}

	/**
	 * 增加学生操作，处理EXCEL表
	 * */
	@RequestMapping(value="AddStudent",method= {RequestMethod.POST})
	public ModelAndView DoExcelStudent(@RequestParam(value="file_excel") MultipartFile file,HttpServletRequest request) {			
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		try {
			//调用ITeacherService 下的方法，完成增加教师
			readResult = iAdminService.addStudentInfo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("readResult", readResult);//返回信息
		mv.setViewName("/jsp/AdminJsp/studentManager");//设置返回页面
		return mv;
	}

	/**
	 * 登陆管理员操作
	 * */
	@RequestMapping(value="LoginAdmin",method= {RequestMethod.POST})
	public ModelAndView LoginStudent(@RequestParam(value="adminUsername") String adminUsername,@RequestParam(value="adminPassword") String adminPassword) {			
		ModelAndView mv = new ModelAndView();
		Admin admin = null;
		String readResult =null;
		try {
			admin = iAdminService.loginAdmin(adminUsername);
			if(adminPassword.equals(admin.getAdminPassword()))
			{
				mv = readTeacherInfo();//登陆成功之后调用另一个函数,进入index页面
			}
			else {
				mv.addObject("readResult", readResult);//返回信息
				mv.setViewName("/jsp/AdminJsp/adminLogin");//设置返回页面
			}
		} catch (Exception e) {
			mv.addObject("readResult", readResult);//返回信息
			mv.setViewName("/jsp/AdminJsp/adminLogin");//设置返回页面
			e.printStackTrace();
		}
		return mv;
	}


	/**
	 * 增加系部信息
	 * */
	@RequestMapping(value="addCategories",method= {RequestMethod.POST})
	public ModelAndView LoginStudent() {			
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		mv.addObject("readResult", readResult);//返回信息
		mv.setViewName("/jsp/AdminJsp/departInformation");//设置返回页面
		return mv;
	}
	
	/**
	 * 读取系部信息
	 * */
	@RequestMapping(value="readCategories",method= {RequestMethod.GET})
	public ModelAndView readCategories() {			
		ModelAndView mv = new ModelAndView();
		List<Category> readResult = new ArrayList<Category>();
		readResult = iAdminService.readCategoryInfo();
		mv.addObject("categoryList", readResult);//返回信息
		mv.setViewName("/jsp/AdminJsp/categoryManager");//设置返回页面
		return mv;
	}
	/**
	 * 读取教师信息
	 * */
	@RequestMapping(value="readTeacherInfo",method= {RequestMethod.GET})
	public ModelAndView readTeacherInfo() {			
		ModelAndView mv = new ModelAndView();
		List<Teacher> readResult = new ArrayList<Teacher>();
		readResult = iAdminService.readTeacherInfo();
		mv.addObject("teacherList", readResult);//返回信息
		mv.setViewName("/jsp/AdminJsp/teacherManager");//设置返回页面
		return mv;
	}

	/**
	 * 读取学生信息
	 * */
	@RequestMapping(value="readStudentInfo",method= {RequestMethod.GET})
	public ModelAndView readStudentInfo() {			
		ModelAndView mv = new ModelAndView();
		List<Student> readResult = new ArrayList<Student>();
		readResult = iAdminService.readStudentInfo();
		mv.addObject("studentList", readResult);//返回信息
		mv.setViewName("/jsp/AdminJsp/studentManager");//设置返回页面
		return mv;
	}
	
	/**
	 * 删除学生信息
	 * */
	@RequestMapping(value="deleteStudent/{studentId}")
	public ModelAndView deleteStudentInfo(HttpServletRequest request,@PathVariable String studentId) {			
		ModelAndView mv = new ModelAndView();
		System.out.println(studentId);
		
		iAdminService.deleteStudent(studentId);
		return mv;
	}
}

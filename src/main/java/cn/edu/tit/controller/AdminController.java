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
import cn.edu.tit.common.Common;
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
	@RequestMapping(value="addStudent",method= {RequestMethod.POST})
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
	@RequestMapping(value="LoginAdmin",method= {RequestMethod.GET})
	public ModelAndView LoginAdmin(@RequestParam(value="employeeNum") String adminUsername,@RequestParam(value="password") String adminPassword) {			
		ModelAndView mv = new ModelAndView();
		Admin admin = null;
		String readResult =null;
		try {
			admin = iAdminService.loginAdmin(adminUsername);
			//String password=Common.eccryptMD5(admin.getAdminPassword());
			if(adminPassword.equals(admin.getAdminPassword()))
			{
				mv = readTeacherInfo();//登陆成功之后调用另一个函数,进入index页面
			}
			else {
				readResult = "密码输入不正确";	
				mv.addObject("readResult", readResult);//返回信息
				mv.addObject("admin", admin);
				mv.setViewName("/jsp/AdminJsp/adminLogin");//设置返回页面
			}
		} catch (Exception e) {
			readResult = "账号输入不正确";
			mv.addObject("readResult", readResult);//返回信息
			mv.setViewName("/jsp/AdminJsp/adminLogin");//设置返回页面
			e.printStackTrace();
		}
		return mv;
	}


	/**
	 * 重置学生密码
	 * */
	@RequestMapping(value="resetStudentPassword/{studentId}",method= {RequestMethod.GET})
	public ModelAndView resetStudentPassword(@PathVariable String studentId) {			
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		readResult = iAdminService.resetStudentPassword(studentId);
		mv.addObject("resetStudentPasswordMsg", readResult);//返回信息
		mv = readStudentInfo();
		return mv;
	}
	
	
	/**
	 * 重置老师密码
	 * */
	@RequestMapping(value="resetTeacherPassword/{employeeNum}",method= {RequestMethod.GET})
	public ModelAndView resetTeacherPassword(@PathVariable String employeeNum) {			
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		readResult = iAdminService.resetTeacherPassword(employeeNum);
		mv.addObject("resetTeacherPasswordMsg", readResult);//返回信息
		mv = readTeacherInfo();
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
		readResult = iAdminService.readCategory();
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
//	
//	/**
//	 * 测试
//	 * */
//	@RequestMapping(value="test")
//	public ModelAndView test() {			
//		ModelAndView mv = new ModelAndView();
//		String num = "1111";
//		String name = "李明";
//		mv.addObject("num", num);
//		mv.addObject("name", name);
//		mv.setViewName("/success");//设置返回页面
//		return mv;
//	}

}

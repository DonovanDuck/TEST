/**
 * 
 */
package cn.edu.tit.controller;

import java.io.File;
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

import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.iservice.IStudentService;
import cn.edu.tit.iservice.ITeacherService;

/**
 * @author LiMing
 *
 */
@RequestMapping("/student")
@Controller
public class StudentController {

	@Autowired
	private IStudentService studentService;
	Student student ;


	@RequestMapping(value="LoginStudent",method= {RequestMethod.POST})
	public ModelAndView LoginStudent(@RequestParam(value="studentId") String studentId,@RequestParam(value="studentPassword") String studentPassword) {			
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		try {
			student = studentService.studentLoginByEmployeeNum(studentId);
			if(studentPassword != student.getStudentPassword())
			{
				mv.addObject("readResult", readResult);//返回信息
				mv.setViewName("/error");//设置返回页面
			}
			else {
				mv.addObject("readResult", readResult);//返回信息
				mv.setViewName("/success");//设置返回页面
			}

		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("readResult", readResult);//返回信息
			mv.setViewName("/error");//设置返回页面
		}

		return mv;
	}

	/**
	 * 跳转到学生主页
	 * @param request
	 * @return
	 */
	@RequestMapping(value="toStudentPage")
	public ModelAndView toStudentPage(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		try {
			//获取教师信息
			Student student = (Student) request.getSession().getAttribute("student");
			mv.addObject("student",student);
			mv.setViewName(""); //跳转教师个人页
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			mv.addObject("readResult", "异常");//返回信息
			mv.setViewName("/jsp/Teacher/index");//设置返回页面
		}
		return mv;
	}

}

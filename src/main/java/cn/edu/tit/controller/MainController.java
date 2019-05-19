package cn.edu.tit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.iservice.ITeacherService;

@RequestMapping("/main")
@Controller
public class MainController {
	@Autowired
	public ITeacherService teacherService;
	
	/**
	 * 跳转到主页
	 * @param request
	 * @return
	 */
	@RequestMapping(value="toMain")
	public ModelAndView toMain(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		try {
			//按时间查询前8个课程信息
			List<Course> courseList = teacherService.getCourseByLimit();
			List<String> publishTime = new ArrayList<>();
			//获取教师团队
			List<Teacher> teacherList = new ArrayList<>();
			for(Course course : courseList){
				teacherList = teacherService.getTeachersByCourseId(course.getCourseId());
				course.setTeacherList(teacherList);
				publishTime.add(course.getPublishTime().toString().substring(0,10));
			}
			mv.addObject("courseList",courseList);
			mv.addObject("publishTime",publishTime);
			mv.addObject("teacherList",teacherList);
			mv.setViewName("/jsp/main");
			mv.addObject("teacher",request.getSession().getAttribute("teacher"));
			mv.addObject("student",request.getSession().getAttribute("student"));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		return mv;
	}
}

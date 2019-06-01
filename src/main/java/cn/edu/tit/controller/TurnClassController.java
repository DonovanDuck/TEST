package cn.edu.tit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.iservice.ITurnClassService;

@RequestMapping("/turnClass")
@Controller
public class TurnClassController {
	@Autowired
	private ITurnClassService turnClassService;
	/**
	 * @author LiMing
	 * @param request
	 * @return
	 * @throws Exception 
	 * 课程二级页面
	 */
	@RequestMapping(value="toTurnClassMainPage",method= {RequestMethod.GET})
	public ModelAndView toCourseSecond(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jsp/TurnClassJsp/turnClassMain");
		return mv;
	}
	
}

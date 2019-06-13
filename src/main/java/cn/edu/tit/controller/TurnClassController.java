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

	@RequestMapping(value="toTurnClassMainPage",method= {RequestMethod.GET})
	public ModelAndView toCourseSecond(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jsp/TurnClassJsp/turnClassMain");
		return mv;
	}
	
	@RequestMapping(value="toTurnClassTeamDetail",method= {RequestMethod.GET})
	public ModelAndView toTurnClassDetail(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jsp/TurnClassJsp/turnClassTeamDetail");
		return mv;
	}
	
	@RequestMapping(value="toTurnClassTeam",method= {RequestMethod.GET})
	public ModelAndView toTurnClassTeam(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jsp/TurnClassJsp/turnClassTeam");
		return mv;
	}
	
	@RequestMapping(value="toDesignBeforeClass",method= {RequestMethod.GET})
	public ModelAndView toDesignBeforeClass(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jsp/TurnClassJsp/designBeforeClass");
		return mv;
	}
}

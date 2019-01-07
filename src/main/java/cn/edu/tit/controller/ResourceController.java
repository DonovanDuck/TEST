package cn.edu.tit.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/resource")
@Controller
public class ResourceController {

	/**
	 * 跳转到教师的课程详细页面
	 * @param request
	 * @return
	 */
	
	public String toCourseDetail(HttpServletRequest request){
		return null;
	}
}

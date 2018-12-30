package cn.edu.tit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/teacher")
@Controller
public class TeacherController {

	@RequestMapping(value = "")
	public String createCourse(HttpRequest request) {
		
		return "";
	}
}

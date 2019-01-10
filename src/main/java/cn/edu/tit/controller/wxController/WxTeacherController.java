package cn.edu.tit.controller.wxController;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.common.Common;
import cn.edu.tit.iservice.IStudentService;
import cn.edu.tit.iservice.ITeacherService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@RequestMapping("WxTeacherController")
@RestController
public class WxTeacherController {
	
	@Autowired
	private ITeacherService teacherService;
	
	@Autowired
	private IStudentService studentService;
	
	/**
	 * 微信端登录
	 * @param request
	 * @param userId
	 * @param password
	 */
	@RequestMapping(value="userLogin")
	public Map<String, Object> userLogin(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="id",required=false) String userid,@RequestParam(value="password",required=false) String password)
	{
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Map<String, Object> ret = new HashMap<String, Object>();
		response.setContentType("text/plain;charset=UTF-8");
		String readResult =null;
		String userPassword = null;
		if(userid==null || password==null){
			return null;
		}
		else{
			try {
				Teacher teacher = teacherService.teacherLoginByEmployeeNum(userid);
				Student student = studentService.studentLoginByEmployeeNum(userid);
				userPassword = password;
				if(teacher != null){
					if(password.equals(teacher.getTeacherPassword()))
					{	
//						request.getSession().setAttribute("user", teacher);
//						JSONArray  json  =  JSONArray.fromObject(teacher); 
//						String result = json.toString();
//						JSONObject jsonObject = JSONObject.fromObject(teacher);
						ret.put("teacher", teacher);
						System.out.println("ttahcer========================================");
						return ret;
					}
					else {
						return null;
					}
				}
				else if(student != null){
					if(userid.equals(student.getStudentPassword()))
					{	
						request.getSession().setAttribute("user", student);
						JSONArray  json  =  JSONArray.fromObject(student); 
						String result = json.toString();
						response.getWriter().println(result);
					}
					else {
						return null;
					}
				}
				
			} catch (Exception e) {
				return null;
			}
		}
		return null;
	}

}

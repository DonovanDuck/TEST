/**
 * 
 */
package cn.edu.tit.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import java.util.Map;

import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.edu.tit.bean.AOCSC;
import cn.edu.tit.bean.Accessory;
import cn.edu.tit.bean.Attendance;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.CourseExpand;
import cn.edu.tit.bean.GDFCS;
import cn.edu.tit.bean.IURP;
import cn.edu.tit.bean.RealClass;
import cn.edu.tit.bean.ResourceType;
import cn.edu.tit.bean.SIAE;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Task;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.bean.Term;

import cn.edu.tit.bean.UpTask;

import cn.edu.tit.bean.VirtualClass;
import cn.edu.tit.common.Common;
import cn.edu.tit.iservice.IAchievementService;
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
	@Autowired
	private IAchievementService iAchievementService;

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
			 if(student == null){
				request.getSession().setAttribute("readResult", "用户名错误");//返回信息
				mv.setViewName("/jsp/Teacher/index");//设置返回页面
			}
			 else if(!psw.equals(student.getStudentPassword()))
			{
				request.getSession().setAttribute("readResult", "密码错误");//返回信息
				mv.setViewName("/jsp/Teacher/index");//设置返回页面
			}
			
			else {
				mv.addObject("readResult", readResult);//返回信息
				request.getSession().setAttribute("studentId", student.getStudentId());
				request.getSession().setAttribute("student", student);
				mv=mainController.toMain(request); //去首页
				request.getSession().setAttribute("readResult", null);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("readResult", "服务器异常");//返回信息
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
		//我关注的课程ID集合
		List<String> listCourseId_Myattention = new ArrayList<String>();
		//我加入的课程集合
		List<Course> listCourse_MyCourse;
		//我关注的课程集合
		List<Course> listCourse_Myattention;
		List<RealClass> realClass = new ArrayList<>();
		/*******************数据获取*********************/
		try {
			//获取所有关注课程ID
			listCourseId_Myattention = studentService.getStudentCourse("1",student.getStudentId());
			//获取所有加入课程ID
			List<VirtualClass> virtualList = new ArrayList<VirtualClass>();
			String studentClass = student.getClassNum();
			virtualList = teacherService.getVirtualClassNumByreal(studentClass);//获取虚拟班级列表
			for(VirtualClass v : virtualList){
				listCourseId_MyCourse.add(studentService.getCourseIdByvId(v.getVirtualClassNum()));
			}
			
			//获取课程ID对应的课程
			listCourse_MyCourse = teacherService.courseList(listCourseId_MyCourse);
			listCourse_Myattention = teacherService.courseList(listCourseId_Myattention);
			if(listCourse_MyCourse != null){
				for (Course co : listCourse_MyCourse) {
					String publishId = co.getPublisherId();
					String name = teacherService.getTeacherNameById(publishId);
					co.setPublisherId(name);
				}
			}
			if(listCourse_Myattention!=null){
				for (Course co : listCourse_Myattention) {
					String publishId = co.getPublisherId();
					String name = teacherService.getTeacherNameById(publishId);
					co.setPublisherId(name);
				}
			}	
			
			mv.addObject("listCourse_MyCourse", listCourse_MyCourse);//返回信息
			mv.addObject("listCourse_Myattention", listCourse_Myattention);//返回信息
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
		Term term = new Term();
		List<RealClass> realClass = new ArrayList<RealClass>();
		List<Term> termList = new ArrayList<Term>();
		List<VirtualClass> virtualList = new ArrayList<VirtualClass>();
		termList = teacherService.readTerm();//获取学期信息
		Student student = (Student) request.getSession().getAttribute("student");//从SSEION中获取学生信息
		String studentClass = student.getClassNum();
		virtualList = teacherService.getVirtualClassNumByreal(studentClass);//获取虚拟班级列表
		if(virtualList!=null) {
			for (VirtualClass virtualClass : virtualList) {
				realClass = teacherService.getRealClassList(virtualClass.getVirtualClassNum());
				virtualClass.setRealClassList(realClass);
			}
		}
		if(virtualList!=null) {
			for (VirtualClass virtualClass : virtualList) {
				term = studentService.readTermById(virtualClass.getTerm());

				if(term != null){
					virtualClass.setTerm(term.getStartYear()+"-"+term.getEndYear()+"	"+term.getTerm());
				}

			}
		}
		mv.addObject("listTerm", termList);//返回信息
		mv.addObject("virtualClassList", virtualList);//返回信息
		for (VirtualClass virtualClass : virtualList) {
			System.out.println("学生班级："+virtualClass.getVirtualClassName());
		}
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
	 * 跳转到我的讨论(个人信息中心页面)
	 * @throws Exception 
	 * */
	@RequestMapping(value="toStudentCenter_MyAchievement")
	public ModelAndView toStudentCenter_MyAchievement(HttpServletRequest request) {	
		Student stu = (Student) request.getSession().getAttribute("student");
		ModelAndView mv = new ModelAndView();
		List<AOCSC> aocscList =new ArrayList<>();
		List<CourseExpand> courseExpandList =new ArrayList<>();
		List<GDFCS> gdfcsList =new ArrayList<>();
		List<SIAE> siaeList =new ArrayList<>();
		List<IURP> iURPList =new ArrayList<>();
		try {
			aocscList = iAchievementService.queryAOCSCByAuthorId(stu.getStudentId());
			courseExpandList = iAchievementService.queryCourseExpandByAuthorId(stu.getStudentId());
			gdfcsList = iAchievementService.queryGDFCSByAuthorId(stu.getStudentId());
			siaeList = iAchievementService.querySIAEByAuthorId(stu.getStudentId());
			iURPList = iAchievementService.queryIURPByAuthorId(stu.getStudentId());
			mv.addObject("aocscList",aocscList);
			mv.addObject("courseExpandList",courseExpandList);
			mv.addObject("gdfcsList",gdfcsList);
			mv.addObject("siaeList",siaeList);
			mv.addObject("iURPList",iURPList);
			mv.setViewName("/jsp/AchievementJsp/achievementMain");
			} catch (Exception e) {
				e.printStackTrace();
			}
		mv.setViewName("/jsp/StudentJsp/studentCenter_MyAchievement");//设置返回页面
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

	/**
	 * @throws Exception 
	 * */
	@RequestMapping(value="/selectVirtualClassByTerm/{termId}")
	public ModelAndView selectVirtualClassByTerm(HttpServletRequest request,@PathVariable(value="termId") String termId) throws Exception {	
		ModelAndView mv = new ModelAndView();
		Term term = new Term();
		List<RealClass> realClass = new ArrayList<RealClass>();
		List<Term> termList = new ArrayList<Term>();
		List<VirtualClass> virtualList = new ArrayList<VirtualClass>();
		termList = teacherService.readTerm();//获取学期信息
		Student student = (Student) request.getSession().getAttribute("student");//从SSEION中获取学生信息
		String studentClass = student.getClassNum();
		virtualList = teacherService.getVirtualClassNumByreal(studentClass);//获取虚拟班级列表
		if(virtualList!=null) {
			for (VirtualClass virtualClass : virtualList) {
				realClass = teacherService.getRealClassList(virtualClass.getVirtualClassNum());
				virtualClass.setRealClassList(realClass);
			}
		}
		Iterator<VirtualClass> vi = virtualList.iterator();
		while(vi.hasNext()) {
			VirtualClass vii = vi.next();
			if(!vii.getTerm().equals(termId))
			{
				vi.remove();
			}
		}
		if(virtualList!=null) {
			for (VirtualClass virtualClass : virtualList) {
				term = studentService.readTermById(virtualClass.getTerm());
				virtualClass.setTerm(term.getStartYear()+"-"+term.getEndYear()+"	"+term.getTerm());
			}
		}
		mv.addObject("listTerm", termList);//返回信息
		mv.addObject("virtualClassList", virtualList);//返回信息
		mv.setViewName("/jsp/StudentJsp/studentCenter_MyClass");//设置返回页面
		return mv;
	}

	/**
	 * @author wenli
	 * @param request
	 * @return
	 * 跳转到班级详情页
	 * @throws Exception 
	 */
	@RequestMapping(value="toClassDetail",method= {RequestMethod.GET})
	public ModelAndView toClassDetail(HttpServletRequest request  ,@RequestParam(value="virtualClassNum") String virtualClassNum,@RequestParam(value="virtualClassName") String virtualClassName ) throws Exception {
		ModelAndView mv = new ModelAndView();
		String identify = "student";
		request.getSession().setAttribute("identify", identify);
		request.getSession().setAttribute("virtualClassNum", virtualClassNum);
		VirtualClass virtualClass = teacherService.getVirtualById(virtualClassNum);
		Course course  = teacherService.getCourseById(virtualClass.getCourseId());
		request.getSession().setAttribute("virtualClassName", virtualClassName);
		Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
		Student student = (Student) request.getSession().getAttribute("student");
		request.setAttribute("teacher", teacher);
		request.setAttribute("student", student);
		request.getSession().setAttribute("course", course);
		mv.addObject("virtualClassName",virtualClassName);
		mv.addObject("identify", identify);
		mv.setViewName("/jsp/VirtualClass/classInfo");
		return mv;
	}
	@RequestMapping(value="toUpTask/{taskId}")
	public String toUpTask(HttpServletRequest request,@PathVariable String taskId) {
		ModelAndView mv = new ModelAndView();
		String studentId = (String) request.getSession().getAttribute("studentId");
		String virtualClassNum = (String) request.getSession().getAttribute("virtualClassNum");
		String virtualClassName = (String) request.getSession().getAttribute("virtualClassName");
		String term = teacherService.getVirtualById(virtualClassNum).getTerm();
		Object[] obj = Common.fileFactory(request,taskId);
		Map<String, Object> formdata = (Map<String, Object>) obj[1];
		List<File> returnFileList = (List<File>) obj[0]; // 要返回的文件集合
		// 创建list集合用于获取文件上传返回路径名
		List<String> list = new ArrayList<String>();
		List<Accessory> accessories  = new ArrayList<Accessory>();
		UpTask upTask = new UpTask();
		upTask.setTaskId(taskId);
		upTask.setStudentId(studentId);
		upTask.setTerm(term);
		upTask.setUpTaskDetail((String) formdata.get("upTaskDetail"));
		studentService.upTask(upTask, virtualClassNum);
		
		if(!returnFileList.isEmpty()) {
			for (File file : returnFileList) {
				Accessory accessory = new Accessory();
				accessory.setAccessoryName(file.getName());
				accessory.setAccessoryPath(file.getPath());
				accessory.setTaskId(taskId);
				accessory.setAccessoryTime(Common.TimestamptoString());
				accessories.add(accessory);
			}
			try {
				studentService.upAccessory(accessories, studentId);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return "redirect:/student/toClassDetail?virtualClassNum="+virtualClassNum+"&virtualClassName="+virtualClassName;
	}
	//toPersonAccomplishment
	@RequestMapping(value="toPersonAccomplishment")
	public ModelAndView toPersonAccomplishment(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String studentId = (String) request.getSession().getAttribute("studentId");
		String virtualClassNum = (String) request.getSession().getAttribute("virtualClassNum");
		
		int gradeWork=0;
		int gradeTrial=0;
		int gradeCourseDesign=0;
		int gradeTurnClass=0;
		int gradeAttence=0;
		
		int upNumWork = 0;
		int upNumTrial = 0;
		int upNumCourseDesign = 0;
		int upNumTurnClass = 0;
		int upNumAttence = 0;
		
		gradeWork = teacherService.getStudentGrade(studentId, virtualClassNum, "work");
		gradeTrial = teacherService.getStudentGrade(studentId, virtualClassNum, "trial");
		gradeCourseDesign = teacherService.getStudentGrade(studentId, virtualClassNum, "course_design");
		gradeTurnClass = teacherService.getStudentGrade(studentId, virtualClassNum, "turn_class");
		gradeAttence = teacherService.getStudentGrade(studentId, virtualClassNum, "attence");

		upNumWork = teacherService.getStudentGradeNum(studentId, virtualClassNum, "work");
		upNumTrial = teacherService.getStudentGradeNum(studentId, virtualClassNum, "trial");
		upNumCourseDesign = teacherService.getStudentGradeNum(studentId, virtualClassNum, "course_design");
		upNumTurnClass = teacherService.getStudentGradeNum(studentId, virtualClassNum, "turn_class");
		upNumAttence = teacherService.getStudentGradeNum(studentId, virtualClassNum, "attence");
		
		int minGradeWork = 0;
		int maxGradeWork = 0;
		int minGradeTrial = 0;
		int maxGradeTrial = 0;
		int minGradeTurnClass = 0;
		int maxGradeTurnClass = 0;
		int minGradeCourseDesign = 0;
		int maxGradeCourseDesign = 0;
		/*
		 * minGradeWork = studentService.getMinGradeInCategory(virtualClassNum, "work");
		 * maxGradeWork = studentService.getMinGradeInCategory(virtualClassNum, "work");
		 * minGradeTrial = studentService.getMinGradeInCategory(virtualClassNum,
		 * "trial"); maxGradeTrial =
		 * studentService.getMinGradeInCategory(virtualClassNum, "trial");
		 * minGradeTurnClass = studentService.getMinGradeInCategory(virtualClassNum,
		 * "turn_class"); maxGradeTurnClass =
		 * studentService.getMinGradeInCategory(virtualClassNum, "turn_class");
		 * minGradeCourseDesign = studentService.getMinGradeInCategory(virtualClassNum,
		 * "course_design"); maxGradeCourseDesign =
		 * studentService.getMinGradeInCategory(virtualClassNum, "course_design");
		 */
		
		mv.addObject("minGradeWork",minGradeWork );	
		mv.addObject("maxGradeWork",maxGradeWork );	
		mv.addObject("minGradeTrial",minGradeTrial );	
		mv.addObject("maxGradeTrial",maxGradeTrial );	
		mv.addObject("minGradeTurnClass",minGradeTurnClass );	
		mv.addObject("maxGradeTurnClass",maxGradeTurnClass );	
		mv.addObject("minGradeCourseDesign",minGradeCourseDesign );	
		mv.addObject("maxGradeCourseDesign",maxGradeCourseDesign );		
		mv.addObject("gradeWork",gradeWork );
		mv.addObject("gradeTrial",gradeTrial );
		mv.addObject("gradeCourseDesign",gradeCourseDesign );
		mv.addObject("gradeTurnClass",gradeTurnClass );
		mv.addObject("gradeAttence",gradeAttence );
		mv.addObject("upNumWork",upNumWork );
		mv.addObject("upNumTrial",upNumTrial );
		mv.addObject("upNumCourseDesign",upNumCourseDesign );
		mv.addObject("upNumTurnClass",upNumTurnClass );
		mv.addObject("upNumAttence",upNumAttence );
		mv.setViewName("/jsp/Teacher/studentGradeAnalyse");
		
		
		return mv;
	}
	
	@RequestMapping(value="ajaxGetStudentTaskListPage")
	public void ajaxGetStudentTaskListPage(HttpServletRequest request,HttpServletResponse response,@RequestParam("taskCategory")String taskCategory) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		List<Task>taskList = new ArrayList<Task>();
		String virtualClassNum = (String) request.getSession().getAttribute("virtualClassNum");
		String studentId = (String) request.getSession().getAttribute("studentId");
		taskList = teacherService.getTaskByCategory(virtualClassNum, taskCategory);
		HashMap<String, Integer>studentGradeMap = new HashMap<String, Integer>();
		HashMap<String , Integer>maxGrade = new HashMap<String, Integer>();
		HashMap<String , Integer>minGrade = new HashMap<String, Integer>();
		for (Task task : taskList) {
			studentGradeMap.put(task.getTaskId(),  teacherService.getGrade(task.getTaskId(), studentId));
			maxGrade.put(task.getTaskId(), studentService.getMaxGradeInTask(task.getTaskId()));
			minGrade.put(task.getTaskId(), studentService.getMinGradeInTask(task.getTaskId()));
		}
		JSONArray arr =  new JSONArray();
		for (Task task : taskList) {
			JSONObject ob= new JSONObject();
			ob.put("taskTitle", task.getTaskTitle());
			ob.put("mygrade", studentGradeMap.get(task.getTaskId()));
			ob.put("minGrade", minGrade.get(task.getTaskId()));
			ob.put("maxGrade", maxGrade.get(task.getTaskId()));
			arr.add(ob);
		}
		String result = arr.toString();
		try {
			response.getWriter().print(result);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	@RequestMapping(value="toStudentAttendance")
	public ModelAndView toStudentAttendance(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String virtualClassNum  = (String) request.getSession().getAttribute("virtualClassNum");
		String studentId = (String) request.getSession().getAttribute("studentId");
		List<Attendance>attendanceList = new ArrayList<Attendance>();
		attendanceList = teacherService.getAttendanceDetail(virtualClassNum);
		HashMap<String, Boolean>leaveStudentMap = new HashMap<String, Boolean>();
		HashMap<String, Boolean>truancyStudentMap = new HashMap<String, Boolean>();
		HashMap<String, Boolean>attenceStudentMap = new HashMap<String, Boolean>();
		for (Attendance attendance : attendanceList) {
			truancyStudentMap.put(attendance.getAttendanceId(), studentService.isTruancied(attendance.getAttendanceId(), studentId));
			attenceStudentMap.put(attendance.getAttendanceId(), studentService.isAttenced(attendance.getAttendanceId(), studentId));
			leaveStudentMap.put(attendance.getAttendanceId(), studentService.isLeaved(attendance.getAttendanceId(), studentId));
		}
		mv.addObject("attendanceList", attendanceList);
		mv.addObject("attenceStudentMap", attenceStudentMap);
		mv.addObject("truancyStudentMap", truancyStudentMap);
		mv.addObject("leaveStudentMap", leaveStudentMap);
		mv.setViewName("/jsp/StudentJsp/studentAttendanceAnalyse");
		return mv;
	}

}

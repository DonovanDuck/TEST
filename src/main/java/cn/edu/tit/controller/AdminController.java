package cn.edu.tit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
import org.apache.http.entity.ContentType;
import org.junit.runner.Request;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

import cn.edu.tit.bean.AOCSC;
import cn.edu.tit.bean.Academic;
import cn.edu.tit.bean.Admin;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.CourseExpand;
import cn.edu.tit.bean.Department;
import cn.edu.tit.bean.GDFCS;
import cn.edu.tit.bean.IURP;
import cn.edu.tit.bean.RealClass;
import cn.edu.tit.bean.SIAE;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.bean.Term;
import cn.edu.tit.common.Common;
import cn.edu.tit.iservice.IAchievementService;
import cn.edu.tit.iservice.IAdminService;
import cn.edu.tit.iservice.IStudentService;
import cn.edu.tit.iservice.ITeacherService;
import net.sf.json.JSONArray;
/**
 * @author LiMing
 * 管理员Controller层
 */
@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	private IAdminService iAdminService;
	@Autowired
	private ITeacherService iTeacherService;
	@Autowired
	private IStudentService iStudentService;
	@Autowired
	private IAchievementService iAchievementService;


	/**
	 * @author LiMing
	 * 添加教师的方法  excel 相关的操作,将数据插入到数据库 
	 * 使用spring的MultipartFile上传文件
	 * */
	@RequestMapping(value="addTeacher",method= {RequestMethod.POST})
	public ModelAndView DoExcelTeacher(HttpServletRequest request) throws Exception {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(4194304); // 设置最大文件尺寸，这里是4MB
		List<FileItem> items = new ArrayList<FileItem>();
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		File file = new File("");
		for(FileItem fi : items) {
			File fullFile = new File(new String(fi.getName().getBytes(), "utf-8")); // 解决文件名乱码问题,获得文件内容
			file = new File(Common.readProperties("path"), fullFile.getName()); // 为文件设置存储路径
			fi.write(file);
		}
		FileInputStream fileInputStream = new FileInputStream(file);
		MultipartFile multipartFile = new MockMultipartFile(file.getName(), file.getName(),
				ContentType.APPLICATION_OCTET_STREAM.toString(), fileInputStream);
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		try {
			readResult = iAdminService.addTeacherInfo(multipartFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv = toTeacherManager();
		mv.addObject("readResult", readResult);//返回信息
		return mv;
	}


	/**
	 * @author LiMing
	 * 增加学生操作，处理EXCEL表
	 * @throws Exception 
	 * */
	@RequestMapping(value="addStudent",method= {RequestMethod.POST})
	public ModelAndView DoExcelStudent(HttpServletRequest request) throws Exception {	
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(4194304); // 设置最大文件尺寸，这里是4MB
		List<FileItem> items = new ArrayList<FileItem>();
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		File file = new File("");
		for(FileItem fi : items) {
			File fullFile = new File(new String(fi.getName().getBytes(), "utf-8")); // 解决文件名乱码问题,获得文件内容
			file = new File(Common.readProperties("path"), fullFile.getName()); // 为文件设置存储路径
			fi.write(file);
		}
		FileInputStream fileInputStream = new FileInputStream(file);
		MultipartFile multipartFile = new MockMultipartFile(file.getName(), file.getName(),
				ContentType.APPLICATION_OCTET_STREAM.toString(), fileInputStream);
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		try {
			//调用ITeacherService 下的方法，完成增加学生
			readResult = iAdminService.addStudentInfo(multipartFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv = toStudentManager();
		mv.addObject("readResult", readResult);//返回信息
		return mv;
	}

	//	/**
	//	 * @author LiMing
	//	 * 读取教师信息
	//	 * */  旧版本方法
	//	@RequestMapping(value="readTeacherInfo",method= {RequestMethod.GET})
	//	public ModelAndView readTeacherInfo() {			
	//		ModelAndView mv = new ModelAndView();
	//		List<Teacher> readResult = new ArrayList<Teacher>();
	//		try {
	//			readResult = iAdminService.readTeacherInfo();
	//		} catch (Exception e) {
	//			e.printStackTrace();
	//		}
	//		mv.addObject("teacherList", readResult);//返回信息
	//		mv.setViewName("/jsp/AdminJsp/teacherManager");//设置返回页面
	//		return mv;
	//	}

	@RequestMapping(value="toTeacherManager",method= {RequestMethod.GET})
	public ModelAndView toTeacherManager() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jsp/AdminJsp/managerForTeacher");//设置返回页面
		return mv;
	}			

	@RequestMapping(value="updateDepartment",method= {RequestMethod.GET})
	public ModelAndView updateDepartment(@RequestParam(value="editId") String editId,@RequestParam(value="editName") String editName) throws Exception {
		ModelAndView mv = new ModelAndView();
		Department de = new Department();
		de.setId(editId);
		de.setName(editName);
		iAdminService.updateDepartment(de);
		mv.setViewName("/jsp/AdminJsp/managerForDepartment");//设置返回页面
		return mv;
	}	
	/**
	 * @author LiMing
	 * 读取教师信息
	 * @throws Exception 
	 * */
	@RequestMapping(value="getTeacherInfo",method= {RequestMethod.GET})
	public void getTeacherInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {		
		System.out.println("访问至后台获取教师数据");
		List<Teacher> readResult = new ArrayList<>();
		try {
			readResult = iAdminService.readTeacherInfo();
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		com.alibaba.fastjson.JSONArray arr=new com.alibaba.fastjson.JSONArray();
		for (Teacher teacher : readResult) {
			JSONObject ob=new JSONObject();
			ob.put("number", teacher.getEmployeeNum());
			ob.put("name", teacher.getTeacherName());
			ob.put("nickName", teacher.getTeacherNickName());
			ob.put("gender", teacher.getTeacherGender());
			ob.put("category", teacher.getTeacherCategory());
			ob.put("status", teacher.getStatus());
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

	//	/**
	//	 * @author LiMing
	//	 * 读取学生信息
	//	 * */ 旧版本方法
	//	@RequestMapping(value="readStudentInfo",method= {RequestMethod.GET})
	//	public ModelAndView readStudentInfo() {			
	//		ModelAndView mv = new ModelAndView();
	//		List<Student> readResult = new ArrayList<Student>();
	//		try {
	//			readResult = iAdminService.readStudentInfo();
	//		} catch (Exception e) {
	//			e.printStackTrace();
	//		}
	//		mv.addObject("studentList", readResult);//返回信息
	//		mv.setViewName("/jsp/AdminJsp/studentManager");//设置返回页面
	//		return mv;
	//	}

	@RequestMapping(value="toStudentManager",method= {RequestMethod.GET})
	public ModelAndView toStudentManager() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jsp/AdminJsp/managerForStudent");//设置返回页面
		return mv;
	}	

	/**
	 * @author LiMing
	 * 读学生信息
	 * @throws Exception 
	 * */
	@RequestMapping(value="getStudentInfo",method= {RequestMethod.GET})
	public void getStudentInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {		
		List<Student> readResult = new ArrayList<>();
		try {
			readResult = iAdminService.readStudentInfo();
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		com.alibaba.fastjson.JSONArray arr=new com.alibaba.fastjson.JSONArray();
		for (Student student : readResult) {
			JSONObject ob=new JSONObject();
			ob.put("number", student.getStudentId());
			ob.put("name", student.getStudentName());
			ob.put("nickName", student.getStudentNickName());
			ob.put("gender", student.getStudentGender());
			ob.put("category", student.getStudentCategory());
			ob.put("profess", student.getProfessional());
			ob.put("class", student.getClassNum());
			ob.put("status", student.getStatus());
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

	/**
	 * @author LiMing
	 * 添加分类
	 * */
	@RequestMapping(value="addCategory",method= {RequestMethod.POST})
	public ModelAndView addCategory(@RequestParam(value="categoryNum") String categoryNum,@RequestParam(value="categoryName") String categoryName,@RequestParam(value="categoryDetail") String categoryDetail) {			
		ModelAndView mv = new ModelAndView();
		try {
			Category category = new Category();
			category.setCategoryDetail(categoryDetail);
			category.setCategoryName(categoryName);
			category.setCategoryNum(categoryNum);
			category.setCategoryId(Common.uuid());
			List<Category> categories = new ArrayList<Category>();
			categories.add(category);
			iAdminService.addCategory(categories);
			mv = toCategoryManager();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/jsp/AdminJsp/managerForCategory");//设置返回页面
		return mv;
	}

	/**
	 * @author LiMing
	 * 更新分类
	 * @throws Exception 
	 * */
	@RequestMapping(value="updateCategory",method= {RequestMethod.POST})
	public ModelAndView updateCategory(@RequestParam(value="editCategoryNum") String editCategoryNum,@RequestParam(value="categoryId") String categoryId,@RequestParam(value="editCategoryName") String editCategoryName,@RequestParam(value="editCategorDetail") String editCategorDetail) throws Exception {			
		ModelAndView mv = new ModelAndView();
		Category category = new Category();
		category.setCategoryId(categoryId);
		category.setCategoryDetail(editCategorDetail);
		category.setCategoryName(editCategoryName);
		category.setCategoryNum(editCategoryNum);
		iAdminService.updateCategory(category);
		mv.setViewName("/jsp/AdminJsp/managerForCategory");//设置返回页面
		return mv;
	}

	/**
	 * @author LiMing
	 * 登陆管理员操作
	 * */
	@RequestMapping(value="LoginAdmin",method= {RequestMethod.GET})
	public ModelAndView LoginAdmin(@RequestParam(value="employeeNum") String adminUsername,@RequestParam(value="password") String adminPassword,HttpServletRequest request) {			
		ModelAndView mv = new ModelAndView();
		String readResult =null;
		Admin admin = new Admin();
		try {
			admin = iAdminService.loginAdmin(adminUsername);
			String password=Common.eccryptMD5(adminPassword);
			if(password.equals(admin.getAdminPassword()))
			{	
				//mv = readTeacherInfo();//登陆成功之后调用另一个函数,进入index页面
				mv.setViewName("/jsp/AdminJsp/mainManager");//设置返回页面
				request.getSession().setAttribute("admin", admin);//将amdin 放入session
			}
			else {
				readResult = "密码输入不正确";	
				mv.addObject("readResult", readResult);//返回信息
				mv.addObject("admin", admin);
				mv.setViewName("/jsp/Teacher/index");//设置返回页面
			}
		} catch (Exception e) {
			readResult = "账号输入不正确";
			mv.addObject("readResult", readResult);//返回信息
			mv.setViewName("/jsp/Teacher/index");//设置返回页面
			e.printStackTrace();
		}
		return mv;
	}


	//	/**
	//	 * @author LiMing
	//	 * 重置学生密码
	//	 * */   旧版本方法
	//	@RequestMapping(value="resetStudentPassword/{studentId}",method= {RequestMethod.GET})
	//	public ModelAndView resetStudentPassword(@PathVariable String studentId) {			
	//		ModelAndView mv = new ModelAndView();
	//		String readResult =null;
	//		try {
	//			readResult = iAdminService.resetStudentPassword(studentId);
	//		} catch (Exception e) {
	//			e.printStackTrace();
	//		}
	//		mv.addObject("resetStudentPasswordMsg", readResult);//返回信息
	//		mv = readStudentInfo();
	//		return mv;
	//	}

	//	/**
	//	 * @author LiMing
	//	 * 重置老师密码
	//	 * */               旧版本后台方法
	//	@RequestMapping(value="resetTeacherPassword/{employeeNum}",method= {RequestMethod.GET})
	//	public ModelAndView resetTeacherPassword(@PathVariable String employeeNum) {			
	//		ModelAndView mv = new ModelAndView();
	//		String readResult =null;
	//		try {
	//			readResult = iAdminService.resetTeacherPassword(employeeNum);
	//		} catch (Exception e) {
	//			e.printStackTrace();
	//		}
	//		mv.addObject("resetTeacherPasswordMsg", readResult);//返回信息
	//		mv = readTeacherInfo();
	//		return mv;
	//	}

	/**
	 * @author LiMing
	 * 重置老师密码
	 * */
	@RequestMapping(value="resetTeacherPassword/{employeeNum}",method= {RequestMethod.GET})
	public void resetTeacherPassword(HttpServletRequest request,HttpServletResponse response,@PathVariable String employeeNum) {			
		String readResult =null;
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			readResult = iAdminService.resetTeacherPassword(employeeNum);
			readResult = "密码(123456)初始化成功";
		} catch (Exception e) {
			readResult = "密码初始化失败";
			e.printStackTrace();
		}
		try {
			response.getWriter().print(readResult);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @author LiMing
	 * 重置学生密码
	 * */
	@RequestMapping(value="resetStudentPassword/{employeeNum}",method= {RequestMethod.GET})
	public void resetStudentPassword(HttpServletRequest request,HttpServletResponse response,@PathVariable String employeeNum) {			
		String readResult =null;
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			readResult = iAdminService.resetStudentPassword(employeeNum);
			readResult = "密码(123456)初始化成功";
		} catch (Exception e) {
			readResult = "密码初始化失败";
			e.printStackTrace();
		}
		try {
			response.getWriter().print(readResult);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @author LiMing
	 * 系部管理跳转方法
	 * */
	@RequestMapping(value="toCategoryManager",method= {RequestMethod.GET})
	public ModelAndView toCategoryManager() {			
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jsp/AdminJsp/managerForCategory");//设置返回页面
		return mv;
	}

	/**
	 * @author LiMing
	 * 读学生信息
	 * @throws Exception 
	 * */
	@RequestMapping(value="getCategoryInfo",method= {RequestMethod.GET})
	public void getCategoryInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {		
		List<Category> readResult = new ArrayList<>();
		try {
			readResult = iAdminService.readCategory();
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		com.alibaba.fastjson.JSONArray arr=new com.alibaba.fastjson.JSONArray();
		for (Category ca : readResult) {
			JSONObject ob=new JSONObject();
			ob.put("id", ca.getCategoryId());
			ob.put("categoryNum", ca.getCategoryNum());
			ob.put("categoryName", ca.getCategoryName());
			ob.put("categoryDetail", ca.getCategoryDetail());
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
	//	/**
	//	 * @author LiMing
	//	 * 读取系部信息
	//	 * */  旧版本方法
	//	@RequestMapping(value="readCategories",method= {RequestMethod.GET})
	//	public ModelAndView readCategories() {			
	//		ModelAndView mv = new ModelAndView();
	//		List<Category> readResult = new ArrayList<Category>();
	//		try {
	//			readResult = iAdminService.readCategory();
	//		} catch (Exception e) {
	//			e.printStackTrace();
	//		}
	//		for (Category category : readResult) {
	//			System.out.println(category.toString());
	//		}
	//		mv.addObject("categoryList", readResult);//返回信息
	//		mv.setViewName("/jsp/AdminJsp/categoryManager");//设置返回页面
	//		return mv;
	//	}


	/**
	 * @author LiMing
	 * 读取实体班级信息
	 * */
	@RequestMapping(value="toRealClassManager",method= {RequestMethod.GET})
	public ModelAndView toRealClassManager() {			
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jsp/AdminJsp/managerForRealClass");//设置返回页面
		return mv;
	}

	/**
	 * @author LiMing
	 * 读取实体班级信息
	 * */
	@RequestMapping(value="readRealClassInfo",method= {RequestMethod.GET})
	public void readRealClassInfo(HttpServletRequest request,HttpServletResponse response) {			
		List<RealClass> readResult = new ArrayList<RealClass>();
		try {
			readResult = iTeacherService.readRealClass(null);
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		com.alibaba.fastjson.JSONArray arr=new com.alibaba.fastjson.JSONArray();
		for (RealClass ca : readResult) {
			JSONObject ob=new JSONObject();
			ob.put("number", ca.getRealClassNum());
			ob.put("amount", ca.getRealPersonNum());
			ob.put("category", ca.getRealClassCategory());
			arr.add(ob);
		}
		String result = arr.toString();
		try {
			response.getWriter().print(result);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}


	/**
	 * @author LiMing
	 * 增加实体班级信息
	 * */
	@RequestMapping(value="updateRealClass",method= {RequestMethod.GET})
	public ModelAndView updateRealClass( @RequestParam("realClassNum")String realClassNum,@RequestParam("category")String category,@RequestParam("realClassPersonNum")String realClassPersonNum,HttpServletRequest request) {			
		ModelAndView mv = new ModelAndView();
		RealClass realClass = new RealClass();
		realClass.setRealClassCategory(category);
		realClass.setRealClassNum(realClassNum);
		realClass.setRealPersonNum(Integer.parseInt(realClassPersonNum));
		try {
			iAdminService.updateRealClass(realClass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv = toRealClassManager();
		return mv;
	}


	/**
	 * @author LiMing
	 * 增加实体班级信息
	 * */
	@RequestMapping(value="addRealClass",method= {RequestMethod.GET})
	public ModelAndView AddRealClass( @RequestParam("realClassNum")String realClassNum,@RequestParam("category")String category,@RequestParam("realClassPersonNum")String realClassPersonNum,HttpServletRequest request) {			
		ModelAndView mv = new ModelAndView();
		RealClass realClass = new RealClass();
		realClass.setRealClassCategory(category);
		realClass.setRealClassNum(realClassNum);
		realClass.setRealPersonNum(Integer.parseInt(realClassPersonNum));
		List<RealClass> realCLassList = new ArrayList<RealClass>();
		realCLassList.add(realClass);
		try {
			iAdminService.addRealClass(realCLassList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv = toRealClassManager();
		return mv;
	}
	/**
	 * @author LiMing
	 * 学术管理页面
	 * */
	@RequestMapping(value="toAcademicManager",method= {RequestMethod.GET})
	public ModelAndView toAcademicManager() {			
		ModelAndView mv = new ModelAndView();
		List<Department> departmentList = new ArrayList<>();
		try {
			departmentList = iAdminService.readDepartment();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.addObject("departmentList",departmentList);
		mv.setViewName("/jsp/AdminJsp/managerForAcademic");
		return mv;
	}

	@RequestMapping(value="getAcademicInfo",method= {RequestMethod.GET})
	public void getAcademicInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {			
		List<Academic> readResult = new ArrayList<Academic>();
		try {
			readResult = iAdminService.readAcademicInfo();
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		com.alibaba.fastjson.JSONArray arr=new com.alibaba.fastjson.JSONArray();
		for (Academic ca : readResult) {
			JSONObject ob=new JSONObject();
			ob.put("id", ca.getId());
			ob.put("department", iAdminService.readDepartmentByNum(ca.getDepartment()).getName());
			ob.put("name", ca.getName());
			ob.put("professional", ca.getProfessional());
			ob.put("time", ca.getTime().toString());
			arr.add(ob);
		}
		String result = arr.toString();
		try {
			response.getWriter().print(result);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	@RequestMapping(value="readDepartmentInfo",method= {RequestMethod.GET})
	public void readDepartmentInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {			
		List<Department> readResult = new ArrayList<Department>();
		try {
			readResult = iAdminService.readAllDepartment();
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		com.alibaba.fastjson.JSONArray arr=new com.alibaba.fastjson.JSONArray();
		for (Department ca : readResult) {
			JSONObject ob=new JSONObject();
			ob.put("id", ca.getId());
			ob.put("name", ca.getName());
			ob.put("num", ca.getNum());
			ob.put("deleteFlag", ca.getDeleteFlag());
			arr.add(ob);
		}
		String result = arr.toString();
		try {
			response.getWriter().print(result);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}


	/**
	 * @author LiMing
	 * 管理员个人信息
	 * */
	@RequestMapping(value="toAdminInfo",method= {RequestMethod.GET})
	public ModelAndView toAdminInfo(HttpServletRequest request) {			
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jsp/AdminJsp/managerForAdmin");
		return mv;
	}

	/**
	 * @author LiMing
	 * 更新教师信息
	 * @throws Exception 
	 * */
	@RequestMapping(value="updateTeacher")
	public ModelAndView updateTeacher( @RequestParam("teacherId")String teacherId, @RequestParam("teacherIdB")String teacherIdB,@RequestParam("teacherName")String teacherName,@RequestParam("select")String select,HttpServletRequest request) throws Exception {			
		ModelAndView mv = new ModelAndView();
		Teacher teacher = new Teacher();
		Teacher t = null;
		teacher = iTeacherService.teacherLoginByEmployeeNum(teacherId);
		//当教师的工号不存在时：在旧信息基础上修改个人信息,为插入教师
		if(teacher==null)
		{
			t = new Teacher();
			//查到旧信息，将旧信息部分修改
			t = iTeacherService.teacherLoginByEmployeeNum(teacherIdB);
			t.setEmployeeNum(teacherId);
			t.setTeacherName(teacherName);
			t.setTeacherGender(select);
			//职工号为新时，添加新教师，旧信息不删除
			iAdminService.addOneTeacher(t);
		}else {
			//当教师职工号存在时，更新下信息
			teacher.setTeacherName(teacherName);
			teacher.setTeacherGender(select);
			iTeacherService.UpdateTeacher(teacher);
		}
		mv = toTeacherManager();
		return mv;
	}



	@RequestMapping(value="addOneTeacher")
	public ModelAndView addOneTeacher(@RequestParam("addTeacherNum")String addTeacherNum,@RequestParam("addTeacherName")String addTeacherName,@RequestParam("addSelect")String addSelect) throws Exception {			
		ModelAndView mv = new ModelAndView();
		Teacher te = new Teacher();
		te.setEmployeeNum(addTeacherNum);
		te.setTeacherName(addTeacherName);
		te.setTeacherGender(addSelect);
		String pwd = Common.eccryptMD5("123456");
		te.setTeacherPassword(pwd);
		try {
			iAdminService.addOneTeacher(te);
		} catch (Exception e) {
			e.printStackTrace();
			mv = toTeacherManager();
		}
		mv = toTeacherManager();
		return mv;
	}

	/**
	 * @author LiMing
	 * 查询工号是否重复
	 * @throws Exception 
	 * 此方法：接收到前台的教师工号，进行查询数据。
	 * 初始的teacher 为空
	 * 查询到老师数据，若为空，则修改数据的工号没有重复，若不为空，则有重复
	 * 但是，如果前台工号没有变，则此处也有数据
	 * */
	@RequestMapping(value="verificationTeacherId/{employeeNum}")
	public void verificationTeacherId(HttpServletRequest request,@PathVariable String employeeNum, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache"); 
		String msg = null;//返回信息 
		Teacher teacher = null;
		teacher = iTeacherService.teacherLoginByEmployeeNum(employeeNum);
		if(teacher!=null)
		{
			msg = "工号已存在";			
		}
		response.getWriter().print(msg);
	}

	/**
	 *@author LiMing
	 * 更新学生信息
	 * @throws Exception
	 * */
	@RequestMapping(value="updateStudent")
	public ModelAndView updateStudent(@RequestParam("studentId")String studentId,@RequestParam("studentIdB")String studentIdB,@RequestParam("studentName")String studentName,@RequestParam("select")String studentGender,HttpServletRequest request) throws Exception {			
		ModelAndView mv = new ModelAndView();
		Student student = new Student();
		Student s = null;
		student = iStudentService.studentLoginByEmployeeNum(studentId);
		if(student==null)
		{
			//查询到旧学生信息，将部分信息修改
			s = iStudentService.studentLoginByEmployeeNum(studentIdB);
			s.setStudentId(studentId);
			s.setStudentName(studentName);
			s.setStudentGender(studentGender);
			iAdminService.addOneStudent(student);
		}else {
			student.setStudentName(studentName);
			student.setStudentGender(studentGender);
			iStudentService.updateStudent(student);	
		}
		mv = toStudentManager();
		return mv;
	}

	/**
	 * @author LiMing
	 * 查询学号是否重复
	 * @throws Exception 
	 * */
	@RequestMapping(value="verificationStudentId/{studentId}")
	public void verificationStudentId(HttpServletRequest request,@PathVariable String studentId, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache"); 
		String msg = null;//返回信息
		Student student = null;
		student = iStudentService.studentLoginByEmployeeNum(studentId);
		if(student!=null)
		{
			msg = "学号已存在";			
		}
		response.getWriter().print(msg);
	}

	/**
	 * @author LiMing
	 * 跳转成果管理
	 * @throws Exception 
	 * */
	@RequestMapping(value="toAchievementManager")
	public ModelAndView toAchievementManager(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("/jsp/AdminJsp/managerForAchievement");
		return mv;
	}

	@RequestMapping(value="toDepartmentManager")
	public ModelAndView toDepartmentManager(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("/jsp/AdminJsp/managerForDepartment");
		return mv;
	}

	/**
	 * @author LiMing
	 * 读学生信息
	 * @throws Exception 
	 * */
	@RequestMapping(value="getAchievmentInfo",method= {RequestMethod.GET})
	public void getAchievmentInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {		
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		List<AOCSC> aocscList =new ArrayList<>();
		List<CourseExpand> courseExpandList =new ArrayList<>();
		List<GDFCS> gdfcsList =new ArrayList<>();
		List<SIAE> siaeList =new ArrayList<>();
		List<IURP> iURPList =new ArrayList<>();
		try {
			aocscList = iAchievementService.queryAllAOCSC();
			courseExpandList = iAchievementService.queryAllCourseExpand();
			gdfcsList = iAchievementService.queryAllGDFCS();
			siaeList = iAchievementService.queryAllSIAE();
			iURPList = iAchievementService.queryAllIURP();
		} catch (Exception e) {
			e.printStackTrace();
		}
		com.alibaba.fastjson.JSONArray arr=new com.alibaba.fastjson.JSONArray();
		for (AOCSC ca : aocscList) {
			Student stu = iStudentService.studentLoginByEmployeeNum(ca.getUploadAuthorId());
			JSONObject ob=new JSONObject();
			ob.put("id", ca.getAchievementId());
			ob.put("picture", ca.getFirstPicture());
			ob.put("name", ca.getAchievementName());
			ob.put("category", ca.getAchievementCategory());
			ob.put("publisher", stu.getStudentName());
			ob.put("deleteFlag", ca.getDeleteFlag());
			ob.put("browsePath", "toDetailAOCSC?achievementId="+ca.getAchievementId());
			ob.put("deleteOrRestore", ca.getAchievementId()+",大学生竞赛作品");
			arr.add(ob);
		}
		for (CourseExpand ca : courseExpandList) {
			Student stu = iStudentService.studentLoginByEmployeeNum(ca.getUploadAuthorId());
			JSONObject ob=new JSONObject();
			ob.put("id", ca.getAchievementId());
			ob.put("picture", ca.getFirstPicture());
			ob.put("name", ca.getAchievementName());
			ob.put("category", ca.getAchievementCategory());
			ob.put("publisher", stu.getStudentName());
			ob.put("deleteFlag", ca.getDeleteFlag());
			ob.put("browsePath", "toDetailCourseExpand?achievementId="+ca.getAchievementId());
			ob.put("deleteOrRestore", ca.getAchievementId()+",课程拓展");
			arr.add(ob);
		}
		for (GDFCS ca : gdfcsList) {
			Student stu = iStudentService.studentLoginByEmployeeNum(ca.getUploadAuthorId());
			JSONObject ob=new JSONObject();
			ob.put("id", ca.getAchievementId());
			ob.put("picture", ca.getFirstPicture());
			ob.put("name", ca.getAchievementName());
			ob.put("category", ca.getAchievementCategory());
			ob.put("publisher", stu.getStudentName());
			ob.put("deleteFlag", ca.getDeleteFlag());
			ob.put("browsePath", "toDetailGDFCS?achievementId="+ca.getAchievementId());
			ob.put("deleteOrRestore", ca.getAchievementId()+",毕业设计");
			arr.add(ob);
		}
		for (SIAE ca : siaeList) {
			Student stu = iStudentService.studentLoginByEmployeeNum(ca.getUploadAuthorId());
			JSONObject ob=new JSONObject();
			ob.put("id", ca.getAchievementId());
			ob.put("picture", ca.getFirstPicture());
			ob.put("name", ca.getAchievementName());
			ob.put("category", ca.getAchievementCategory());
			ob.put("publisher", stu.getStudentName());
			ob.put("deleteFlag", ca.getDeleteFlag());
			ob.put("browsePath", "toDetailSIAE?achievementId="+ca.getAchievementId());
			ob.put("deleteOrRestore", ca.getAchievementId()+",大学生创新创业");
			arr.add(ob);
		}
		for (IURP ca : iURPList) {
			Student stu = iStudentService.studentLoginByEmployeeNum(ca.getUploadAuthorId());
			JSONObject ob=new JSONObject();
			ob.put("id", ca.getProjectId());
			ob.put("picture", ca.getFirstPicture());
			ob.put("name", ca.getProjectName());
			ob.put("category", ca.getProjectCategory());
			ob.put("publisher", stu.getStudentName());
			ob.put("deleteFlag", ca.getDeleteFlag());
			ob.put("browsePath", "toDetailIURP?achievementId="+ca.getProjectId());
			ob.put("deleteOrRestore", ca.getProjectId()+",产学研");
			arr.add(ob);
		}
		String result = arr.toString();
		try {
			response.getWriter().print(result);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	@RequestMapping(value="deleteAchievement/{achievementId}")
	public void deleteAchievement(HttpServletRequest request,HttpServletResponse response,@PathVariable String achievementId) throws Exception {
		String[] myList = new String[2];
		myList = achievementId.split(",");
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		switch (myList[1]) {
		case "产学研":
			iAchievementService.deleteIURP(myList[0]);
			break;
		case "课程拓展":
			iAchievementService.deleteCourseExpand(myList[0]);
			break;
		case "毕业设计":
			iAchievementService.deleteGDFCS(myList[0]);
			break;
		case "大学生创新创业":
			iAchievementService.deleteSIAE(myList[0]);
			break;
		case "大学生竞赛作品":
			iAchievementService.deleteAOCSC(myList[0]);
			break;
		default:
			break;
		}
		response.getWriter().print("删除成功");
	}

	@RequestMapping(value="restoreAchievement/{achievementId}")
	public void restoreAchievement(HttpServletRequest request,HttpServletResponse response,@PathVariable String achievementId) throws Exception {
		String[] myList = new String[2];
		myList = achievementId.split(",");
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		switch (myList[1]) {
		case "产学研":
			iAchievementService.restoreIURP(myList[0]);
			break;
		case "课程拓展":
			iAchievementService.restoreCourseExpand(myList[0]);
			break;
		case "毕业设计":
			iAchievementService.restoreGDFCS(myList[0]);
			break;
		case "大学生创新创业":
			iAchievementService.restoreSIAE(myList[0]);
			break;
		case "大学生竞赛作品":
			iAchievementService.restoreAOCSC(myList[0]);
			break;
		default:
			break;
		}
		response.getWriter().print("恢复成功");
	}

	@RequestMapping(value="deleteDepartment/{departmentId}")
	public void deleteDepartment(HttpServletRequest request,HttpServletResponse response,@PathVariable String departmentId) throws Exception {
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
			iAdminService.deleteDepartment(departmentId);
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		response.getWriter().print("删除成功");
	}

	@RequestMapping(value="resotreDepartment/{departmentId}")
	public void resotreDepartment(HttpServletRequest request,HttpServletResponse response,@PathVariable String departmentId) throws Exception {
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
			iAdminService.resotreDepartment(departmentId);
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		response.getWriter().print("恢复成功");
	}

	@RequestMapping(value="addDepartment")
	public ModelAndView addDepartment(@RequestParam("departmentName")String departmentName,@RequestParam("departmentNum")String departmentNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		Department de = new Department();
		de.setDeleteFlag(1);
		de.setName(departmentName);
		de.setNum(Integer.parseInt(departmentNum));
		de.setId(Common.uuid());
		try {
			iAdminService.addDepartment(de);
			mv.setViewName("/jsp/AdminJsp/managerForDepartment");
		} catch (Exception e) {
			mv.setViewName("/jsp/AdminJsp/managerForDepartment");
		}
		return mv;
	}

	@RequestMapping(value="judgeDepartmentNum/{departmentNum}")
	public void judgeDepartmentNum(HttpServletRequest request,HttpServletResponse response,@PathVariable String departmentNum) throws Exception {
		String result = null;
		Department de = null;
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
			de = iAdminService.readDepartmentByNum(departmentNum);
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		if(de !=null)
		{
			result = "学术委员会编号已经存在";
		}
		response.getWriter().print(result);
	}

	@RequestMapping(value="updateAcademic")
	public ModelAndView updateAcademic(@RequestParam("editId")String editId,@RequestParam("editName")String editName,@RequestParam("editPro")String editPro,@RequestParam("editSe")String editSe) throws Exception {
		ModelAndView mv = new ModelAndView();
		Academic ac = new Academic();
		ac.setId(editId);
		ac.setName(editName);
		ac.setProfessional(editPro);
		ac.setDepartment(editSe);
		try {
			iAdminService.updateAcademic(ac);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv = toAcademicManager();
		return mv;
	}

	@RequestMapping(value="addAcademic")
	public ModelAndView addAcademic(@RequestParam("addName")String addName,@RequestParam("selectAdd")String selectAdd,@RequestParam("addPro")String addPro,@RequestParam("addTime")String addTime) throws Exception {
		ModelAndView mv = new ModelAndView();
		Timestamp ts = new Timestamp(System.currentTimeMillis());   
		String tsStr = addTime + " 00:00:00";   
		try {   
			ts = Timestamp.valueOf(tsStr);   
			System.out.println(ts);   
		} catch (Exception e) {   
			e.printStackTrace();   
		}  
		Academic ac = new Academic();
		ac.setId(Common.uuid());
		ac.setName(addName);
		ac.setProfessional(addPro);
		ac.setDepartment(selectAdd);
		ac.setTime(ts);
		try {
			iAdminService.addAcademic(ac);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv = toAcademicManager();
		return mv;
	}

	@RequestMapping(value="logout")
	public ModelAndView logout(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		request.getSession().removeAttribute("admin");
		mv.setViewName("/jsp/main");
		return mv;
	}

	@RequestMapping(value="toTerm")
	public ModelAndView toTerm() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jsp/AdminJsp/managerForTerm");
		return mv;
	}

	@RequestMapping(value="addTerm")
	public ModelAndView addTerm(@RequestParam("addStartTerm")String addStartTerm,@RequestParam("addEndTerm")String addEndTerm,@RequestParam("selectTerm")String selectTerm) throws Exception {
		ModelAndView mv = new ModelAndView();
		Term te = new Term();
		try {
			te.setEndYear(addEndTerm);
			te.setStartYear(addStartTerm);
			te.setTermId(Common.uuid());
			te.setTerm(selectTerm);
			iAdminService.addTerm(te);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv = toTerm();
		return mv;
	}

	@RequestMapping(value="updateAdmin")
	public ModelAndView updateAdmin(HttpServletRequest request,HttpServletResponse response,@RequestParam("id")String id,@RequestParam("editName")String editName,@RequestParam("newPas")String newPas) throws Exception {
		ModelAndView mv = new ModelAndView();
		String name = editName;
		String pas = Common.eccryptMD5(newPas);
		Admin admin = new Admin();
		admin.setAdminId(Integer.parseInt(id));
		admin.setAdminPassword(pas);
		admin.setAdminUsername(name);
		try {
			iAdminService.updateAdmin(admin);
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		mv = toAdminInfo(request);
		return mv;
	}

	@RequestMapping(value="addTermJudge")
	public void addTermJudge(HttpServletRequest request,HttpServletResponse response,@RequestParam("addStartTerm")String addStartTerm,@RequestParam("addEndTerm")String addEndTerm,@RequestParam("selectTerm")String selectTerm) throws Exception {
		Term te = null;
		String result = "";
		try {
			te = iAdminService.judgeTerm(addStartTerm,addEndTerm,selectTerm);
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		if(te!=null)
		{
			result = "学期信息已经存在";
		}
		try {
			response.getWriter().print(result);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}


	@RequestMapping(value="readTerm")
	public void readTerm(HttpServletRequest request,HttpServletResponse response) throws Exception {
		List<Term> readResult = new ArrayList<>();
		try {
			readResult = iTeacherService.readTerm();
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		com.alibaba.fastjson.JSONArray arr=new com.alibaba.fastjson.JSONArray();
		for (Term t : readResult) {
			JSONObject ob=new JSONObject();
			ob.put("id", t.getTermId());
			ob.put("startYear", t.getStartYear());
			ob.put("endYear", t.getEndYear());
			ob.put("term", t.getTerm());
			arr.add(ob);
		}
		String result = arr.toString();
		try {
			response.getWriter().print(result);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	@RequestMapping(value="getAdminInfo")
	public void getAdminInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		Admin a = new Admin();
		a = (Admin) request.getSession().getAttribute("admin");
		com.alibaba.fastjson.JSONArray arr=new com.alibaba.fastjson.JSONArray();
		JSONObject ob=new JSONObject();
		ob.put("id", a.getAdminId());
		ob.put("name",a.getAdminUsername());
		arr.add(ob);
		String result = arr.toString();
		try {
			response.getWriter().print(result);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	@RequestMapping(value="judgePas")
	public void judgePas(HttpServletRequest request,HttpServletResponse response,@RequestParam("pas")String pas) throws Exception {
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String result = "";
		Admin a = new Admin();
		a = (Admin) request.getSession().getAttribute("admin");
		String password=Common.eccryptMD5(pas);
		try {
			if(!password.equals(a.getAdminPassword()))
			{
				result="密码输入不正确,重新输入";
			}
			response.getWriter().print(result);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
}

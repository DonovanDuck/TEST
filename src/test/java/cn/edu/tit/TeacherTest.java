package cn.edu.tit;

import java.awt.image.DataBufferFloat;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.RealClass;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Task;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.bean.Term;
import cn.edu.tit.bean.VirtualClass;
import cn.edu.tit.common.Common;
import cn.edu.tit.idao.ITeacherDao;
import cn.edu.tit.iservice.ITeacherService;
import cn.edu.tit.iservice.iserviceImpl.TeacherServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:applicationContext.xml"}) 
public class TeacherTest {

	@Resource
	private ITeacherService teacherService;
	@Resource

	private ITeacherDao teacherDao;
	@Before  
	public void before() {  
		System.out.println("测试开始");
	}  
	//	  @Test
	//
	//	  public void createCourse() {
	//		//  Course course = new Course(null, "妹妹", "菲菲胡哨", 9, "17693280903", "home/wenli/program");
	//
	//		  
	//		  //teacherService.createCourse(course);
	//		  //teacherService.createCourse(course);
	//	  }
	//	  @Test
	//	  public void publishTask() throws Exception {
	//		  String uuid = Common.uuid();
	//		  Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	//		  Integer point = teacherService.searchTaskPoint("work");
	////		  Task task = new Task(uuid, "实验四", "实验描述 实验描述 实验描述 实验描述 实验描述 实验描述 实验描述 实验描述 实验描述 ", timestamp, null, "123456", "", null, "test", 0, point, null);
	////		  teacherService.createTask(task);
	//		  teacherService.mapClassTask("E56FE27F03344091BE8BDD698426EC22", uuid);
	//	  }
	//	  @Test
	//	  public void createVirtualClass() throws Exception {
	//		
	//		  Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	//		  String uuid = Common.uuid();
	//		  VirtualClass virtualClass = new VirtualClass(uuid, "华丽互杀", "17693280903", timestamp, "yuhbnjimkonhgvftvgybhnj", 1, "/home/src", null, null);
	//		  teacherService.createVirtualClass(virtualClass);
	//	//	  
	//		  teacherService.mapVirtualRealClass("1520561", uuid);
	//		  teacherService.mapVirtualRealClass("1520562", uuid);
	//	
	//	  }
	//	  @Test
	//	  public void updateCourse() {
	//		  
	//
	//		//  Course course = new Course(9, "语文", "奇迹星桥胡哨", 6, "17693280903", "home/wenli/program");
	//		//  teacherService.updateCourse(course);
	//	  }
	//	  @Test
	//	  public void courseList() {
	//		  List<String> a = new ArrayList<String>();
	//		  a.add("刘音");
	//		  a.add("李明");
	//		  System.out.println(a);
	//
	//	  }
	//	  @Test 
	//	  public void studentList() throws Exception {
	//		  
	//		  List<String> realClasses= teacherService.searchRealClassNum("");
	//		  List<Student> students = new ArrayList<Student>();
	//		  
	//		  for (String classNum : realClasses) {
	//			  //students.addAll(teacherService.studentList(classNum));
	//		}
	//	  }
		  @Test
		  public void MD5test() {
			  
			  String password=null;
			  try {
				System.out.println(Common.eccryptMD5("1"));
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  }

	@Test
	public void loginTest() throws Exception {
		//		List<Course> list = new ArrayList<Course>();
		//		list = teacherService.readCourseInfoByCategory("1");
		//		for (Course course : list) {
		//			System.out.println(course.toString());
		//			List<RealClass> list = new ArrayList<RealClass>();
		//			list = teacherService.readRealClasss();
		//			for (RealClass realClass : list) {
		//				System.out.println(realClass.toString());
		//				List<Course> list = new ArrayList<Course>();
		//				list = teacherService.readCourse("数据结构");
		//				for (Course course : list) {
		//					System.out.println(course.toString());
		//				}


		/**
		 * 添加课程
		 * */
		//		Course course = null;
		//		Common common = new Common();
		//		for (int j = 0; j <15; j++) {
		//			String courseId = null;
		//			course = new Course();
		//			course.setCourseName("数据结构"+j);
		//			courseId = common.uuid();
		//			course.setCourseId(courseId);
		//			course.setCourseStudentNum(j+10);
		//			course.setFaceImg(null);
		//			course.setPublishTime(null);
		//			course.setFine(null);
		//			course.setCourseDetail("这是一门课");
		//			course.setPublisherId("011001");
		//			course.setCourseCategory(2);
		//			teacherService.createCourse(course);
		//		}

		//		List<Term> list = new ArrayList<Term>();
		//		list = teacherService.readTerm();
		//		for(Term term : list) {
		//			System.out.println(term.toString());
		//		}

		//		Course course = new Course();
		//		course  = teacherService.readCourseByCourseId("1A2677BCE8594458A70C47B1D55449B9");
		//		System.out.println(course.toString());


		/**
		 * 测试查询实体班级
		 * */
		//		List<RealClass> real = new ArrayList<RealClass>();
		//		real = teacherService.readRealClass(null);
		//		for (RealClass realClass : real) {
		//			System.out.println(realClass.toString());
		//		}
		//		List<String> real = new ArrayList<String>();
		//		List<RealClass> rl = new ArrayList<RealClass>();
		//		String a = "11111";
		//		String b = "123456";
		//		real.add(a);
		//		real.add(b);
		//		rl = teacherService.readRealClass(a);
		//		for (RealClass realClass : rl) {
		//			System.out.println(realClass.toString());

		//		List<Map<Integer, String>> resourceCategories = new ArrayList<Map<Integer,String>>();
		//		resourceCategories = teacherService.readResourceCategoried();
		//		for (Map<Integer, String> map : resourceCategories) {
		//			System.out.println(map.keySet());
		//			System.out.println(map.values());
		//		}

		//		List<cn.edu.tit.bean.Resource> list = new ArrayList<cn.edu.tit.bean.Resource>();
		//		list = teacherService.readResourceByType("1");
		//		for (cn.edu.tit.bean.Resource resource : list) {
		//			System.out.println(resource.toString());
		//		}
	}
	@Test
	public void  timeTest() {
		List<RealClass> list = new ArrayList<RealClass>();
		list = teacherService.readRealClassToSelect("12");
		for (RealClass realClass : list) {
			System.out.println(realClass.toString());
		}
	}
}



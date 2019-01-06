package cn.edu.tit;

import java.awt.image.DataBufferFloat;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.bean.VirtualClass;
import cn.edu.tit.common.Common;
import cn.edu.tit.idao.ITeacherDao;
import cn.edu.tit.iservice.ITeacherService;
import cn.edu.tit.iservice.iserviceImpl.TeacherServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:applicationContext.xml"}) 
public class TeacherTest {
	//  private ApplicationContext ac = null;  
	
	
	//   
	//	@Resource
	//	private IUserService userS;
	//    @Resource
	//    private ICourseService courseSerivce;
	//    @Resource
	//    private ICourseDao courseDao;
		@Resource
		private ITeacherService teacherService;
	  @Resource
	  
	  private ITeacherDao teacherDao;
	  @Before  
	  public void before() {  
	      System.out.println("测试开始");
	      
	      
	  }  
	  @Test
	  public void createCourse() {
		  Course course = new Course(null, "妹妹", "菲菲胡哨", 9, "17693280903", "home/wenli/program");
		  
		  //teacherService.createCourse(course);
		  //teacherService.createCourse(course);
		
	  }
	  @Test
	  public void createVirtualClass() {
		
		  Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	//	  VirtualClass virtualClass = new VirtualClass("uuid", "华丽互杀", "17693280903", timestamp, "yuhbnjimkonhgvftvgybhnj", 3, "/home/src", null);
	//	  teacherService.createVirtualClass(virtualClass);
	//	  
	//	  teacherService.mapVirtualRealClass("1520561", "uuid");
	//	  teacherService.mapVirtualRealClass("1520562", "uuid");
	
	  }
	  @Test
	  public void updateCourse() {
		  
		  Course course = new Course(9, "语文", "奇迹星桥胡哨", 6, "17693280903", "home/wenli/program");
		//  teacherService.updateCourse(course);
	  }
	  @Test
	  public void courseList() {
		  List<String> a = new ArrayList<String>();
		  a.add("刘音");
		  a.add("李明");
		  System.out.println(a);
		//  List<Course> c = teacherService.courseList("17693280903");
				  
	//	  for(Course course : c ) {
	//		  System.out.println(course.getCourseId());
	//	  }
	  }
	  @Test 
	  public void studentList() throws Exception {
		  
		  List<String> realClasses= teacherService.searchRealClassNum("");
		  List<Student> students = new ArrayList<Student>();
		  
		  for (String classNum : realClasses) {
			  //students.addAll(teacherService.studentList(classNum));
		}
	  }
	  @Test
	  public void MD5test() {
		  
		  String password=null;
		  try {
			System.out.println(Common.eccryptMD5("123456"));
			
//			for(int i=0;i<Common.eccryptSHA("123456").length;i++) {
//				System.out.print(Common.eccryptMD5("123456")[i]);
//			}
			//-3110-365773-7089-85-6686-3287-1415-12062
			//-3110-365773-7089-85-6686-3287-1415-12062
			//-3110-365773-7089-85-6686-3287-1415-12062sha
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  }

	  @Test
	  public void loginTest() throws Exception {
		  Teacher teacher = teacherDao.teacherLoginByEmployeeNum("123456");
		  System.out.println(teacher.getEmployeeNum());
		  System.out.println(teacher.getTeacherPassword());
		  
	  }
//	@Resource
//	ITeacherService iTeacherService;
//	/**
//	 * @author LiMing
//	 * */
//	@Test
//	public void UPdateTeacher() {
//		Teacher teacher = new Teacher("1234567",null, "WenRuo", "654321","男" ,"大学本科", "太工学生", null, "1457892867@qq.com", null);
//		System.out.println(teacher.toString());
//	    iTeacherService.UpdateTeacher(teacher);
//	}
}

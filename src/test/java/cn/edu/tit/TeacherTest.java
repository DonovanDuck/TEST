package cn.edu.tit;

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
import cn.edu.tit.bean.VirtualClass;
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
	  
	  teacherService.createCourse(course);
	  //teacherService.createCourse(course);
	
  }
  @Test
  public void createVirtualClass() {
	  
	  
	  
  }
  @Test
  public void updateCourse() {
	  
	  Course course = new Course(9, "语文", "奇迹星桥胡哨", 6, "17693280903", "home/wenli/program");
	  teacherService.updateCourse(course);
  }
  @Test
  public void courseList() {
	  List<String> a = new ArrayList<String>();
	  a.add("刘音");
	  a.add("李明");
	  System.out.println(a);
	  List<Course> c = teacherService.courseList("17693280903");
			  
	  for(Course course : c ) {
		  System.out.println(course.getCourseId());
	  }
  }
  @Test 
  public void studentList() {
	  

  }
  @Test
  public void searchStudent() {
	  
	  
	  
  }
  	
    
}

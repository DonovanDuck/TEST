package cn.edu.tit;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.tit.bean.Admin;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.RealClass;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.idao.IAdminDao;
import cn.edu.tit.iservice.IAdminService;
import cn.edu.tit.iservice.ITeacherService;


@RunWith(SpringJUnit4ClassRunner.class) // 表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class AdminTest {
	private static Logger logger = Logger.getLogger(AdminTest.class);

	@Resource
	private IAdminService iadminService;
	@Autowired
	private ITeacherService iTeacherService;//调用教师中的方法

	@Resource
	private IAdminDao iAdminDao;

	List<Admin> adminList = new ArrayList<Admin>();
	List<Admin> array = new ArrayList<Admin>();
	List<Category> categories = new ArrayList<Category>();

	@Test
	public void Test() {

		/**
		 * 测试插入管理员功能
		 * */
		//		array = iadminService.readTeacherInfo();
		//		for (int i = 0; i < 4; i++) {
		//			adminList.add(array.get(i));				
		//		}
		//		iadminService.addAdmin(adminList);


		/**
		 * 测试管理员添加课程类别
		 * */
		//		Course course = new Course(null, "C++", "这是一门课",1,"1234567", null);
		//		List<Course> courseList = new ArrayList<Course>();
		//		courseList.add(course);
		//		iadminService.addCourseKinds(courseList);

		/**
		 * 测试插入老师
		 * */
		//		Teacher teacher = new Teacher("1111", "name", "nickName", "password", "男", "大学", "教授", "157", "@qq.com", null, "在职","计算机");
		//		List<Teacher> teacherList =new ArrayList<Teacher>();
		//		teacherList.add(teacher);
		//		iAdminDao.addTeacherInfo(teacherList);
		/**
		 * 测试删除管理员功能
		 * */
		//		Admin admin = new Admin(10, "刘申全","011002");
		//			adminList.add(admin);				
		//		iadminService.deleteAdmin(adminList);	

		/**
		 * 测试管理员登陆
		 * */
		//		Admin admin = iadminService.loginAdmin("吴原生");
		//		System.out.println(admin.toString());

		/**
		 * 测试查询学生信息登陆
		 * */
		//		List<Student> studentList = iadminService.readStudentInfo();
		//		for (Student student : studentList) {
		//			System.out.println(student.toString());
		//		}

		/**
		 * 测试重置密码
		 * */
		//		String studentId = "152056101";
		//		iadminService.resetStudentPassword(studentId);

		/**
		 * 实体班级的加入
		 * */
		//				List<RealClass> realClassList= new ArrayList<RealClass>();
		//				RealClass realClass = new RealClass();
		//				for (int i = 0; i < 16; i++) {
		//					realClass.setRealClassNum("15205"+String.valueOf(i));
		//					realClass.setRealClassCategory("计算机工程系");
		//					realClassList.add(realClass);
		//				}
		//				try {
		//					iadminService.addRealClass(realClassList);
		//				} catch (Exception e) {
		//					// TODO Auto-generated catch block
		//					e.printStackTrace();
		//				}


		//		/**
		//		 * 实体班级的读取
		//		 * */
		//		List<RealClass> realClassList= new ArrayList<RealClass>();
		//		try {
		//			realClassList = iTeacherService.readRealClass();
		//		} catch (Exception e) {
		//			e.printStackTrace();
		//		}
		//		for (RealClass realClass : realClassList) {
		//			System.out.println(realClass.toString());
		//		}
	}
}


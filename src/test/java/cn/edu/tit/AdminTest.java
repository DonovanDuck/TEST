package cn.edu.tit;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.tit.bean.Admin;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Course;
import cn.edu.tit.iservice.IAdminService;


@RunWith(SpringJUnit4ClassRunner.class) // 表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class AdminTest {
	private static Logger logger = Logger.getLogger(AdminTest.class);

	@Resource
	private IAdminService iadminService;

	//	List<Admin> adminList = new ArrayList<Admin>();
	//	List<Admin> array = new ArrayList<Admin>();
	//	List<Category> categories = new ArrayList<Category>();

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
		 * 测试管理员管理系部功能
		 * */
		//		Category category = new Category("1520561","计算程222222222系","这是一个的系部");
		//		Category category2 = new Category("152051","法22222222系","这是一个案的系部");
		//		categories.add(category);
		//		categories.add(category2);
		//		iadminService.modifyCategory(categories);		

		/**
		 * 测试管理员添加课程类别
		 * */
		//		Course course = new Course(null, "C++", "这是一门课",1,"1234567", null);
		//		List<Course> courseList = new ArrayList<Course>();
		//		courseList.add(course);
		//		iadminService.addCourseKinds(courseList);

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
	}
}


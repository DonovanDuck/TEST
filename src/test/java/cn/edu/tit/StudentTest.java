/**
 * 
 */
package cn.edu.tit;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.tit.bean.Student;
import cn.edu.tit.iservice.IStudentService;

/**
 * @author LiMing
 *学生方法的测试类
 */
@RunWith(SpringJUnit4ClassRunner.class) // 表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class StudentTest {

	@Resource
	IStudentService iStudentSercie;

	/**
	 * @throws Exception 
	 * @authorLiMing
	 * 更新学生数据测试方法
	 * */
	//	@Test
	//	public void UpdateStudent() {
	//		Student student = new Student("1234567", "李明", "文若","男","123456789456132","1520562", "大数据","123456789", "123456789@qq.com", null);
	//		System.out.println(student.toString());
	//		iStudentSercie.UpdateStudent(student);	
	//	}

	/**
	 * @throws Exception 
	 * @authorLiMing
	 * 获取学生课程
	 * */
	//	@Test
	//	public void UpdateStudent() throws Exception {
	//		List<String> listCourseId = new ArrayList<String>();
	//		listCourseId = iStudentSercie.GetStudentCourse("1","1");
	//		for (String string : listCourseId) {
	//			System.out.println(string);
	//		}
	//	}
}

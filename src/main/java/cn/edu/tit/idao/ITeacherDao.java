package cn.edu.tit.idao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.VirtualClass;

@Component
public interface ITeacherDao {
	
	public void createCourse(Course course);	//创建课程模块
	public void deleteCourse(Integer courseId);	//删除课程模块
	public void createVirtualClass(VirtualClass virtualClass);		//创建虚拟班级模块
	public void updateCourse(Course course);	//修改课程模块
	public List<Course> courseList(String publisherId);		//课程列表模块
	public List<Student> studentList(String classNum);		//学生列表模块
	public Student searchStudent(String studentId);		//查看学生信息模块
	public List<String> searchRealClassNum(String virtualClassNum);		//查询虚拟班级对应的自然班列表模块
	public void mapVirtualRealClass(@Param("realClassNum")String realClassNum,@Param("virtualClassNum")String virtualClassNUm);	//创建虚拟班和自然班映射模块
	
}

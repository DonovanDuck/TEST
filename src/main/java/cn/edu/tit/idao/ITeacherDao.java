package cn.edu.tit.idao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.VirtualClass;

@Component
public interface ITeacherDao {
	
	public void createCourse(Course course);
	public void deleteCourse(Integer courseId);
	public void createVirtualClass(VirtualClass virtualClass);
	public void updateCourse(Course course);
	public List<Course> courseList(String publisherId);
	public List<Student> studentList(String classNum);
	public Student searchStudent(String studentId);
	public List<String> searchRealClassNum(String virtualClassNum);

}

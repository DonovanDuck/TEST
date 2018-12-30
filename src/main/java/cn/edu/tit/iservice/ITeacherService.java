package cn.edu.tit.iservice;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.VirtualClass;

public interface ITeacherService {
	
	
	public void createCourse(Course course);//创建课程
	public void deleteCourse(Integer courseId);
	public void createVirtualClass(VirtualClass virtualClass);
	public void updateCourse(Course course);
	public List<Course> courseList(String publisherId);
	public List<Student> studentList(String classNum);
	public Student searchStudent(String studentId);
	public List<String> searchRealClassNum(String virtualClassNum);

}

package cn.edu.tit.iservice.iserviceImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.bean.VirtualClass;
import cn.edu.tit.idao.ITeacherDao;
import cn.edu.tit.iservice.ITeacherService;


@Service
public class TeacherServiceImpl implements ITeacherService{
	@Autowired
	private  ITeacherDao teacherDao ;
	@Override
	public void createCourse(Course course) {
		teacherDao.createCourse(course);
		
	}
	@Override
	public void deleteCourse(Integer courseId) {
		// TODO Auto-generated method stub
		teacherDao.deleteCourse(courseId);
	}
	@Override
	public void createVirtualClass(VirtualClass virtualClass) {
		// TODO Auto-generated method stub
		teacherDao.createVirtualClass(virtualClass);
		
	}
	@Override
	public void updateCourse(Course course) {
		// TODO Auto-generated method stub
		teacherDao.updateCourse(course);
	}

	@Override
	public List<Student> studentList(String classNum) {
		// TODO Auto-generated method stub
		
		
		
		return teacherDao.studentList(classNum);
	}
	@Override
	public Student searchStudent(String studentId) {
		// TODO Auto-generated method stub
		return teacherDao.searchStudent(studentId);
	}
	@Override
	public List<Course> courseList(String publisherId) {
		// TODO Auto-generated method stub
		return teacherDao.courseList(publisherId);
	}
	@Override
	public List<String> searchRealClassNum(String virtualClassNum) {
		// TODO Auto-generated method stub
		return teacherDao.searchRealClassNum(virtualClassNum);
	}
	

}

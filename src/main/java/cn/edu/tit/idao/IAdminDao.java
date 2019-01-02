package cn.edu.tit.idao;

import java.util.List;
import org.springframework.stereotype.Component;
import cn.edu.tit.bean.Admin;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Teacher;

@Component
public interface IAdminDao {

	/**
	 *  @author LiMing
	 * 添加管理员
	 * */
	void addAdmin(List<Admin> admin);	

	/**
	 * @author LiMing
	 * 读取教师信息
	 * */
	List<Admin> readTeacherInfo();
	
	/**
	 * @author LiMing
	 * 管理员初始化分类（系部）信息
	 * */
	public void initializeCategory(List<Category> categories);

	/**
	 * @author LiMing
	 * 管理员修改分类（系部）信息
	 */
	public void modifyCategory(Category categories);
	
	/**
	 * @author LiMing
	 * 添加教师信息
	 * */
	public void addTeacherInfo(List<Teacher> teacher);
	
	/**
	 * @author LiMing
	 * 添加教师信息
	 * */
	public void addStudentInfo(List<Student> student);
	
	/**
	 * @author LiMing
	 * 添加课程类别
	 */
	public void addCourseKinds(List<Course> courseList);
	
	/**
	 * @author LiMing
	 * 删除管理员
	 */
	public void deleteAdmin(List<Admin> adminList);
	
	/**
	 * @author LiMing
	 * 登陆管理员
	 */
	public Admin loginAdmin(String adminName);
	
	
}

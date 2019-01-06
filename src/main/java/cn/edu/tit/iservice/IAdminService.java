package cn.edu.tit.iservice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import cn.edu.tit.bean.Admin;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Teacher;


public interface IAdminService {

	/**
	 * @author LiMing
	 * 管理员初始化分类（系部）信息
	 */
	public String addCategory(List<Category> categories);

	/**
	 * @author LiMing
	 * 管理员修改分类（系部）信息
	 */
	public String updateCategory(List<Category> categories);

	/**
	 * @author LiMing
	 * 读取分类（系部）信息
	 * @return 
	 */
	public List<Category> readCategory();

	/**
	 * @author LiMing
	 * 添加管理员
	 */
	public String addAdmin(List<Admin> admin);

	/**
	 * @author LiMing
	 * 更新管理员信息
	 */
	public String updateAdmin(Admin admin);


	/**
	 * @author LiMing
	 * 删除管理员
	 * @return 
	 */
	public String deleteAdmin(List<Admin> adminList);

	/**
	 * @author LiMing
	 * 登陆管理员
	 */
	public Admin loginAdmin(String adminName);

	/**
	 * @author LiMing
	 * 读取学生信息
	 */
	public List<Teacher> readTeacherInfo();

	/**
	 * @author LiMing
	 * 添加教师信息,通过Excel表导入
	 */
	public String addTeacherInfo(MultipartFile file);

	/**
	 * @author LiMing
	 * 更新教师信息
	 */
	public String updateTeacherInfo(List<Teacher> teacher);

	/**
	 * @author LiMing
	 * 添加学生信息,通过Excel表导入
	 */
	public String addStudentInfo(MultipartFile file);

	/**
	 * @author LiMing
	 * 读取学生信息
	 */
	public List<Student> readStudentInfo();

	/**
	 * @author LiMing
	 * 更新学生信息
	 */
	public String updateStudentInfo(List<Student> studentList);

}

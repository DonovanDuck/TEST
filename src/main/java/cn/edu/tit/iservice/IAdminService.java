package cn.edu.tit.iservice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import cn.edu.tit.bean.Admin;
import cn.edu.tit.bean.Category;


public interface IAdminService {
	
	/**
	 * @author LiMing
	 * 管理员初始化分类（系部）信息
	 */
	public void initializeCategory(List<Category> categories);
	
	/**
	 * @author LiMing
	 * 管理员修改分类（系部）信息
	 */
	public void modifyCategory(List<Category> categories);
	
	/**
	 * @author LiMing
	 * 超级管理员添加管理员
	 */
	public void addAdmin(List<Admin> admin);
	
	/**
	 * @author LiMing
	 * 超级管理员读取教师信息，设定为管理员
	 */
	public List<Admin> readTeacherInfo();

	/**
	 * @author LiMing
	 * 添加教师信息,通过Excel表导入
	 */
	public String addTeacherInfo(MultipartFile file);
	
	/**
	 * @author LiMing
	 * 添加学生信息,通过Excel表导入
	 */
	public String addStudentInfo(MultipartFile file);
}

package cn.edu.tit.iservice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import cn.edu.tit.bean.Academic;
import cn.edu.tit.bean.Admin;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Department;
import cn.edu.tit.bean.RealClass;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.bean.Term;


public interface IAdminService {

	/**
	 * @author LiMing
	 * 管理员初始化分类（系部）信息
	 */
	public String addCategory(List<Category> categories) throws Exception;

	/**
	 * @author LiMing
	 * 管理员修改分类（系部）信息
	 */
	public void updateCategory(Category category) throws Exception;

	/**
	 * @author LiMing
	 * 读取分类（系部）信息
	 * @return 
	 */
	public List<Category> readCategory() throws Exception;

	/**
	 * @author LiMing
	 * 添加管理员
	 */
	public String addAdmin(List<Admin> admin) throws Exception;

	/**
	 * @author LiMing
	 * 更新管理员信息
	 */
	public String updateAdmin(Admin admin) throws Exception;


	/**
	 * @author LiMing
	 * 删除管理员
	 * @return 
	 */
	public String deleteAdmin(List<Admin> adminList) throws Exception;

	/**
	 * @author LiMing
	 * 登陆管理员
	 */
	public Admin loginAdmin(String adminName) throws Exception;

	/**
	 * @author LiMing
	 * 读取学生信息
	 */
	public List<Teacher> readTeacherInfo() throws Exception;

	/**
	 * @author LiMing
	 * 添加教师信息,通过Excel表导入
	 */
	public String addTeacherInfo(MultipartFile file) throws Exception;

	/**
	 * @author LiMing
	 * 更新教师信息
	 */
	public String updateTeacherInfo(List<Teacher> teacher) throws Exception;

	/**
	 * @author LiMing
	 * 添加学生信息,通过Excel表导入
	 */
	public String addStudentInfo(MultipartFile file) throws Exception;

	/**
	 * @author LiMing
	 * 读取学生信息
	 */
	public List<Student> readStudentInfo() throws Exception;

	/**
	 * @author LiMing
	 * 更新学生信息
	 */
	public String updateStudentInfo(List<Student> studentList) throws Exception;

	/**
	 *@author LiMing
	 * @return
	 * 重置学生密码
	 */
	public String resetStudentPassword(String studentId) throws Exception;

	/**
	 *@author LiMing
	 * @return
	 * 重置教师密码
	 */
	public String resetTeacherPassword(String employeeNum) throws Exception;
	
	/**
	 * @author LiMing
	 * 添加教师信息
	 * @param 单个教师个人信息
	 */
	public void addOneTeacher(Teacher teacher) throws Exception;

	/**
	 * @author LiMing
	 * 添加教师信息
	 * @param 单个学生个人信息
	 */
	public void addOneStudent(Student student) throws Exception;

	
	/**
	 * @author LiMing
	 * @context  创建实体班
	 * @Param1 实体班集合
	 */
	public String addRealClass(List<RealClass> realCLassList) throws Exception;

	public void updateRealClass(RealClass realClass) throws Exception;

	public List<Academic> readAcademicInfo() throws Exception;
	public Department readDepartmentByNum(String num) throws Exception;
	public List<Department> readDepartment() throws Exception;
	public void addDepartment(Department de) throws Exception;

	public void updateDepartment(Department de) throws Exception;
	public void resotreDepartment(String departmentId)throws Exception;
	public void deleteDepartment(String departmentId)throws Exception;

	public void updateAcademic(Academic ac)throws Exception;

	List<Department> readAllDepartment() throws Exception;

	public void addAcademic(Academic ac) throws Exception;

	public void addTerm(Term te) throws Exception;

	public Term judgeTerm(String addStartTerm, String addEndTerm, String selectTerm)throws Exception;

	public void updateTerm(Term te) throws Exception;

}

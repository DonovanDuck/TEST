package cn.edu.tit.iservice.iserviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import cn.edu.tit.bean.Admin;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.common.ReadStudentExcel;
import cn.edu.tit.common.ReadTeacherExcel;
import cn.edu.tit.idao.IAdminDao;
import cn.edu.tit.idao.ITeacherDao;
import cn.edu.tit.iservice.IAdminService;

@Service
public class AdminServiceImpl implements IAdminService {
	@Autowired
	private IAdminDao iAdminDao;

	/**
	 * @author LiMing
	 * 添加管理员信息
	 * @return 
	 * */
	@Override
	public String addAdmin(List<Admin> admin) {
		String msg = null;
		try {
			iAdminDao.addAdmin(admin);
			msg = "添加管理员成功";
		} catch (Exception e) {
			msg = "添加管理员失败";
			e.printStackTrace();
		}
		return msg;
	}

	/**
	 * @author LiMing
	 * 导入教师信息
	 * */
	public String addTeacherInfo(MultipartFile file) {
		//创建处理EXCEL的类
		ReadTeacherExcel readExcel=new ReadTeacherExcel();
		//解析excel，获取上传的事件单
		List<Teacher> teacherList = null;
		int insertResult = 0;//记录插入数
		String insertMsg = "";
		try {
			teacherList = readExcel.getExcelInfo(file);	//调用函数，获取到装有Teacher对象的teacherList集合
			iAdminDao.addTeacherInfo(teacherList);	//调用函数，完成写入数据库操作
			for(Teacher s :teacherList) {	
				insertResult++;
				System.out.println(s.toString());  //输出每条插入的数据
			}
			if(insertResult ==0) {
				insertMsg = "载入数据库失败";
			}else if(insertResult == teacherList.size()){
				insertMsg = "全部载入数据库";
			}else {
				insertMsg = "部分载入数据库";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println(insertMsg);
			System.err.println("接受excel表格中的数据失败！");
		}
		for(Teacher s : teacherList) {
			System.out.println("打印excel中的数据"+s.toString());
		}

		return insertMsg;
	}

	/**
	 * @author LiMing
	 * 读取老师信息，添加管理员
	 * */
	@Override
	public List<Teacher> readTeacherInfo() {
		return iAdminDao.readTeacherInfo();
	}

	/**
	 * @author LiMing
	 * 读取教师信息
	 * @return 
	 * */
	@Override
	public String updateTeacherInfo(List<Teacher> teacher) {
		String msg = null;
		try {
			for (Teacher tc : teacher) {
				iAdminDao.updateTeacherInfo(tc);
			}
			msg = "更新教师信息成功";
		} catch (Exception e) {
			msg = "更新教师信息失败";
			e.printStackTrace();
		}
		return msg;
	}

	/**
	 * @author LiMing
	 * 导入学生信息
	 * */
	@Override
	public String addStudentInfo(MultipartFile file) {
		//创建处理EXCEL的类
		ReadStudentExcel readExcel=new ReadStudentExcel();
		//解析excel，获取上传的事件单
		List<Student> studentList = null;
		int insertResult = 0;//记录插入数
		String insertMsg = "";
		try {
			studentList = readExcel.getExcelInfo(file);	//调用函数，获取到装有Student对象的studentList集合
			iAdminDao.addStudentInfo(studentList);	//调用函数，完成写入数据库操作
			for(Student s :studentList) {
				insertResult++;
				System.out.println(s.toString());  //输出每条插入的数据
			}
			if(insertResult ==0) {
				insertMsg = "载入数据库失败";
			}else if(insertResult == studentList.size()){
				insertMsg = "全部载入数据库";
			}else {
				insertMsg = "部分载入数据库";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("接受excel表格中的数据失败！");
		}
		for(Student s : studentList) {
			System.out.println("打印excel中的数据"+s.toString());
		}
		return insertMsg;
	}

	/**
	 * @author LiMing
	 * 读取学生信息
	 * */
	@Override
	public List<Student> readStudentInfo() {
		return iAdminDao.readStudentInfo();
	}

	/**
	 * @author LiMing
	 * 更新学生信息
	 * @return 
	 * */
	@Override
	public String updateStudentInfo(List<Student> studentList) {
		String msg = null;
		try {
			for (Student student : studentList) {
				iAdminDao.updateStudentInfo(student);
			}
			msg = "更新教师信息成功";
		} catch (Exception e) {
			msg = "更新教师信息失败";
			e.printStackTrace();
		}
		return msg;
	}

	/**
	 * @author LiMing
	 * 删除管理员信息
	 * */
	@Override
	public String deleteAdmin(List<Admin> adminList) {
		String msg = null;
		try {
			iAdminDao.deleteAdmin(adminList);
			msg = "删除管理员信息成功";
		} catch (Exception e) {
			msg = "删除管理员信息失败";
			e.printStackTrace();
		}
		return msg;
	}

	/**
	 * @author LiMing
	 * 管理员登陆
	 * */
	@Override
	public Admin loginAdmin(String adminName) {
		return iAdminDao.loginAdmin(adminName);
	}

	/**
	 * @author LiMing
	 * 更新教师信息
	 * */
	@Override
	public String updateAdmin(Admin admin) {
		String msg = null;
		try {
			iAdminDao.updateAdmin(admin);
			msg = "更新教师信息成功";
		} catch (Exception e) {
			msg = "更新教师信息失败";
			e.printStackTrace();
		}
		return msg;
	}

	/**
	 * @author LiMing
	 * 增加分类信息
	 * */
	@Override
	public String addCategory(List<Category> categories) {
		String msg = null;
		try {
			iAdminDao.addCategory(categories);
			msg = "增加分类信息成功";
		} catch (Exception e) {
			msg = "增加分类信息失败";
			e.printStackTrace();
		}
		return msg;		
	}

	/**
	 * @author LiMing
	 * 更新分类信息
	 * */
	@Override
	public String updateCategory(List<Category> categories) {
		String msg = null;
		try {
			for (Category category : categories) {
				iAdminDao.updateCategory(category);
			}
			msg = "更新分类信息成功";
		} catch (Exception e) {
			msg = "更新分类信息失败";
			e.printStackTrace();
		}
		return msg;	
	}

	/**
	 * @author LiMing 
	 * 读取分类信息
	 * @return 
	 * */
	@Override
	public List<Category> readCategory() {
		List<Category> categories = new ArrayList<Category>();
		categories = iAdminDao.readCategory();
		return categories;
	}

	/**
	 * @author LiMing
	 * 重置学生密码
	 * */
	@Override
	public String resetStudentPassword(String studentId) {
		String msg = null;
		Student student = new Student();
		student.setStudentPassword("123123");
		student.setStudentId(studentId);
		try {
			iAdminDao.updateStudentInfo(student);
			msg = "重置密码成功";
		} catch (Exception e) {
			msg = "重置密码失败";
			e.printStackTrace();
		}
		return msg;	
	}

	/**
	 * @author LiMing
	 * 重置教师密码
	 * */
	@Override
	public String resetTeacherPassword(String employeeNum) {
		String msg = null;
		Teacher teacher = new Teacher();
		teacher.setTeacherPassword("123123");
		teacher.setEmployeeNum(employeeNum);
		try {
			iAdminDao.updateTeacherInfo(teacher);
			msg = "重置密码成功";
		} catch (Exception e) {
			msg = "重置密码失败";
			e.printStackTrace();
		}
		return msg;	
	}
}

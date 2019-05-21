package cn.edu.tit.iservice.iserviceImpl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import cn.edu.tit.bean.Admin;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.RealClass;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.common.Common;
import cn.edu.tit.common.ReadStudentExcel;
import cn.edu.tit.common.ReadTeacherExcel;
import cn.edu.tit.idao.IAdminDao;
import cn.edu.tit.idao.ITeacherDao;
import cn.edu.tit.iservice.IAdminService;

/**
 * @author LiMing
 * 管理员功能模块
 * 无返回值时返回Sting类型  msg 信息，在页面弹出信息可以利用
 * */
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
	public String addAdmin(List<Admin> admin) throws Exception {
		String msg = null;
		try {
			iAdminDao.addAdmin(admin);
			msg = "添加管理员成功";
			System.out.println("addAdmin-----持久层处理成功");
		} catch (Exception e) {
			msg = "添加管理员失败";
			e.printStackTrace();
			System.out.println("addAdmin-----持久层处理失败");
		}
		return msg;
	}

	/**
	 * @author LiMing
	 * 导入教师信息
	 * */
	public String addTeacherInfo(MultipartFile file) throws Exception {
		//创建处理EXCEL的类
		ReadTeacherExcel readExcel=new ReadTeacherExcel();
		//解析excel，获取上传的事件单
		List<Teacher> teacherList = null;
		int insertResult = 0;//记录插入数
		String insertMsg = "";
		try {
			teacherList = readExcel.getExcelInfo(file);	//调用函数，获取到装有Teacher对象的teacherList集合

			for(Teacher s :teacherList) {	
				s.setTeacherPassword(Common.eccryptMD5(s.getTeacherPassword()));
				insertResult++;
				System.out.println(s.toString());  //输出每条插入的数据
			}
			iAdminDao.addTeacherInfo(teacherList);	//调用函数，完成写入数据库操作
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
	public List<Teacher> readTeacherInfo() throws Exception {
		List<Teacher> teacherList = new ArrayList<Teacher>();
		try {
			teacherList = iAdminDao.readTeacherInfo();
			System.out.println("readTeacherInfo-----持久层处理成功");
		} catch (Exception e) {
			e.printStackTrace();
			teacherList=null;
			System.out.println("readTeacherInfo-----持久层处理失败");
		}
		return teacherList;
	}

	/**
	 * @author LiMing
	 * 读取教师信息
	 * @return 
	 * */
	@Override
	public String updateTeacherInfo(List<Teacher> teacher) throws Exception {
		String msg = null;
		try {
			for (Teacher tc : teacher) {
				iAdminDao.updateTeacherInfo(tc);
			}
			msg = "更新教师信息成功";
			System.out.println("updateTeacherInfo-----持久层处理成功");
		} catch (Exception e) {
			msg = "更新教师信息失败";
			e.printStackTrace();
			System.out.println("updateTeacherInfo-----持久层处理失败");
		}
		return msg;
	}

	/**
	 * @author LiMing
	 * 导入学生信息
	 * */
	@Override
	public String addStudentInfo(MultipartFile file) throws Exception {
		//创建处理EXCEL的类
		ReadStudentExcel readExcel=new ReadStudentExcel();
		//解析excel，获取上传的事件单
		List<Student> studentList = null;
		List<RealClass> realClasses = new ArrayList<RealClass>();
		int insertResult = 0;//记录插入数
		String insertMsg = "";
		try {
			studentList = readExcel.getExcelInfo(file);	//调用函数，获取到装有Student对象的studentList集合
			iAdminDao.addStudentInfo(studentList);	//调用函数，完成写入数据库操作

			for(Student s :studentList) {
				insertResult++;
				//以下一段是用来系统初始化所有班级时使用的，由于没有所有班级表，所以采用这种方式获得所有班级，日后，如果有了班级表，则可直接从班级表获得
				/*
				String classNum = s.getClassNum();
				String catrgoryId;
				if(s.getClassNum().substring(3,4).equals("0")) {
					catrgoryId = s.getClassNum().substring(4, 5);
				}else {
					catrgoryId = s.getClassNum().substring(3, 5);
				}

				RealClass realClass = new RealClass();
				realClass.setRealClassNum(classNum);
				realClass.setRealClassCategory(catrgoryId);
				realClass.setRealPersonNum(0);
				realClasses.add(realClass);*/
				//这一步是应该加在此处的步骤，即导入学生信息时往实体班级写入具体人数
				String classNum = s.getClassNum();
				iAdminDao.updateStudentNumInRealClass(classNum);
				System.out.println(s.toString());  //输出每条插入的数据
			}
			//iAdminDao.addRealClass(realClasses);  添加班级信息
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
		return insertMsg;
	}

	/**
	 * @author LiMing
	 * 读取学生信息
	 * */
	@Override
	public List<Student> readStudentInfo() throws Exception {
		List<Student> studentList = new ArrayList<Student>();
		try {
			studentList = iAdminDao.readStudentInfo();
			System.out.println("readStudentInfo-----持久层处理成功");
		} catch (Exception e) {
			e.printStackTrace();
			studentList = null;
			System.out.println("readStudentInfo-----持久层处理失败");		
		}
		return studentList;
	}

	/**
	 * @author LiMing
	 * 更新学生信息
	 * @return 
	 * */
	@Override
	public String updateStudentInfo(List<Student> studentList)throws Exception  {
		String msg = null;
		try {
			for (Student student : studentList) {
				iAdminDao.updateStudentInfo(student);
			}
			msg = "更新教师信息成功";
			System.out.println("updateStudentInfo-----持久层处理成功");
		} catch (Exception e) {
			msg = "更新教师信息失败";
			e.printStackTrace();
			System.out.println("updateStudentInfo-----持久层处理失败");
		}
		return msg;
	}

	/**
	 * @author LiMing
	 * 删除管理员信息
	 * */
	@Override
	public String deleteAdmin(List<Admin> adminList)throws Exception  {
		String msg = null;
		try {
			iAdminDao.deleteAdmin(adminList);
			msg = "删除管理员信息成功";
			System.out.println("deleteAdmin-----持久层处理成功");
		} catch (Exception e) {
			msg = "删除管理员信息失败";
			e.printStackTrace();
			System.out.println("deleteAdmin-----持久层处理失败");
		}
		return msg;
	}

	/**
	 * @author LiMing
	 * 管理员登陆
	 * */
	@Override
	public Admin loginAdmin(String adminName) throws Exception {
		Admin admin = new Admin();
		try {
			admin = iAdminDao.loginAdmin(adminName);
			System.out.println("loginAdmin-----持久层处理成功");
		} catch (Exception e) {
			e.printStackTrace();
			admin = null;
			System.out.println("loginAdmin-----持久层处理失败");
		}
		return admin;
	}

	/**
	 * @author LiMing
	 * 更新教师信息
	 * */
	@Override
	public String updateAdmin(Admin admin) throws Exception {
		String msg = null;
		try {
			iAdminDao.updateAdmin(admin);
			msg = "更新管理员信息成功";
			System.out.println("updateAdmin-----持久层处理成功");
		} catch (Exception e) {
			msg = "更新管理员信息失败";
			e.printStackTrace();
			System.out.println("updateAdmin-----持久层处理失败");
		}
		return msg;
	}

	/**
	 * @author LiMing
	 * 增加分类信息
	 * */
	@Override
	public String addCategory(List<Category> categories) throws Exception {
		String msg = null;
		try {
			iAdminDao.addCategory(categories);
			msg = "增加分类信息成功";
			System.out.println("addCategory-----持久层处理成功");
		} catch (Exception e) {
			msg = "增加分类信息失败";
			e.printStackTrace();
			System.out.println("addCategory-----持久层处理失败");
		}
		return msg;		
	}

	/**
	 * @author LiMing
	 * 更新分类信息
	 * */
	@Override
	public void updateCategory(Category category) throws Exception {
		try {
			iAdminDao.updateCategory(category);
			System.out.println("updateCategory-----持久层处理成功");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateCategory-----持久层处理失败");
		}	
	}

	/**
	 * @author LiMing 
	 * 读取分类信息
	 * @return 
	 * */
	@Override
	public List<Category> readCategory() throws Exception {
		List<Category> categories = new ArrayList<Category>();
		try {
			categories = iAdminDao.readCategory();
			System.out.println("readCategory-----持久层处理成功");
		} catch (Exception e) {
			e.printStackTrace();
			categories = null;
			System.out.println("readCategory-----持久层处理失败");
		}
		return categories;
	}

	/**
	 * @author LiMing
	 * 重置学生密码
	 * */
	@Override
	public String resetStudentPassword(String studentId)throws Exception  {
		String msg = null;
		Student student = new Student();
		String pwd = Common.eccryptMD5("123456");
		student.setStudentPassword(pwd);
		student.setStudentId(studentId);
		try {
			iAdminDao.updateStudentInfo(student);
			msg = "重置密码成功";
			System.out.println("resetStudentPassword-----持久层处理成功");
		} catch (Exception e) {
			msg = "重置密码失败";
			e.printStackTrace();
			System.out.println("resetStudentPassword-----持久层处理失败");
		}
		return msg;	
	}

	/**
	 * @author LiMing
	 * 重置教师密码
	 * */
	@Override
	public String resetTeacherPassword(String employeeNum) throws Exception {
		String msg = null;
		Teacher teacher = new Teacher();
		String pwd = Common.eccryptMD5("123456");
		teacher.setTeacherPassword(pwd);
		teacher.setEmployeeNum(employeeNum);
		try {
			iAdminDao.updateTeacherInfo(teacher);
			msg = "重置密码成功";
			System.out.println("resetTeacherPassword-----持久层处理成功");
		} catch (Exception e) {
			msg = "重置密码失败";
			e.printStackTrace();
			System.out.println("resetTeacherPassword-----持久层处理失败");
		}
		return msg;	
	}

	/**
	 * 管理员创建实体班级
	 * */
	@Override
	public String addRealClass(List<RealClass> realCLassList) throws Exception {
		String msg = null;
		try {
			iAdminDao.addRealClass(realCLassList);
			msg = "创建实体班级成功";
			System.out.println("createRealClass-----持久层处理成功");
		} catch (Exception e) {
			e.printStackTrace();
			msg = "创建实体班级成功";
			System.out.println("createRealClass-----持久层处理成功");
		}
		return msg;
	}

	/**
	 * @author LiMing
	 * 添加教师信息
	 * @param 单个教师个人信息
	 */
	@Override
	public void addOneTeacher(Teacher teacher) throws Exception {
		List<Teacher> list = new ArrayList<Teacher>();
		list.add(teacher);
		try {
			iAdminDao.addTeacherInfo(list);
			System.out.println("addOneTeacher-----持久层处理成功");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("addOneTeacher-----持久层处理成功");
		}
	}

	/**
	 * @author LiMing
	 * 添加教师信息
	 * @param 单个学生个人信息
	 */
	@Override
	public void addOneStudent(Student student) throws Exception {
		List<Student> list = new ArrayList<Student>();
		list.add(student);
		try {
			iAdminDao.addStudentInfo(list);
			System.out.println("addOneStudent-----持久层处理成功");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("addOneStudent-----持久层处理成功");
		}
	}
}

package cn.edu.tit.iservice.iserviceImpl;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.tit.bean.Student;
import cn.edu.tit.idao.IStudentDao;
import cn.edu.tit.iservice.IStudentService;

/*
 * actor:wenli
 * context:学生Service层实体类
 */
import cn.edu.tit.bean.Accessory;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Task;
import cn.edu.tit.bean.Term;
import cn.edu.tit.bean.VirtualClass;

@Service
public class StudentServiceImpl implements IStudentService{

	@Autowired
	IStudentDao studentDao;
	
	@Autowired
	IStudentDao iStudentDao;
	/**
	 * @author LiMing
	 *@param 学生对象
	 *更新学生信息操作
	 */
	@Override
	public void updateStudent(Student student)throws Exception {
		try {
			studentDao.updateStudent(student);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("studentDao层UpdateStudent出问题");
		}
	}
	
	/**
	 * @author LiMing
	 * 通过学号登录学生
	 * */
	

	@Override
	public Student studentLoginByEmployeeNum(String employeeNum) throws Exception{
		// TODO Auto-generated method stub
//		try {
			return studentDao.studentLoginByEmployeeNum(employeeNum);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			System.out.println("studentDao层studentLoginByEmployeeNum出问题");
//			return null;
//		}
	}

	@Override
	public Student studentLoginByTelephone(String telephone)throws Exception {
		// TODO Auto-generated method stub
		try {
			return studentDao.studentLoginByTelephone(telephone);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("studentDao层studentLoginByTelephone出问题");
			return null;
		}
	}

	@Override
	public Student studentLoginByEmail(String email)throws Exception {
		// TODO Auto-generated method stub
		try {
			return studentDao.studentLoginByEmail(email);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("studentDao层studentLoginByEmail出问题");
			return null;
		}
	}

	@Override
	public List<String> studentVirtualClassId(String classnum) throws Exception{
		// TODO Auto-generated method stub
		try {
			return studentDao.studentVirtualClassId(classnum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("studentDao层studentVirtualClassId出问题");
			return null;
		}
		
	}

	@Override
	public List<VirtualClass> studentVirtualClass(List<String> virtualClassNums) throws Exception{
		// TODO Auto-generated method stub
		try {
			return studentDao.studentVirtualClass(virtualClassNums);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("studentDao层studentVirtualClass出问题");
			return null;
		}
	}

	@Override
	public void upTask(String studentId, String taskId, String upTaskDetail)throws Exception {
		// TODO Auto-generated method stub
		try {
			studentDao.upTask(studentId, taskId, upTaskDetail);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("studentDao层upTask出问题");
		}
		
	}

	@Override
	public void upAccessory(List<Accessory> accessories, String studentId) throws Exception{
		// TODO Auto-generated method stub
		try {
			studentDao.upAccessory(accessories, studentId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("studentDao层upAccessory出问题");
		}
	}

	@Override
	public List<String> searchTaskId(String virtualClassNum) throws Exception{
		// TODO Auto-generated method stub
		try {
			return studentDao.searchTaskId(virtualClassNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("studentDao层searchTaskId出问题");
			return null;
		}
	}

	@Override
	public List<Task> TaskList(List<String> taskIds) throws Exception{
		// TODO Auto-generated method stub
		try {
			return studentDao.TaskList(taskIds);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("studentDao层TaskList出问题");
			return null;
		}
	}

	@Override
	public Task searchTask(String taskId)throws Exception {
		// TODO Auto-generated method stub
		try {
			return studentDao.searchTask(taskId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("studentDao层searchTask出问题");
			return null;
		}
	}

	@Override
	public Accessory searchAccessory(String taskId) throws Exception{
		// TODO Auto-generated method stub
		try {
			return studentDao.searchAccessory(taskId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("studentDao层searchAccessory出问题");
			return null;
		}
	}

	@Override
	public List<String> searchRealClassNum(String virtualClassNum)throws Exception {
		// TODO Auto-generated method stub
		try {
			return studentDao.searchRealClassNum(virtualClassNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("studentDao层searchRealClassNum出问题");
			return null;
		}
	}

	@Override
	public Student searchStudent(String studentId)throws Exception {
		// TODO Auto-generated method stub
		try {
			return studentDao.searchStudent(studentId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("studentDao层searchStudent出问题");
			return null;
		}
	}

	@Override
	public List<Student> studentList(List<String> classNum) throws Exception{
		// TODO Auto-generated method stub
		try {
			return studentDao.studentList(classNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("studentDao层studentList出问题");
			return null;
		}
	}

	/**
	 * @author LiMing
	 * 查询学生课程信息
	 * @param 当status为1时，自己加入课程。当status为0时，为自己关注的课程
	 * */
	@Override
	public List<String> getStudentCourse(String status,String studentId) throws Exception {
		List<String> list = new ArrayList<String>();
		try {
			list = studentDao.getStudentCourse(status,studentId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("studentDao层getStudentCourse出问题");
			list = null;
		}
		return list;
	}


	/**
	 * @author LiMing
	 * 查询学生课程信息
	 * @param categoryId 系部ID
	 * */
	@Override
	public Category getCategoryById(String categoryId) throws Exception {
		Category Category = new Category();
		try {
			Category = studentDao.getCategoryById(categoryId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("studentDao层getCategoryById出问题");
			Category = null;
		}
		return Category;
	}

	@Override
	public void studentAttentionCourse(String courseId, String studentId) {
		// TODO Auto-generated method stub
		studentDao.studentAttentionCourse(courseId, studentId);
	}

	
	/**
	 * @param termId
	 * @return 返回学期信息
	 */
	@Override
	public Term readTermById(String termId) {
		Term term = new Term();
		try {
			term = studentDao.readTermById(termId);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("studentDao层readTermById出问题");
			term = null;
		}
		return term;
	}

	@Override
	public Integer getManagerByStudentId(String studentId, String courseId, int manager) {
		// TODO Auto-generated method stub
		return studentDao.getManagerByStudentId(studentId, courseId, manager);
	}

	@Override
	public void studentExitAttentionCourse(String courseId, String studentId) {
		// TODO Auto-generated method stub
		studentDao.studentExitAttentionCourse(courseId, studentId);
	}
}

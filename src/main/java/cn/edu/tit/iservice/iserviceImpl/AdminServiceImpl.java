package cn.edu.tit.iservice.iserviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import cn.edu.tit.bean.Admin;
import cn.edu.tit.bean.Category;
import cn.edu.tit.bean.Teacher;
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
	 * 管理员初始化分类（系部）信息
	 * */
	@Override
	public void initializeCategory(List<Category> categories) {
		iAdminDao.initializeCategory(categories);
	}

	/**
	 * @author LiMing
	 * 修改系部信息
	 * */
	@Override
	public void modifyCategory(List<Category> categories) {
		for (Category category : categories) {
			iAdminDao.modifyCategory(category);
		}
	}

	/**
	 * @author LiMing
	 * 添加管理员信息
	 * */
	@Override
	public void addAdmin(List<Admin> admin) {
		iAdminDao.addAdmin(admin);
	}

	/**
	 * @author LiMing
	 * 读取老师信息，添加管理员
	 * */
	@Override
	public List<Admin> readTeacherInfo() {
		return iAdminDao.readTeacherInfo();
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
		System.out.println("进入TRY段~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		try {
			System.out.println("读取数据开始~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
			teacherList = readExcel.getExcelInfo(file);	//调用函数，获取到装有Teacher对象的teacherList集合
			System.out.println("读取数据结束~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
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
			System.err.println("接受excel表格中的数据失败！");
		}
		for(Teacher s : teacherList) {
			System.out.println("打印excel中的数据"+s.toString());
		}
		return insertMsg;
	}
}

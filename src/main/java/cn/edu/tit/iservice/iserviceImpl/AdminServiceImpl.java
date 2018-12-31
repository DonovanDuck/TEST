package cn.edu.tit.iservice.iserviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.edu.tit.bean.Admin;
import cn.edu.tit.bean.Category;
import cn.edu.tit.common.ReadExcel;
import cn.edu.tit.idao.IAdminDao;
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
}

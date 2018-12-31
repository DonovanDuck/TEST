package cn.edu.tit.idao;

import java.util.List;
import org.springframework.stereotype.Component;
import cn.edu.tit.bean.Admin;
import cn.edu.tit.bean.Category;

@Component
public interface IAdminDao {

	/**
	 * 添加管理员
	 * */
	void addAdmin(List<Admin> admin);	

	/**
	 * 添加管理员
	 * */
	List<Admin> readAdmin();
	
	/**
	 * 管理员初始化分类（系部）信息
	 * */
	public void initializeCategory(List<Category> categories);

}

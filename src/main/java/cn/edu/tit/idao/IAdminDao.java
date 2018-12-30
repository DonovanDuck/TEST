package cn.edu.tit.idao;

import org.springframework.stereotype.Component;

import cn.edu.tit.bean.Admin;

@Component
public interface IAdminDao {

	/**
	 * 添加管理员
	 * */
	void addAdmin(Admin admin);	

}

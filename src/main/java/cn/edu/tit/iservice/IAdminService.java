package cn.edu.tit.iservice;

import org.springframework.stereotype.Service;

@Service
public interface IAdminService {
	
	/**
	 * 管理员设置分类（系部）信息
	 */
	public void setCategory();
	
	/**
	 * 管理员修改分类（系部）信息
	 */
	public void modifyCategory();
	
	/**
	 * 超级管理员添加管理员
	 */
	public void addAdmin();
	
	/**
	 * 管理员导入用户（教师或学生）信息
	 */
	public void addUserInfo();
}

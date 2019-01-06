package cn.edu.tit.iservice;

import java.util.List;

import cn.edu.tit.bean.Resource;

public interface IResourceService {

	/**
	 * 上传资源到资源库
	 */
	public void upLoadResource(List<Resource> resourceList);
	
	/**
	 * 按资源类型显示同类资源列表
	 * @param categoryId
	 * @return
	 */
	public List<Resource> showResourceByCourse(Integer courseId);
	
	/**
	 * 发布资源到班级
	 * @param resourceList
	 */
	//public void pubResourceToClass(List<Resource> resourceList, String virtualClassNum);
	
	
	/**
	 * 显示本班资源
	 * @param courseId
	 * @return
	 */
//	public List<Resource> showResourceByClass(String virtualClassNum);
	
	/**
	 * 同步班级和资源库的资源
	 * 即以本地文件作为附件发布到班级的同时更新资源库
	 * @param resourceList
	 */
	//public void synchroResourceOfLibAndClass(List<Resource> resourceList, String virtualClassNum); 
	

	
}

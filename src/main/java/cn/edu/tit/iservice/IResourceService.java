package cn.edu.tit.iservice;

import java.util.List;

import cn.edu.tit.bean.Resource;

public interface IResourceService {

	/**
	 * 上传资源到资源库
	 */
	public void upLoadResource(List<Resource> resourceList);
	
	/**
	 * 显示同类资源列表
	 * @param categoryId
	 * @return
	 */
	public List<Resource> showResourceByCategory(Integer categoryId);
	
	/**
	 * 发布资源到班级
	 * @param resourceList
	 */
	public void pubResourceToClass(List<Resource> resourceList, String virtualClassNum);
	
	/**
	 * 上传资源到资源库
	 * @param resourceList
	 */
	public void pubReasourceToLib(List<Resource> resourceList);
	
	/**
	 * 显示本班资源
	 * @param courseId
	 * @return
	 */
	public List<Resource> showResourceByClass(Integer courseId);
	
}

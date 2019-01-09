package cn.edu.tit.iservice;

import java.util.List;

import cn.edu.tit.bean.Resource;
import cn.edu.tit.bean.Task;

public interface IResourceService {

	/**
	 * 上传资源到资源库
	 */
	public void upLoadResource(List<Resource> resourceList);
	
	/**
	 * 按课程资源列表
	 * @param categoryId
	 * @return
	 */
	public List<Resource> showResourceByCourse(Integer courseId);
	
	/**
	 * 按资源类型查询
	 * @param resourceTypeId
	 * @return
	 */
	public List<Resource> showResourceByType(int resourceTypeId);
	
	/**
	 * 通过id获得资源路径
	 * @param resourceId
	 * @return
	 */
	public String getResourcePathById(String resourceId);
	
	/**
	 * 通过资源名显示
	 * @param resourceName
	 * @return
	 */
	public List<Resource> showResourceByName(String resourceName);
	
	/**
	 * 通过知识点查询
	 * @param konwledgePoint
	 * @return
	 */
	public List<Resource> showResourceByKnow(String knowledgePoint);
	
	/**
	 * 通过课程id查询相应类型的任务资源
	 * @param taskType
	 * @param courseId
	 * @return
	 */
	public Object[] showTaskByTypeAndCId(String taskType, Integer courseId);
	
	/**
	 * 通过课程id查询相应类型的教学资源
	 * @param taskType
	 * @param courseId
	 * @return
	 */
	public Object[] showResourceByTypeAndCId(Integer resourceTypeId, Integer courseId);
	
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

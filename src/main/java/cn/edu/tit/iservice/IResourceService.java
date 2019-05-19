package cn.edu.tit.iservice;

import java.sql.Timestamp;
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
	public List<Resource> showResourceByCourse(String courseId);
	
	/**
	 * 按资源类型查询
	 * @param resourceTypeId
	 * @return
	 * 此方法中：
	 * 1.当resourceTypeId不为空时，根据类型查找资源
	 * 2.当resourceTypeId为空时，扫描全部资源
	 */
	public List<Resource> showResourceByType(Integer resourceTypeId);
	
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
	public Object[] showTaskByTypeAndCId(String taskType, String courseId);
	
	/**
	 * 通过课程id查询相应类型的教学资源
	 * @param taskType
	 * @param courseId
	 * @return
	 */
	public Object[] showResourceByTypeAndCId(Integer resourceTypeId, String courseId);
	
	/**
	 * 删除资源，根据ID
	 * @param courseId
	 * @return
	 * @throws Exception 
	 */
	public String deleteResourceById(String resourceId) throws Exception;
	
	/**
	 * 查找资源
	 * @param resourceId
	 * @return
	 * @throws Exception 
	 * 1.当resourceTypeId不为空时，根据类型查找资源
	 * 2.当resourceTypeId为空时，扫描全部资源
	 */
	public List<Resource> showResource(String resourceId) throws Exception;
	
	/**
	 *@author LiMing
	 * @param resourceName
	 * @param resourceDetail
	 * @param publishTime
	 * @param publisherId
	 * @param resourceTypeId
	 * @param resourcePath
	 * @param courseId
	 * @param size
	 * @param timeSize
	 * @param watchNum
	 * @param useNum
	 * @throws Exception
	 * 更新资源，不需要更新的字段传空，更新的字段设置值
	 */
	public void updateResource(String resourceId,String resourceName, String resourceDetail, Timestamp publishTime, String publisherId,
			Integer resourceTypeId, String resourcePath, String courseId, String size, String timeSize, Integer watchNum,
			Integer useNum) throws Exception;
	
	
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

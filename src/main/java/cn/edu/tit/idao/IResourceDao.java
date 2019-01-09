package cn.edu.tit.idao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import cn.edu.tit.bean.Resource;
import cn.edu.tit.bean.Task;

@Component
public interface IResourceDao {
	/**
	 * 添加资源到资源库
	 * @param resourceList
	 */
	public void addResourceToLib(List<Resource> resourceList);
	
	/**
	 * 通过课程查找资源
	 * @param categoryId
	 * @return
	 */
	public List<Resource> searchResourceByCourse(Integer courseId);
	
	/**
	 * 按资源类型查询课程
	 * @param resourceTypeId
	 * @return
	 */
	public List<Resource> searchResourceByType(Integer resourceTypeId);
	
	/**
	 * 通过id获取资源存储路径
	 * @param resourceId
	 * @return
	 */
	public String searchResourcePathById(String resourceId);
	
	/**
	 * 通过资源名查找资源
	 * @param resourceName
	 * @return
	 */
	public List<Resource> searchResourceByName(String resourceName);
	
	/**
	 * 通过知识点（描述）查询
	 * @param knowledgePoint
	 * @return
	 */
	public List<Resource> searchResourceByKnow(String knowledgePoint);
	
	/**
	 * 绑定资源和班级到资源班级关联表
	 * @param resourceId
	 * @param virtualClassNum
	 */
	public void bandResourceAndClass(@Param("resourceId")String resourceId, @Param("virtualClassNum")String virtualClassNum);
	
	/**
	 * 通过虚拟班级号查询对应的发布的资源id
	 * @param virtualClassNum
	 * @return
	 */
	public List<String> searchResourceIdByClass(String virtualClassNum);
	
	/**
	 * 通过资源id查询相关资源
	 * @param reosurceId
	 * @return
	 */
	public Resource searchResourceById(String resourceId);
	
	/**
	 * 通过课程id查询相应类型的任务资源
	 * @param taskType
	 * @param courseId
	 * @return
	 */
	public List<Task> searchTaskByTypeAndCid(@Param("taskType")String taskType, @Param("courseId")Integer courseId);
	
	/**
	 * 通过课程id查询相应类型的教学资源
	 * @param taskType
	 * @param courseId
	 * @return
	 */
	public List<Resource> searchResourceByTypeAndCid(@Param("resourceTypeId")Integer resourceTypeId, @Param("courseId")Integer courseId);
	
}

package cn.edu.tit.iservice.iserviceImpl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.tit.bean.Resource;
import cn.edu.tit.bean.Task;
import cn.edu.tit.idao.IResourceDao;
import cn.edu.tit.idao.ITeacherDao;
import cn.edu.tit.iservice.IResourceService;

@Service
public class ResourceServiceImpl implements IResourceService {
	
	@Autowired
	private IResourceDao resourceDao;
	@Autowired
	private ITeacherDao teacherDao;

	@Override
	public void upLoadResource(List<Resource> resourceList) {
		//调用dao层方法
		resourceDao.addResourceToLib(resourceList);
	}

	@Override
	public List<Resource> showResourceByCourse(String courseId) {
		// 调用dao层方法
		return resourceDao.searchResourceByCourse(courseId);
	}

	@Override
	public List<Resource> showResourceByType(Integer resourceTypeId) {
		// 调用dao层方法
		return resourceDao.searchResourceByType(resourceTypeId);
	}

	@Override
	public String getResourcePathById(String resourceId) {
		// 调用dao层方法
		return resourceDao.searchResourcePathById(resourceId);
	}

	@Override
	public List<Resource> showResourceByName(String resourceName) {
		// 调用dao层方法
		return resourceDao.searchResourceByName(resourceName);
	}

	@Override
	public List<Resource> showResourceByKnow(String knowledgePoint) {
		// 调用dao层方法
		return resourceDao.searchResourceByKnow(knowledgePoint);
	}

	@Override
	public Object[] showTaskByTypeAndCId(String taskType, String courseId) {
		// 获取相应类型的资源
		List<Task> taskList = resourceDao.searchTaskByTypeAndCid(taskType, courseId);
		List<String> teacherNames = new ArrayList<>(); // 任务对应教师姓名集合
		// 根据任务列表查发布人
		for(Task task : taskList){
			teacherNames.add(teacherDao.getTeacherNameById(task.getPublisherId()));
		}
		Object[] obj = new Object[]{taskList, teacherNames};
		return obj;
	}

	@Override
	public Object[] showResourceByTypeAndCId(Integer resourceTypeId, String courseId) {
		// 获取相应类型的资源
				List<Resource> resourceList = resourceDao.searchResourceByTypeAndCid(resourceTypeId, courseId);
				List<String> teacherNames = new ArrayList<>(); // 任务对应教师姓名集合
				// 根据任务列表查发布人
				for(Resource resource : resourceList){
					teacherNames.add(teacherDao.getTeacherNameById(resource.getPublisherId()));
				}
				Object[] obj = new Object[]{resourceList, teacherNames};
				return obj;
	}

	/**
	 * 删除资源，根据ID
	 * @param taskType
	 * @param courseId
	 * @return
	 */
	@Override
	public String deleteResourceById(String resourceId) throws Exception{
		String msg = null;
		try {
			resourceDao.deleteResourceById(resourceId);
			msg = "删除成功";
			System.out.println("deleteResourceById--------DAO层执行成功");
		} catch (Exception e) {
			e.printStackTrace();
			msg = "删除失败";
			System.out.println("deleteResourceById--------DAO层执行失败");
		}
		return msg;
	}

	/**
	 * 查找资源
	 * @param resourceId
	 * @return
	 * @throws Exception 
	 * 1.当resourceTypeId不为空时，根据类型查找资源
	 * 2.当resourceTypeId为空时，扫描全部资源
	 */
	@Override
	public List<Resource> showResource(String resourceId) throws Exception {
		List<Resource> resourceList = new ArrayList<Resource>();
		try {
			resourceList = resourceDao.showResource(resourceId);
			System.out.println("showResource--------DAO层执行成功");
		} catch (Exception e) {
			e.printStackTrace();
			resourceList = null;
			System.out.println("showResource--------DAO层执行失败");
		}
		return resourceList;
	}

	
	/**
	 * @author LiMing
	 * 更新资源信息
	 * */
	@Override
	public void updateResource(String resourceId,String resourceName, String resourceDetail, Timestamp publishTime,
			String publisherId, Integer resourceTypeId, String resourcePath, String courseId, String size, String timeSize,
			Integer watchNum, Integer useNum) throws Exception 
	{
		Resource resource = new Resource();
		resource.setResourceId(resourceId);
		resource.setPublisherId(publisherId);
		resource.setPublishTime(publishTime);
		resource.setResourceDetail(resourceDetail);
		resource.setResourceName(resourceName);
		resource.setResourcePath(resourcePath);
		resource.setResourceTypeId(resourceTypeId);
		resource.setSize(size);
		resource.setTimeSize(timeSize);
		resource.setUseNum(useNum);
		resource.setWatchNum(watchNum);
		resource.setCourseId(courseId);
		try {
			resourceDao.updateResource(resource);
			System.out.println("updateResource--------DAO层执行成功");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("updateResource--------DAO层执行成功");
		}
	}
//	@Override
//	public void pubResourceToClass(List<Resource> resourceList, String virtualClassNum) {
//		// TODO Auto-generated method stub
//		for(Resource resource : resourceList){
//			resourceDao.bandResourceAndClass(resource.getResourceId(), virtualClassNum);
//		}
//	}
	/*@Override
	public List<Resource> showResourceByClass(String virtualClassNum) {
		List<String> resourceIdList = resourceDao.searchResourceIdByClass(virtualClassNum); // 获取课程相关resourceId
		List<Resource> resourceList = new ArrayList<>();
		for(String resourceId : resourceIdList){
			Resource resource  = resourceDao.searchResourceById(resourceId); // 通过资源id查询相关资源
			resourceList.add(resource);
		}
		return resourceList;
	}*/
//	@Override
//	public void synchroResourceOfLibAndClass(List<Resource> resourceList, String virtualClassNum) {
//		upLoadResource(resourceList); // 更新资源库
//		pubResourceToClass(resourceList, virtualClassNum); // 遍历资源id，发布到班级
//	}

	
}

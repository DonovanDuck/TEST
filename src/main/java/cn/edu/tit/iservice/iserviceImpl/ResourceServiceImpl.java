package cn.edu.tit.iservice.iserviceImpl;

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
	public List<Resource> showResourceByCourse(Integer courseId) {
		// 调用dao层方法
		return resourceDao.searchResourceByCourse(courseId);
	}

	@Override
	public List<Resource> showResourceByType(int resourceTypeId) {
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
	public Object[] showTaskByTypeAndCId(String taskType, Integer courseId) {
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
	public Object[] showResourceByTypeAndCId(Integer resourceTypeId, Integer courseId) {
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

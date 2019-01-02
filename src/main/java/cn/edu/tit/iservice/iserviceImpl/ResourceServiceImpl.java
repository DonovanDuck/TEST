package cn.edu.tit.iservice.iserviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.tit.bean.Chapter;
import cn.edu.tit.bean.Resource;
import cn.edu.tit.idao.IResourceDao;
import cn.edu.tit.iservice.IResourceService;

@Service
public class ResourceServiceImpl implements IResourceService {
	
	@Autowired
	private IResourceDao resourceDao;

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
	public void pubResourceToClass(List<Resource> resourceList, String virtualClassNum) {
		// TODO Auto-generated method stub
		for(Resource resource : resourceList){
			resourceDao.bandResourceAndClass(resource.getResourceId(), virtualClassNum);
		}
	}


	@Override
	public List<Resource> showResourceByClass(String virtualClassNum) {
		List<String> resourceIdList = resourceDao.searchResourceIdByClass(virtualClassNum); // 获取课程相关resourceId
		List<Resource> resourceList = new ArrayList<>();
		for(String resourceId : resourceIdList){
			Resource resource  = resourceDao.searchResourceById(resourceId); // 通过资源id查询相关资源
			resourceList.add(resource);
		}
		return resourceList;
	}

	@Override
	public void synchroResourceOfLibAndClass(List<Resource> resourceList, String virtualClassNum) {
		upLoadResource(resourceList); // 更新资源库
		pubResourceToClass(resourceList, virtualClassNum); // 遍历资源id，发布到班级
	}

	@Override
	public List<Chapter> searchChapter() {
		// TODO Auto-generated method stub
		return null;
	}

}

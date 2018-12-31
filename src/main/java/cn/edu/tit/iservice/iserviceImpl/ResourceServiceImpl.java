package cn.edu.tit.iservice.iserviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<Resource> showResourceByCategory(Integer categoryId) {
		// 调用dao层方法
		return resourceDao.searchResourceByCategory(categoryId);
	}

	@Override
	public void pubResourceToClass(List<Resource> resourceList, String virtualClassNum) {
		// TODO Auto-generated method stub
		for(Resource resource : resourceList){
			resourceDao.bandResourceAndClass(resource.getResourceId(), virtualClassNum);
		}
	}

	@Override
	public void pubReasourceToLib(List<Resource> resourceList) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Resource> showResourceByClass(Integer courseId) {
		// TODO Auto-generated method stub
		return null;
	}

}

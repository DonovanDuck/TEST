package cn.edu.tit.idao;

import java.util.List;

import org.springframework.stereotype.Component;

import cn.edu.tit.bean.Resource;

@Component
public interface IResourceDao {
	/**
	 * 添加资源到资源库
	 * @param resourceList
	 */
	public void addResourceToLib(List<Resource> resourceList);
	
}

package cn.edu.tit;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import cn.edu.tit.common.Common;
import cn.edu.tit.idao.IResourceDao;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:applicationContext.xml"}) 
public class TestClass {
	private static Logger logger = Logger.getLogger(TestClass.class);  
	@Resource
	private IResourceDao resourceDao;
	@Resource
	private Common common;
	
	@Test
	public void addResourceToLib(){
		
		Timestamp publishTime = new Timestamp(System.currentTimeMillis());
		cn.edu.tit.bean.Resource r1 = new cn.edu.tit.bean.Resource(common.uuid(), "resourse1", "r1", publishTime, "1", 1, "D:/");
		cn.edu.tit.bean.Resource r2 = new cn.edu.tit.bean.Resource(common.uuid(), "resourse2", "r2", publishTime, "1", 1, "D:/");
		List<cn.edu.tit.bean.Resource> resourceList = new ArrayList<>();
		System.out.println(publishTime);
		resourceList.add(r1);
		resourceList.add(r2);
		resourceDao.addResourceToLib(resourceList);
	}
	@Test
	public void searchResourceList(){
		List<cn.edu.tit.bean.Resource> resourceList = resourceDao.searchResourceByCategory(1);
		for(cn.edu.tit.bean.Resource r : resourceList){
			System.out.println(r.getResourceId());
		}
	}
	
	@Test
	public void pubResourceToClass(){
		resourceDao.bandResourceAndClass("432811798460453484200E908AAA976F", "12345");
	}
}

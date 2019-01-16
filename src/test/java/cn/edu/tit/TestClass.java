package cn.edu.tit;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.tit.bean.Teacher;
import cn.edu.tit.common.Common;
import cn.edu.tit.common.DateConverter;
import cn.edu.tit.idao.IResourceDao;
import cn.edu.tit.idao.ITeacherDao;
import cn.edu.tit.iservice.ITeacherService;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:applicationContext.xml"}) 
public class TestClass {
	private static Logger logger = Logger.getLogger(TestClass.class);  
	@Resource
	private IResourceDao resourceDao;
	@Resource
	private Common common;
	@Resource
	private ITeacherDao teacherDao;
	@Resource
	private ITeacherService t;
	
	@Test
	public void addResourceToLib(){
		
		Timestamp publishTime = new Timestamp(System.currentTimeMillis());

		List<cn.edu.tit.bean.Resource> resourceList = new ArrayList<>();
		System.out.println(publishTime);

		resourceDao.addResourceToLib(resourceList);
	}
	
	@Test
	public void searchResourceByType(){
		List<cn.edu.tit.bean.Resource> resourceList = resourceDao.searchResourceByType(1);
		for(cn.edu.tit.bean.Resource r : resourceList){
			System.out.println(r.getPublishTime());
		}
	}
	@Test
	public void searchResourcePathById(){
		//System.out.println(resourceDao.searchResourcePathById("C380388ADEC14179A0EDFE93331159F3"));
		//System.out.println(resourceDao.searchResourceByName("r1"));
		//System.out.println(resourceDao.searchResourceByKnow("1"));
		//System.out.println(teacherDao.searchCourseById(1));
		//System.out.println(teacherDao.getEmployeeNumByCourseId(1));
		//System.out.println(teacherDao.getTeachersById(teacherDao.getEmployeeNumByCourseId(1)));
		//System.out.println(resourceDao.searchTaskByTypeAndCid("work", 1));
		//System.out.println(teacherDao.getTeacherNameById("2"));
		//System.out.println(resourceDao.searchResourceByTypeAndCid(1, 1));
//		Date date = new Date();       
//		Timestamp nousedate = new Timestamp(date.getTime());
//		DateConverter d = new DateConverter();
		}
	
	
//	@Test
//	public void searchResourceList(){
//		List<cn.edu.tit.bean.Resource> resourceList = resourceDao.searchResourceByCategory(1);
//		for(cn.edu.tit.bean.Resource r : resourceList){
//			System.out.println(r.getResourceId());
//		}
//	}
//	
	@Test
	public void pubResourceToClass(){
		resourceDao.bandResourceAndClass("432811798460453484200E908AAA976F", "12345");
	}
	
	@Test
	public void searchresourceidByClass(){
		List<String> resourceIdList = resourceDao.searchResourceIdByClass("12345");
		for(String resourceId : resourceIdList){
			System.out.println(resourceId);
		}
	}
	
	@Test
	public void searchResourceById(){
		cn.edu.tit.bean.Resource resource = resourceDao.searchResourceById("F57A64F45C4C4F0DBE38E27302B7349C");
		System.out.println(resource.getPublisherId());
	}
	
	@Test
	public void getSignPoint() throws Exception{
		System.out.println(teacherDao.getSignPoint());
	}
}

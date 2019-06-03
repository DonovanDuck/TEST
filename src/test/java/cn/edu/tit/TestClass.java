package cn.edu.tit;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.CourseExpand;
import cn.edu.tit.bean.Task;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.common.Common;
import cn.edu.tit.common.DateConverter;
import cn.edu.tit.idao.IAchievementDao;
import cn.edu.tit.idao.IResourceDao;
import cn.edu.tit.idao.IStudentDao;
import cn.edu.tit.idao.ITeacherDao;
import cn.edu.tit.iservice.IStudentService;
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
	private IStudentDao studentDao;
	@Resource
	private ITeacherService teacherService;
	@Autowired
	private IAchievementDao achievementDao; 
	
	
	@Test
	public void searchResourceByType(){
		 try {
			teacherService.addWatchNum("0F0C4B0CD1834F91837146D59BD04097", 82);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
}

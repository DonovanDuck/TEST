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
		List<String> a = new ArrayList<>();
		a.add("4A658F6B125A46CEB294137D9B7CA6B0");
		a.add("135F5DAD9E604958A8C921A9220B3D10");
		 try {
			List<Task> t = teacherService.TaskList(a);
			for(Task ta : t){
				System.out.println(ta.getTaskEndTime());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
}

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

import cn.edu.tit.bean.Attendance;
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
			/*System.out.println(teacherService.getLastAttIndex("4BC2E4C97DC14B7EA73EF9DE837E0590"));
			Attendance att = new Attendance();
			att.setAttendanceId(Common.uuid());
			att.setVirtualClassNum("4BC2E4C97DC14B7EA73EF9DE837E0590");
			//设置第几次打卡
			att.setAttIndex(teacherService.getLastAttIndex("4BC2E4C97DC14B7EA73EF9DE837E0590")+1);
			Timestamp attTime = new Timestamp(System.currentTimeMillis());
			att.setAttendanceTime(attTime);
			att.setAttendanceNum(0);
			att.setTotalNum(teacherService.getTaskUserNum("4BC2E4C97DC14B7EA73EF9DE837E0590"));
			att.setLeaveNum(0);
			att.setTruancyNum(0);
			att.setPublishId("1");
			//添加
			teacherService.addAttendance(att);*/
<<<<<<< HEAD
			//获取manager
				Integer manager  = teacherService.getMaxManager("aaa");
				if(manager == null){
					manager = 2;
				}
				else{
					manager +=1;
				}
				System.out.println(manager);
=======
			//			String t = teacherService.getAttTime("2", "1");
			//			System.out.println(t.toString().substring(0, 16));
			System.out.println(Common.eccryptMD5("1"));
>>>>>>> liming
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



}

package cn.edu.tit;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.tit.bean.IURP;
import cn.edu.tit.iservice.IAchievementService;

@RunWith(SpringJUnit4ClassRunner.class) // 表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class Achievement {
	@Resource
	private IAchievementService iAchievementService;
	@Test
	public void Test() throws Exception {
		List<cn.edu.tit.bean.Achievement> list =new ArrayList<>();
		List<cn.edu.tit.bean.IURP> listIURP =new ArrayList<>();
		list = iAchievementService.queryAchievement();
		listIURP = iAchievementService.queryIURP();
		//		for (cn.edu.tit.bean.Achievement achievement : list) {
		//			System.out.println(achievement.toString());
		//		}

		for (IURP iurp : listIURP) {
			System.out.println(iurp.toString());
		}
	}
}

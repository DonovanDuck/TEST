package cn.edu.tit;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.tit.bean.AchievementAccessory;
import cn.edu.tit.bean.IURP;
import cn.edu.tit.iservice.IAchievementService;

@RunWith(SpringJUnit4ClassRunner.class) // 表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class Achievement {
	@Resource
	private IAchievementService iAchievementService;
	@Test
	public void Test() throws Exception {
		//		AchievementAccessory aa = new AchievementAccessory();
		//		aa.setAccessoryId("id");
		//		aa.setAccessoryName("name");
		//		aa.setAccessoryPath("path");
		//		aa.setAccessoryTime(null);
		//		aa.setAchievementId("achievementId");
		//		aa.setAuthorId("authorId");
		//		aa.setDeleteFlag(1);
		//		List<AchievementAccessory> list = new ArrayList<>();
		//		list.add(aa);
		//		iAchievementService.insertAchievementAccessory(list);
		iAchievementService.updateAOCSCBrowseVolume("09708A3B8D8942929FE777E4D9DC5397");
	}
}

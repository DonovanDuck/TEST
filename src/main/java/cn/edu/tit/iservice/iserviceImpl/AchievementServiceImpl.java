package cn.edu.tit.iservice.iserviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.tit.bean.Achievement;
import cn.edu.tit.bean.IURP;
import cn.edu.tit.idao.IAchievementDao;
import cn.edu.tit.iservice.IAchievementService;

@Service
public class AchievementServiceImpl implements IAchievementService{

	@Autowired
	private IAchievementDao achievementDao; 
	/**
	 * @author LiMing
	 * 查询成果
	 */
	@Override
	public List<Achievement> queryAchievement() throws Exception {
		List<Achievement> list = new ArrayList<>();
		try {
			list =achievementDao.queryAchievement();
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * @author LiMing
	 * 查询产学研
	 */
	@Override
	public List<IURP> queryIURP() throws Exception {
		List<IURP> list = new ArrayList<>();
		try {
			list =achievementDao.queryIURP();
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * @author LiMing
	 * 根据成果类型查找
	 */
	@Override
	public List<Achievement> queryAchievementByCategory(String category) throws Exception{
		List<Achievement> list = new ArrayList<>();
		try {
			list =achievementDao.queryAchievementByCategory(category);
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Achievement> queryAchievementByName(String search) throws Exception {
		List<Achievement> list = new ArrayList<>();
		try {
			list =achievementDao.queryAchievementByName(search);
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Achievement> queryAchievementByTeam(String search) throws Exception {
		List<Achievement> list = new ArrayList<>();
		try {
			list =achievementDao.queryAchievementByTeam(search);
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<IURP> queryIURPByName(String search) throws Exception {
		List<IURP> list = new ArrayList<>();
		try {
			list =achievementDao.queryIURPByName(search);
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<IURP> queryIURPByAuthor(String search) throws Exception {
		List<IURP> list = new ArrayList<>();
		try {
			list =achievementDao.queryIURPByAuthor(search);
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

}

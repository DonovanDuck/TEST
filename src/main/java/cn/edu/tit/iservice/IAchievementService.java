package cn.edu.tit.iservice;

import java.util.List;
import cn.edu.tit.bean.Achievement;
import cn.edu.tit.bean.IURP;

public interface IAchievementService {

	/**
	 * @author LiMing
	 * 查询成果
	 */
	public List<Achievement> queryAchievement() throws Exception;
	/**
	 * @author LiMing
	 * 查询产学研
	 */
	public List<IURP> queryIURP() throws Exception;
	/**
	 * @author LiMing
	 * 根据成果类型查找
	 * @param category 
	 */
	public List<Achievement> queryAchievementByCategory(String category) throws Exception;
	public List<Achievement> queryAchievementByName(String search) throws Exception;
	public List<Achievement> queryAchievementByTeam(String search)throws Exception;
	public List<IURP> queryIURPByName(String search)throws Exception;
	public List<IURP> queryIURPByAuthor(String search)throws Exception;
}

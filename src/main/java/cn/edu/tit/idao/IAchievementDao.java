package cn.edu.tit.idao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameter;

import cn.edu.tit.bean.Achievement;
import cn.edu.tit.bean.IURP;

public interface IAchievementDao {
	public List<Achievement> queryAchievement() throws Exception;
	public List<IURP> queryIURP() throws Exception;
	public List<Achievement> queryAchievementByCategory(@Param("category")String category) throws Exception;
	public List<Achievement> queryAchievementByName(@Param("search")String search)throws Exception;
	public List<Achievement> queryAchievementByTeam(@Param("search")String search)throws Exception;
	public List<IURP> queryIURPByName(@Param("search")String search)throws Exception;
	public List<IURP> queryIURPByAuthor(@Param("search")String search)throws Exception;
}

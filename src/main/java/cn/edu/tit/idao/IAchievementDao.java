package cn.edu.tit.idao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameter;

import cn.edu.tit.bean.AOCSC;
import cn.edu.tit.bean.Achievement;
import cn.edu.tit.bean.AchievementAccessory;
import cn.edu.tit.bean.AchievementPicture;
import cn.edu.tit.bean.CourseExpand;
import cn.edu.tit.bean.GDFCS;
import cn.edu.tit.bean.IURP;
import cn.edu.tit.bean.SIAE;

public interface IAchievementDao {
	public List<IURP> queryIURP() throws Exception;
	public List<IURP> queryIURPByName(@Param("search")String search)throws Exception;
	public List<IURP> queryIURPByAuthor(@Param("search")String search)throws Exception;
	public void insertIURP(@Param("iurp")IURP iurp)throws Exception;
	
	public List<AOCSC> queryAOCSC();
	public List<AOCSC> queryAOCSCByName(@Param("search")String search);
	public List<AOCSC> queryAOCSCByAuthor(@Param("search")String search);
	public void insertAOCSC(@Param("iu")AOCSC iu);
	
	public List<CourseExpand> queryCourseExpand();
	public List<CourseExpand> queryCourseExpandByName(@Param("search")String search);
	public List<CourseExpand> queryCourseExpandByAuthor(@Param("search")String search);
	public void insertCourseExpand(@Param("iu")CourseExpand iu);
	
	public List<GDFCS> queryGDFCS();
	public List<GDFCS> queryGDFCSByName(@Param("search")String search);
	public List<GDFCS> queryGDFCSByAuthor(@Param("search")String search);
	public void insertGDFCS(@Param("gdfcs")GDFCS gdfcs);
	
	public List<SIAE> querySIAE();
	public List<SIAE> querySIAEByName(@Param("search")String search);
	public List<SIAE> querySIAEByAuthor(@Param("search")String search);
	public void insertSIAE(@Param("siae")SIAE siae);
	
	public List<AchievementPicture> queryAchievementPicture(@Param("achievementId")String achievementId);
	public void insertAchievementPicture(@Param("ap")List<AchievementPicture> ap);
	
	public List<AchievementAccessory> queryAchievementAccessory(@Param("achievementId")String achievementId);
	public void insertAchievementAccessory(@Param("ap")List<AchievementAccessory> ap);
}

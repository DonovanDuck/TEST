package cn.edu.tit.idao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameter;

import cn.edu.tit.bean.AOCSC;
import cn.edu.tit.bean.AchievementAccessory;
import cn.edu.tit.bean.AchievementComment;
import cn.edu.tit.bean.AchievementPicture;
import cn.edu.tit.bean.CourseExpand;
import cn.edu.tit.bean.GDFCS;
import cn.edu.tit.bean.IURP;
import cn.edu.tit.bean.SIAE;

public interface IAchievementDao {
	public List<IURP> queryIURP() throws Exception;
	public List<IURP> queryAllIURP() throws Exception;
	public List<IURP> queryIURPByAuthorId(@Param("authorId")String authorId)throws Exception;
	public List<IURP> queryIURPByName(@Param("search")String search)throws Exception;
	public List<IURP> queryIURPByAuthor(@Param("search")String search)throws Exception;
	public void insertIURP(@Param("iurp")IURP iurp)throws Exception;
	public IURP queryIURPById(@Param("achievementId")String achievementId)throws Exception;
	public void updateIURPBrowseVolume(@Param("achievementId")String achievementId)throws Exception;
	public void deleteIURP(@Param("achievementId")String achievementId)throws Exception;
	public void restoreIURP(@Param("achievementId")String achievementId)throws Exception;
	
	public List<AOCSC> queryAOCSC()throws Exception;
	public List<AOCSC> queryAllAOCSC()throws Exception;
	public List<AOCSC> queryAOCSCByAuthorId(@Param("authorId")String authorId)throws Exception;
	public List<AOCSC> queryAOCSCByName(@Param("search")String search)throws Exception;
	public List<AOCSC> queryAOCSCByAuthor(@Param("search")String search)throws Exception;
	public void insertAOCSC(@Param("iu")AOCSC iu)throws Exception;
	public AOCSC queryAOCSCById(@Param("achievementId")String achievementId)throws Exception;
	public void updateAOCSCBrowseVolume(@Param("achievementId")String achievementId)throws Exception;
	public void deleteAOCSC(@Param("achievementId")String achievementId)throws Exception;
	public void restoreAOCSC(@Param("achievementId")String achievementId)throws Exception;
	
	public List<CourseExpand> queryCourseExpand()throws Exception;
	public List<CourseExpand> queryAllCourseExpand()throws Exception;
	public List<CourseExpand> queryCourseExpandByAuthorId(@Param("authorId")String authorId)throws Exception;
	public List<CourseExpand> queryCourseExpandByName(@Param("search")String search)throws Exception;
	public List<CourseExpand> queryCourseExpandByAuthor(@Param("search")String search)throws Exception;
	public void insertCourseExpand(@Param("iu")CourseExpand iu)throws Exception;
	public CourseExpand queryCourseExpandById(@Param("achievementId")String achievementId)throws Exception;
	public void updateCourseExpandBrowseVolume(@Param("achievementId")String achievementId)throws Exception;
	public void deleteCourseExpand(@Param("achievementId")String achievementId)throws Exception;
	public void restoreCourseExpand(@Param("achievementId")String achievementId)throws Exception;
	
	public List<GDFCS> queryGDFCS()throws Exception;
	public List<GDFCS> queryAllGDFCS()throws Exception;
	public List<GDFCS> queryGDFCSByAuthorId(@Param("authorId")String authorId)throws Exception;
	public List<GDFCS> queryGDFCSByName(@Param("search")String search)throws Exception;
	public List<GDFCS> queryGDFCSByAuthor(@Param("search")String search)throws Exception;
	public void insertGDFCS(@Param("gdfcs")GDFCS gdfcs)throws Exception;
	public GDFCS queryGDFCSById(@Param("achievementId")String achievementId)throws Exception;
	public void updateGDFCSBrowseVolume(@Param("achievementId")String achievementId)throws Exception;
	public void deleteGDFCS(@Param("achievementId")String achievementId)throws Exception;
	public void restoreGDFCS(@Param("achievementId")String achievementId)throws Exception;
	
	public List<SIAE> querySIAE()throws Exception;
	public List<SIAE> queryAllSIAE()throws Exception;
	public List<SIAE> querySIAEByAuthorId(@Param("authorId")String authorId)throws Exception;
	public List<SIAE> querySIAEByName(@Param("search")String search)throws Exception;
	public List<SIAE> querySIAEByAuthor(@Param("search")String search)throws Exception;
	public void insertSIAE(@Param("siae")SIAE siae)throws Exception;
	public SIAE querySIAEById(@Param("achievementId")String achievementId)throws Exception;
	public void updateSIAEBrowseVolume(@Param("achievementId")String achievementId)throws Exception;
	public void deleteSIAE(@Param("achievementId")String achievementId)throws Exception;
	public void restoreSIAE(@Param("achievementId")String achievementId)throws Exception;
	
	public List<AchievementPicture> queryAchievementPicture(@Param("achievementId")String achievementId)throws Exception;
	public void insertAchievementPicture(@Param("list")List<AchievementPicture> list)throws Exception;
	
	public List<AchievementAccessory> queryAchievementAccessory(@Param("achievementId")String achievementId)throws Exception;
	public void insertAchievementAccessory(@Param("list")List<AchievementAccessory> list)throws Exception;
	
	public void insertAchievementComment(@Param("comment")AchievementComment comment)throws Exception;
	public List<AchievementComment> queryComment(@Param("achievementId")String achievementId,@Param("category")String category);
}

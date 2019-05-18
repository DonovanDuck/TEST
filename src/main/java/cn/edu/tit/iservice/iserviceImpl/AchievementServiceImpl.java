package cn.edu.tit.iservice.iserviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.tit.bean.AOCSC;
import cn.edu.tit.bean.AchievementAccessory;
import cn.edu.tit.bean.AchievementComment;
import cn.edu.tit.bean.AchievementPicture;
import cn.edu.tit.bean.CourseExpand;
import cn.edu.tit.bean.GDFCS;
import cn.edu.tit.bean.IURP;
import cn.edu.tit.bean.SIAE;
import cn.edu.tit.idao.IAchievementDao;
import cn.edu.tit.iservice.IAchievementService;

@Service
public class AchievementServiceImpl implements IAchievementService{

	@Autowired
	private IAchievementDao achievementDao; 

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

	/**
	 * @author LiMing
	 * 添加产学研信息
	 * @param category 
	 */
	@Override
	public void insertIURP(IURP iu)throws Exception {
		try {
			achievementDao.insertIURP(iu);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<AOCSC> queryAOCSC() throws Exception {
		List<AOCSC> list = new ArrayList<>();
		try {
			list =achievementDao.queryAOCSC();
		} catch (Exception e) {
			list = null;
			e.printStackTrace();

		}
		return list;	
	}

	@Override
	public List<AOCSC> queryAOCSCByName(String search) throws Exception {
		List<AOCSC> list = new ArrayList<>();
		try {
			list =achievementDao.queryAOCSCByName(search);
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<AOCSC> queryAOCSCByAuthor(String search) throws Exception {
		List<AOCSC> list = new ArrayList<>();
		try {
			list =achievementDao.queryAOCSCByAuthor(search);
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public void insertAOCSC(AOCSC iu) throws Exception {
		try {
			achievementDao.insertAOCSC(iu);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<CourseExpand> queryCourseExpand() throws Exception {
		// TODO Auto-generated method stub
		List<CourseExpand> list = new ArrayList<>();
		try {
			list =achievementDao.queryCourseExpand();
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<CourseExpand> queryCourseExpandByName(String search) throws Exception {
		// TODO Auto-generated method stub
		List<CourseExpand> list = new ArrayList<>();
		try {
			list =achievementDao.queryCourseExpandByName(search);
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<CourseExpand> queryCourseExpandByAuthor(String search) throws Exception {
		List<CourseExpand> list = new ArrayList<>();
		try {
			list =achievementDao.queryCourseExpandByAuthor(search);
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertCourseExpand(CourseExpand iu) throws Exception {
		try {
			achievementDao.insertCourseExpand(iu);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<GDFCS> queryGDFCS() throws Exception {
		List<GDFCS> list = new ArrayList<>();
		try {
			list =achievementDao.queryGDFCS();
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<GDFCS> queryGDFCSByName(String search) throws Exception {
		List<GDFCS> list = new ArrayList<>();
		try {
			list =achievementDao.queryGDFCSByName(search);
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<GDFCS> queryGDFCSByAuthor(String search) throws Exception {
		List<GDFCS> list = new ArrayList<>();
		try {
			list =achievementDao.queryGDFCSByAuthor(search);
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertGDFCS(GDFCS gdfcs) throws Exception {
		try {
			achievementDao.insertGDFCS(gdfcs);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<SIAE> querySIAE() throws Exception {
		List<SIAE> list = new ArrayList<>();
		try {
			list =achievementDao.querySIAE();
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<SIAE> querySIAEByName(String search) throws Exception {
		List<SIAE> list = new ArrayList<>();
		try {
			list =achievementDao.querySIAEByName(search);
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<SIAE> querySIAEByAuthor(String search) throws Exception {
		List<SIAE> list = new ArrayList<>();
		try {
			list =achievementDao.querySIAEByAuthor(search);
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertSIAE(SIAE siae) throws Exception {
		try {
			achievementDao.insertSIAE(siae);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<AchievementPicture> queryAchievementPicture(String achievementId) throws Exception {
		List<AchievementPicture> list = new ArrayList<>();
		try {
			list =achievementDao.queryAchievementPicture(achievementId);
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertAchievementPicture(List<AchievementPicture> ap) throws Exception {
		try {
			achievementDao.insertAchievementPicture(ap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<AchievementAccessory> queryAchievementAccessory(String achievementId) throws Exception {
		List<AchievementAccessory> list = new ArrayList<>();
		try {
			list =achievementDao.queryAchievementAccessory(achievementId);
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertAchievementAccessory(List<AchievementAccessory> ap) throws Exception {
		try {
			achievementDao.insertAchievementAccessory(ap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public IURP queryIURPById(String achievementId) throws Exception {
		IURP iu = new IURP();
		try {
			iu = achievementDao.queryIURPById(achievementId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return iu;
	}

	@Override
	public AOCSC queryAOCSCById(String achievementId) throws Exception {
		AOCSC iu = new AOCSC();
		try {
			iu = achievementDao.queryAOCSCById(achievementId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return iu;
	}

	@Override
	public CourseExpand queryCourseExpandById(String achievementId) throws Exception {
		CourseExpand iu = new CourseExpand();
		try {
			iu = achievementDao.queryCourseExpandById(achievementId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return iu;
	}

	@Override
	public GDFCS queryGDFCSById(String achievementId) throws Exception {
		GDFCS iu = new GDFCS();
		try {
			iu = achievementDao.queryGDFCSById(achievementId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return iu;
	}

	@Override
	public SIAE querySIAEById(String achievementId) {
		SIAE iu = new SIAE();
		try {
			iu = achievementDao.querySIAEById(achievementId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return iu;
	}

	@Override
	public void updateIURPBrowseVolume(String achievementId) throws Exception {
		try {
		  achievementDao.updateIURPBrowseVolume(achievementId);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	@Override
	public void updateAOCSCBrowseVolume(String achievementId) throws Exception {
		try {
			  achievementDao.updateAOCSCBrowseVolume(achievementId);
			} catch (Exception e) {
				e.printStackTrace();
			}			
	}

	@Override
	public void updateCourseExpandBrowseVolume(String achievementId) throws Exception {
		try {
			  achievementDao.updateCourseExpandBrowseVolume(achievementId);
			} catch (Exception e) {
				e.printStackTrace();
			}			
	}

	@Override
	public void updateGDFCSBrowseVolume(String achievementId) throws Exception {
		try {
			  achievementDao.updateGDFCSBrowseVolume(achievementId);
			} catch (Exception e) {
				e.printStackTrace();
			}			
	}

	@Override
	public void updateSIAEBrowseVolume(String achievementId) throws Exception {
		try {
			  achievementDao.updateSIAEBrowseVolume(achievementId);
			} catch (Exception e) {
				e.printStackTrace();
			}			
	}

	@Override
	public List<AchievementComment> queryComment(String achievementId,String category) throws Exception {
		List<AchievementComment> list = new ArrayList<>();
		try {
			 list = achievementDao.queryComment(achievementId,category);
			} catch (Exception e) {
				e.printStackTrace();
				list = null;
			}		
		return list;
	}

	@Override
	public void insertAchievementComment(AchievementComment comment) throws Exception {
		try {
			  achievementDao.insertAchievementComment(comment);
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

	@Override
	public List<IURP> queryIURPByAuthorId(String authorId) throws Exception {
		List<IURP> list = new ArrayList<>();
		try {
			 list = achievementDao.queryIURPByAuthorId(authorId);
			} catch (Exception e) {
				e.printStackTrace();
				list = null;
			}		
		return list;
	}

	@Override
	public List<AOCSC> queryAOCSCByAuthorId(String authorId) throws Exception {
		List<AOCSC> list = new ArrayList<>();
		try {
			 list = achievementDao.queryAOCSCByAuthorId(authorId);
			} catch (Exception e) {
				e.printStackTrace();
				list = null;
			}		
		return list;
	}

	@Override
	public List<CourseExpand> queryCourseExpandByAuthorId(String authorId) throws Exception {
		List<CourseExpand> list = new ArrayList<>();
		try {
			 list = achievementDao.queryCourseExpandByAuthorId(authorId);
			} catch (Exception e) {
				e.printStackTrace();
				list = null;
			}		
		return list;
	}

	@Override
	public List<GDFCS> queryGDFCSByAuthorId(String authorId) throws Exception {
		List<GDFCS> list = new ArrayList<>();
		try {
			 list = achievementDao.queryGDFCSByAuthorId(authorId);
			} catch (Exception e) {
				e.printStackTrace();
				list = null;
			}		
		return list;
	}

	@Override
	public List<SIAE> querySIAEByAuthorId(String authorId) throws Exception {
		List<SIAE> list = new ArrayList<>();
		try {
			 list = achievementDao.querySIAEByAuthorId(authorId);
			} catch (Exception e) {
				e.printStackTrace();
				list = null;
			}		
		return list;
	}
}
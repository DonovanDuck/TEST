package cn.edu.tit.controller;

import java.io.File;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.tit.bean.AOCSC;
import cn.edu.tit.bean.AchievementAccessory;
import cn.edu.tit.bean.AchievementPicture;
import cn.edu.tit.bean.CourseExpand;
import cn.edu.tit.bean.GDFCS;
import cn.edu.tit.bean.IURP;
import cn.edu.tit.bean.SIAE;
import cn.edu.tit.bean.Student;
import cn.edu.tit.common.Common;
import cn.edu.tit.iservice.IAchievementService;

@RequestMapping("/achievement")
@Controller
public class AchievementController {
	@Autowired
	private IAchievementService iAchievementService;

	/**
	 * 跳转到学生成果页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value="toAchievementMainPage")
	public ModelAndView toAchievementMainPage(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		List<AOCSC> aocscList =new ArrayList<>();
		List<CourseExpand> courseExpandList =new ArrayList<>();
		List<GDFCS> gdfcsList =new ArrayList<>();
		List<SIAE> siaeList =new ArrayList<>();
		List<IURP> iURPList =new ArrayList<>();
		try {
			aocscList = iAchievementService.queryAOCSC();
			courseExpandList = iAchievementService.queryCourseExpand();
			gdfcsList = iAchievementService.queryGDFCS();
			siaeList = iAchievementService.querySIAE();
			iURPList = iAchievementService.queryIURP();
			mv.addObject("aocscList",aocscList);
			mv.addObject("courseExpandList",courseExpandList);
			mv.addObject("gdfcsList",gdfcsList);
			mv.addObject("siaeList",siaeList);
			mv.addObject("iURPList",iURPList);
			mv.setViewName("/jsp/AchievementJsp/achievementMain");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	/**
	 * 跳转到发布成果页
	 * @param request
	 * @return
	 */
	@RequestMapping(value="toUploadAchievement")
	public ModelAndView toUploadAchievement(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		try {
			mv.setViewName("/jsp/AchievementJsp/uploadAchievement");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}


	/**
	 * 类别选择
	 * @param request
	 * @return
	 * 1.课程拓展
	 * 2.大学生创新创业
	 * 3.大学生竞赛
	 * 4.毕设
	 * 5.产学研
	 * @throws Exception 
	 */
	@RequestMapping(value="selectCategory")
	public ModelAndView selectCategory(HttpServletRequest request,@RequestParam(value="category") String category) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<AOCSC> aocscList =new ArrayList<>();
		List<CourseExpand> courseExpandList =new ArrayList<>();
		List<GDFCS> gdfcsList =new ArrayList<>();
		List<SIAE> siaeList =new ArrayList<>();
		List<IURP> iURPList =new ArrayList<>();
		switch (category) {
		case "AOCSC":
			aocscList = iAchievementService.queryAOCSC();
			break;
		case "CourseExpand":
			courseExpandList = iAchievementService.queryCourseExpand();
			break;
		case "GDFCS":
			gdfcsList = iAchievementService.queryGDFCS();
			break;
		case "SIAE":			
			siaeList = iAchievementService.querySIAE();
			break;
		case "IURP":	
			iURPList = iAchievementService.queryIURP();
			break;
		}
		try {		
			mv.addObject("aocscList",aocscList);
			mv.addObject("courseExpandList",courseExpandList);
			mv.addObject("gdfcsList",gdfcsList);
			mv.addObject("siaeList",siaeList);
			mv.addObject("iURPList",iURPList);
			mv.setViewName("/jsp/AchievementJsp/achievementMain");
		} catch (Exception e) {
			e.printStackTrace();
			mv = toAchievementMainPage(request);
		}
		return mv;
	}

	/**
	 * 搜索框
	 * @param request
	 * @return
	 */
	@RequestMapping(value="toSearch")
	public ModelAndView toSearch(HttpServletRequest request,@RequestParam(value="search") String search){
		ModelAndView mv = new ModelAndView();
		List<AOCSC> aocscList =new ArrayList<>();
		List<AOCSC> aocscListAuthor =new ArrayList<>();
		List<CourseExpand> courseExpandList =new ArrayList<>();
		List<CourseExpand> courseExpandListAuthor =new ArrayList<>();
		List<GDFCS> gdfcsList =new ArrayList<>();
		List<GDFCS> gdfcsListAuthor =new ArrayList<>();
		List<SIAE> siaeList =new ArrayList<>();
		List<SIAE> siaeListAuthor =new ArrayList<>();
		List<IURP> iURPList =new ArrayList<>();
		List<IURP> iURPListAuthor =new ArrayList<>();
		try {
			aocscList = iAchievementService.queryAOCSCByName(search);
			aocscListAuthor = iAchievementService.queryAOCSCByAuthor(search);
			aocscList.removeAll(aocscListAuthor);
			aocscList.addAll(aocscListAuthor);	
			courseExpandList = iAchievementService.queryCourseExpandByName(search);
			courseExpandListAuthor = iAchievementService.queryCourseExpandByAuthor(search);
			courseExpandList.removeAll(courseExpandListAuthor);
			courseExpandList.addAll(courseExpandListAuthor);		
			gdfcsList = iAchievementService.queryGDFCSByName(search);
			gdfcsListAuthor = iAchievementService.queryGDFCSByAuthor(search);
			gdfcsList.removeAll(gdfcsListAuthor);
			gdfcsList.addAll(gdfcsListAuthor);
			siaeList = iAchievementService.querySIAEByName(search);
			siaeListAuthor = iAchievementService.querySIAEByAuthor(search);
			siaeList.removeAll(siaeListAuthor);
			siaeList.addAll(siaeListAuthor);
			iURPList = iAchievementService.queryIURPByName(search);
			iURPListAuthor = iAchievementService.queryIURPByAuthor(search);
			iURPList.removeAll(iURPListAuthor);
			iURPList.addAll(iURPListAuthor);
			mv.addObject("aocscList",aocscList);
			mv.addObject("courseExpandList",courseExpandList);
			mv.addObject("gdfcsList",gdfcsList);
			mv.addObject("siaeList",siaeList);
			mv.addObject("iURPList",iURPList);
			mv.setViewName("/jsp/AchievementJsp/achievementMain");
		} catch (Exception e) {
			e.printStackTrace();
			mv = toAchievementMainPage(request);
		}
		return mv;
	}

	@SuppressWarnings("unused")
	private Date ConverDate(String string) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate = new java.util.Date();//util.Date
		Date sqlDate = new java.sql.Date(sdf.parse(string).getTime());
		return sqlDate;
	}

	/**
	 * 发布成果信息
	 * @return
	 */
	@RequestMapping(value="publishIURP")
	@SuppressWarnings({ "unused", "unchecked" })
	public ModelAndView publishIURP(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		try {
			//Student stu = (Student) request.getSession().getAttribute("Student");
			String projectId = Common.uuid();
			Object[] obj = Common.fileFactory(request,projectId);
			List<File> files = (List<File>) obj[0];	// 获取课程图片
			Map<String, Object> formdata = (Map<String, Object>) obj[1]; // 获取课程内容
			IURP i = new IURP();
			i.setCompere((String)formdata.get("compere"));
			i.setCooperator((String)formdata.get("cooperator"));
			i.setEndTime(ConverDate((String)formdata.get("endTime")));
			i.setIntroduction((String)formdata.get("introduction"));
			i.setIsshare((String)formdata.get("isShare"));
			i.setMember((String)formdata.get("memberContent"));
			i.setPrice(Float.parseFloat((String)formdata.get("price")));
			i.setProjectCategory("产学研");
			i.setProjectDetail((String)formdata.get("detail"));
			i.setProjectId(projectId);
			i.setProjectName((String)formdata.get("name"));
			i.setStartTime(ConverDate((String)formdata.get("startTime")));
			i.setStatus(null);
			i.setFirstPicture(Common.readProperties("path")+"/"+files.get(0).getName());//获取图片的第一个图片
			iAchievementService.insertIURP(i);
			/**
			 * 文件的处理
			 * */
			List<AchievementPicture> pictureList = new ArrayList<>();
			AchievementPicture pi;
			for(int j = 0;j<files.size()-1;j++){
				File f = files.get(j);
				String accessoryId = Common.uuid();
				pi = new AchievementPicture();
				pi.setAccessoryId(accessoryId);
				pi.setAccessoryName(f.getName());
				pi.setAccessoryPath(Common.readProperties("path")+"/"+f.getName());
				pi.setAccessoryTime(new Timestamp(System.currentTimeMillis()));
				pi.setAchievementId(projectId);
				pi.setAuthorId(null);
				pi.setDeleteFlag(null);
				pictureList.add(pi);
			}
			pictureList.remove(0);//第一张图片存至对象中，剩下图片放置入图片库
			iAchievementService.insertAchievementPicture(pictureList);
			AchievementAccessory aa = new AchievementAccessory();
			List<AchievementAccessory> aaList = new ArrayList<>();
			String accessoryId = Common.uuid();
			aa.setAccessoryId(accessoryId);
			aa.setAccessoryName(files.get(files.size()-1).getName());
			aa.setAccessoryPath(Common.readProperties("path")+"/"+files.get(files.size()-1).getName());
			aa.setAccessoryTime(new Timestamp(System.currentTimeMillis()));
			aa.setAchievementId(projectId);
			aa.setAuthorId(null);
			aa.setDeleteFlag(null);
			aaList.add(aa);
			iAchievementService.insertAchievementAccessory(aaList);
			/**文件处理结束***/
			return mv = toAchievementMainPage(request);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return mv = toUploadAchievement(request);
		}
	}


	/******************************************详情页*********************************************************/
	/**
	 * 跳转到产学研成果详情页
	 * @param request
	 * @return
	 */
	@RequestMapping(value="toDetailIURP")
	public ModelAndView toDetailIURP(HttpServletRequest request,@RequestParam(value="achievementId") String achievementId){
		ModelAndView mv = new ModelAndView();
		try {
			IURP iu = new IURP();
			iu = iAchievementService.queryIURPById(achievementId);
			List<AchievementPicture> piList = new ArrayList<>();
			piList = iAchievementService.queryAchievementPicture(achievementId);
			mv.addObject("pictureList",piList);
			mv.addObject("IURP",iu);
			mv.setViewName("/jsp/AchievementJsp/detailIURP");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	/**
	 * 跳转到课程拓展成果详情页
	 * @param request
	 * @return
	 */
	@RequestMapping(value="toDetailCourseExpand")
	public ModelAndView toDetailCourseExpand(HttpServletRequest request,@RequestParam(value="achievementId") String achievementId){
		ModelAndView mv = new ModelAndView();
		try {
			CourseExpand ce =  new CourseExpand();
			ce = iAchievementService.queryCourseExpandById(achievementId);
			List<AchievementPicture> piList = new ArrayList<>();
			piList = iAchievementService.queryAchievementPicture(achievementId);
			mv.addObject("pictureList",piList);
			mv.addObject("Achievement", ce);
			mv.setViewName("/jsp/AchievementJsp/detailAchievement");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}/**
	 * 跳转到大学生毕设成果详情页
	 * @param request
	 * @return
	 */
	@RequestMapping(value="toDetailGDFCS")
	public ModelAndView toDetailGDFCS(HttpServletRequest request,@RequestParam(value="achievementId") String achievementId){
		ModelAndView mv = new ModelAndView();
		try {
			GDFCS gd = new GDFCS();
			gd = iAchievementService.queryGDFCSById(achievementId);
			List<AchievementPicture> piList = new ArrayList<>();
			piList = iAchievementService.queryAchievementPicture(achievementId);
			mv.addObject("pictureList",piList);
			mv.addObject("Achievement", gd);
			mv.setViewName("/jsp/AchievementJsp/detailAchievement");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}/**
	 * 跳转到大学身创新创业成果详情页
	 * @param request
	 * @return
	 */
	@RequestMapping(value="toDetailSIAE")
	public ModelAndView toDetailSIAE(HttpServletRequest request,@RequestParam(value="achievementId") String achievementId){
		ModelAndView mv = new ModelAndView();
		try {
			SIAE si = new SIAE();
			si = iAchievementService.querySIAEById(achievementId);
			List<AchievementPicture> piList = new ArrayList<>();
			piList = iAchievementService.queryAchievementPicture(achievementId);
			mv.addObject("pictureList",piList);
			mv.addObject("Achievement", si);
			mv.setViewName("/jsp/AchievementJsp/detailAchievement");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}/**
	 * 跳转到大学生竞赛成果详情页
	 * @param request
	 * @return
	 */
	@RequestMapping(value="toDetailAOCSC")
	public ModelAndView toDetailAOCSC(HttpServletRequest request,@RequestParam(value="achievementId") String achievementId){
		ModelAndView mv = new ModelAndView();
		try {
			AOCSC ao = new AOCSC();
			ao = iAchievementService.queryAOCSCById(achievementId);
			List<AchievementPicture> piList = new ArrayList<>();
			piList = iAchievementService.queryAchievementPicture(achievementId);
			mv.addObject("pictureList",piList);
			mv.addObject("Achievement", ao);
			mv.setViewName("/jsp/AchievementJsp/detailAchievement");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	/******************************************详情页结束*********************************************************/
	/******************************************页面跳转的开始 iframe*********************************************************/
	/**
	 * 跳转到大学生竞赛成果
	 * @param request
	 * @return
	 */
	@RequestMapping(value="toAOCSCUpload")
	public ModelAndView toAOCSCUpload(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		try {
			mv.setViewName("/jsp/AchievementJsp/AOCSCUpload");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	/**
	 * 跳转到产学研成果
	 * @param request
	 * @return
	 */
	@RequestMapping(value="toIURPUpload")
	public ModelAndView toIURPUpload(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		try {
			mv.setViewName("/jsp/AchievementJsp/IURPUpload");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;}
	/**
	 * 跳转到产学研成果
	 * @param request
	 * @return
	 */
	@RequestMapping(value="toCourseExpandUpload")
	public ModelAndView toCourseExpandUpload(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		try {
			mv.setViewName("/jsp/AchievementJsp/CourseExpandUpload");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;}
	/**
	 * 跳转到大学生毕业设计
	 * @param request
	 * @return
	 */
	@RequestMapping(value="toGDFCSUpload")
	public ModelAndView toGDFCSUpload(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		try {
			mv.setViewName("/jsp/AchievementJsp/GDFCSUpload");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;}
	/**
	 * 大学生创新创业
	 * @param request
	 * @return
	 */
	@RequestMapping(value="toSIAEUpload")
	public ModelAndView toSIAEUpload(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		try {
			mv.setViewName("/jsp/AchievementJsp/SIAEUpload");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;}
	/******************************************页面跳转的结束 iframe*********************************************************/
}


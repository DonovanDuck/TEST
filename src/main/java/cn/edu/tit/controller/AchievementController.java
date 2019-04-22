package cn.edu.tit.controller;


import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.tit.bean.Achievement;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.IURP;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.common.Common;
import cn.edu.tit.iservice.IAchievementService;
import cn.edu.tit.iservice.ITeacherService;

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
		List<Achievement> achievementList =new ArrayList<>();
		List<IURP> iURPList =new ArrayList<>();
		try {
			achievementList = iAchievementService.queryAchievement();
			iURPList = iAchievementService.queryIURP();
			mv.addObject("achievementList",achievementList);
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
	 * 跳转到成果详情页
	 * @param request
	 * @return
	 */
	@RequestMapping(value="toDetailAchievement")
	public ModelAndView toDetailAchievement(HttpServletRequest request,@RequestParam(value="achievementId") String achievementId){
		ModelAndView mv = new ModelAndView();
		try {
			Achievement ac = new Achievement();
			ac = iAchievementService.queryAchievementById(achievementId);
			mv.addObject("achievement",ac);
			mv.setViewName("/jsp/AchievementJsp/detailAchievement");
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
	 */
	@RequestMapping(value="selectCategory")
	public ModelAndView selectCategory(HttpServletRequest request,@RequestParam(value="category") String category){
		ModelAndView mv = new ModelAndView();
		List<Achievement> achievementList =new ArrayList<>();
		switch (category) {
		case "1":category = "课程拓展";
		break;
		case "2":category = "大学生创新创业";
		break;
		case "3":category = "大学生竞赛";
		break;
		case "4":category = "毕设";
		break;
		case "5":category = "产学研";
		break;
		}
		List<IURP> iURPList =new ArrayList<>();
		try {
			if(category.equals("产学研"))
			{
				iURPList = iAchievementService.queryIURP();
				mv.addObject("iURPList",iURPList);
			}else {
				achievementList = iAchievementService.queryAchievementByCategory(category);
				mv.addObject("achievementList",achievementList);
			}		
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
		List<Achievement> achievementList =new ArrayList<>();
		List<Achievement> achievementListTeam =new ArrayList<>();
		List<IURP> iURPList =new ArrayList<>();
		List<IURP> iURPListAuthor =new ArrayList<>();
		try {
			achievementList = iAchievementService.queryAchievementByName(search);
			achievementListTeam = iAchievementService.queryAchievementByTeam(search);
			achievementList.removeAll(achievementListTeam);
			achievementList.addAll(achievementListTeam);
			mv.addObject("achievementList",achievementList);
			mv.setViewName("/jsp/AchievementJsp/achievementMain");

			iURPList = iAchievementService.queryIURPByName(search);
			iURPListAuthor = iAchievementService.queryIURPByAuthor(search);
			iURPList.removeAll(iURPListAuthor);
			iURPList.addAll(iURPListAuthor);
			mv.addObject("iURPList",iURPList);
			mv.setViewName("/jsp/AchievementJsp/achievementMain");
		} catch (Exception e) {
			e.printStackTrace();
			mv = toAchievementMainPage(request);
		}
		return mv;
	}

	/**
	 * 发布成果信息
	 * @return
	 */
	@RequestMapping(value="publishAchievement")
	@SuppressWarnings({ "unused", "unchecked" })
	public ModelAndView publishAchievement(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		try {
			String achievementId = Common.uuid();
			Object[] obj = Common.fileFactory(request,achievementId);
			List<File> files = (List<File>) obj[0];	// 获取课程图片
			Map<String, Object> formdata = (Map<String, Object>) obj[1]; // 获取课程内容
			Achievement ac = new Achievement();
			ac.setAchievementAccessory(null);//附件
			ac.setAchievementCategory((String)formdata.get("selectCategory"));//种类
			ac.setAchievementDetail((String)formdata.get("detail"));//详情
			ac.setAchievementId(achievementId);//ID
			ac.setAchievementName((String)formdata.get("name"));//成果名
			for(File f : files){ // 集合中只有一张图片,配置图片路径到数据库
				ac.setAchievementPhoto(Common.readProperties("path")+"/"+f.getName());
			}
			ac.setApprovalTime(null);//批准时间
			ac.setCompere(null);//这是什么属性，不知道
			ac.setFeature(null);//特点
			ac.setFinishTime(null);//完成时间
			ac.setFund(null);//资金，售价
			ac.setGuidanceTeacher(null);//指导教师
			ac.setIsShare(null);//是否分享
			ac.setSharedValue(null);//分享价值
			ac.setLevel(null);//等级：省级，校级，....
			String teamMemberOne = "";
			String teamMemberTwo = "";
			String teamMemberThree = "";
			String teamMemberFour = "";
			if((String)formdata.get("teamMemberOne")!=""||(String)formdata.get("teamMemberOne")!=null)
			{ teamMemberOne= (String)formdata.get("teamMemberOne");}
			if((String)formdata.get("teamMemberTwo")!=""||(String)formdata.get("teamMemberTwo")!=null)
			{ teamMemberTwo= (String)formdata.get("teamMemberTwo");}
			if((String)formdata.get("teamMemberThree")!=""||(String)formdata.get("teamMemberThree")!=null)
			{teamMemberThree = (String)formdata.get("teamMemberThree");}	
			if((String)formdata.get("teamMemberFour")!=""||(String)formdata.get("teamMemberFour")!=null)
			{teamMemberFour = (String)formdata.get("teamMemberFour");}
			String member = teamMemberOne+teamMemberTwo+teamMemberThree+teamMemberFour;
			ac.setMember(member);//团队成员
			ac.setTeamName((String)formdata.get("teamName"));//团队名
			ac.setTurnover(null);//成交量
			iAchievementService.publishAchievement(ac);
			return mv = toAchievementMainPage(request);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return mv = toUploadAchievement(request);
		}
	}

}

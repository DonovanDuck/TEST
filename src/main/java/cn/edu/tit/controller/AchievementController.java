package cn.edu.tit.controller;


import java.util.ArrayList;
import java.util.List;

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
		List<IURP> iURPList =new ArrayList<>();
		try {
			if(category.equals("5"))
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
}

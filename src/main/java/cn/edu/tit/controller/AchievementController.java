package cn.edu.tit.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

import cn.edu.tit.bean.AOCSC;
import cn.edu.tit.bean.Academic;
import cn.edu.tit.bean.AchievementAccessory;
import cn.edu.tit.bean.AchievementComment;
import cn.edu.tit.bean.AchievementPicture;
import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.CourseExpand;
import cn.edu.tit.bean.GDFCS;
import cn.edu.tit.bean.IURP;
import cn.edu.tit.bean.RealClass;
import cn.edu.tit.bean.SIAE;
import cn.edu.tit.bean.Student;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.common.Common;
import cn.edu.tit.iservice.IAchievementService;
import cn.edu.tit.iservice.ITeacherService;
import net.sf.json.JSONArray;

@RequestMapping("/achievement")
@Controller
public class AchievementController {
	@Autowired
	private IAchievementService iAchievementService;
	@Autowired
	private ITeacherService iTeacherService;


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
	/**************************************发布信息功能部分****************************************/
	/**
	 * 总体设计与数据描述
	 * 每个类别上传时均要上传人的ID,为此提供专门的方法 getSeesionUserId()
	 * 
	 * memberNumContent 内容描述,由一群字符串组成,每个字符串之间由","分开。第一个字符串为作品负责人的工（学）号，之后开始为成员学（工）号
	 * member 为成员信息，不包含 负责人信息
	 * 
	 * 文件：第一个文件为第一张图片，之后为剩下图片（除去最后一个文件）。最后一个为作品附件。
	 * */

	/**
	 * 发布产学研成果信息
	 * @return
	 */
	@RequestMapping(value="publishIURP")
	@SuppressWarnings({ "unused", "unchecked" })
	public String publishIURP(HttpServletRequest request){
		Student stu = (Student)request.getSession().getAttribute("student");
		try {
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
			i.setDeleteFlag(1);
			i.setUploadAuthorId(GetSessionUserId(request));
			i.setMemberNum((String)formdata.get("memberNumContent"));
			i.setProjectName((String)formdata.get("name"));
			i.setStartTime(ConverDate((String)formdata.get("startTime")));
			i.setStatus(null);
			i.setBrowseVolume(1);
			i.setFirstPicture(Common.readProperties("path")+"/"+projectId+"/"+stu.getStudentId()+"/"+files.get(0).getName());//获取图片的第一个图片
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
				pi.setAccessoryPath(Common.readProperties("path")+"/"+projectId+"/"+stu.getStudentId()+"/"+f.getName());
				pi.setAccessoryTime(new Timestamp(System.currentTimeMillis()));
				pi.setAchievementId(projectId);
				pi.setAuthorId(GetSessionUserId(request));
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
			aa.setAccessoryPath(Common.readProperties("path")+"/"+projectId+"/"+stu.getStudentId()+"/"+files.get(files.size()-1).getName());
			aa.setAccessoryTime(new Timestamp(System.currentTimeMillis()));
			aa.setAchievementId(projectId);
			aa.setAuthorId(GetSessionUserId(request));
			aa.setDeleteFlag(null);
			aaList.add(aa);
			iAchievementService.insertAchievementAccessory(aaList);
			/**文件处理结束***/
			return "redirect:/achievement/toAchievementMainPage"; 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "redirect:/achievement/toUploadAchievement"; 
		}
	}

	/**
	 * 发布课程拓展成果信息
	 * @return
	 */
	@RequestMapping(value="publishCourseExpand")
	@SuppressWarnings({ "unused", "unchecked" })
	public String publishCourseExpand(HttpServletRequest request){
		Student stu = (Student)request.getSession().getAttribute("student");
		try {
			String achievementId = Common.uuid();
			Object[] obj = Common.fileFactory(request,achievementId);
			List<File> files = (List<File>) obj[0];
			Map<String, Object> formdata = (Map<String, Object>) obj[1]; 
			CourseExpand ce = new CourseExpand();
			ce.setAchievementDetail((String)formdata.get("detail"));
			ce.setAchievementId(achievementId);
			ce.setAchievementName((String)formdata.get("name"));
			ce.setBrowseVolume(1);
			ce.setAchievementCategory("课程拓展");
			ce.setCompere((String)formdata.get("compere"));
			String courseName = null;
			ce.setCourseId((String)formdata.get("selectCourseName"));
			ce.setFinishTime(ConverDate((String)formdata.get("finishTime")));
			ce.setFirstPicture(Common.readProperties("path")+"/"+achievementId+"/"+stu.getStudentId()+"/"+files.get(0).getName());
			ce.setGuidanceTeacher((String)formdata.get("guidanceTeacher"));
			ce.setIntroduction((String)formdata.get("introduction"));
			ce.setMember((String)formdata.get("member"));
			ce.setDeleteFlag(1);
			ce.setTeamName((String)formdata.get("teamName"));
			ce.setUploadAuthorId(GetSessionUserId(request));
			ce.setMemberNum((String)formdata.get("memberNumContent"));
			ce.setUploadTime(new Timestamp(System.currentTimeMillis()));
			iAchievementService.insertCourseExpand(ce);
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
				pi.setAccessoryPath(Common.readProperties("path")+"/"+achievementId+"/"+stu.getStudentId()+"/"+f.getName());
				pi.setAccessoryTime(new Timestamp(System.currentTimeMillis()));
				pi.setAchievementId(achievementId);
				pi.setAuthorId(GetSessionUserId(request));
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
			aa.setAccessoryPath(Common.readProperties("path")+"/"+achievementId+"/"+stu.getStudentId()+"/"+files.get(files.size()-1).getName());
			aa.setAccessoryTime(new Timestamp(System.currentTimeMillis()));
			aa.setAchievementId(achievementId);
			aa.setAuthorId(GetSessionUserId(request));
			aa.setDeleteFlag(null);
			aaList.add(aa);
			iAchievementService.insertAchievementAccessory(aaList);
			/**文件处理结束***/
			return "redirect:/achievement/toAchievementMainPage"; 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "redirect:/achievement/toUploadAchievement"; 
		}
	}

	/**
	 * 发布大学生竞赛成果信息
	 * @return
	 */
	@RequestMapping(value="publishAOCSC")
	@SuppressWarnings({ "unused", "unchecked" })
	public String publishAOCSC(HttpServletRequest request){
		Student stu = (Student)request.getSession().getAttribute("student");
		try {
			String achievementId = Common.uuid();
			Object[] obj = Common.fileFactory(request,achievementId);
			List<File> files = (List<File>) obj[0];
			Map<String, Object> formdata = (Map<String, Object>) obj[1]; 
			AOCSC ao = new AOCSC();
			ao.setAchievementCategory("大学生竞赛");
			ao.setAchievementDetail((String)formdata.get("detail"));
			ao.setAchievementId(achievementId);
			ao.setAchievementName((String)formdata.get("name"));
			ao.setBrowseVolume(1);
			ao.setDeleteFlag(1);
			ao.setCompere((String)formdata.get("compere"));
			ao.setFeature((String)formdata.get("feature"));
			ao.setFinishTime(ConverDate((String)formdata.get("finishTime")));
			ao.setFirstPicture(Common.readProperties("path")+"/"+achievementId+"/"+stu.getStudentId()+"/"+files.get(0).getName());
			ao.setGuidanceTeacher((String)formdata.get("guidanceTeacher"));
			ao.setIntroduction((String)formdata.get("introduction"));
			ao.setLevel((String)formdata.get("levelContent"));
			ao.setMember((String)formdata.get("memberContent"));
			ao.setMemberNum((String)formdata.get("memberNumContent"));
			ao.setTeamName((String)formdata.get("teamName"));
			ao.setUploadAuthorId(GetSessionUserId(request));
			ao.setUploadTime(new Timestamp(System.currentTimeMillis()));
			iAchievementService.insertAOCSC(ao);
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
				pi.setAccessoryPath(Common.readProperties("path")+"/"+achievementId+"/"+stu.getStudentId()+"/"+f.getName());
				pi.setAccessoryTime(new Timestamp(System.currentTimeMillis()));
				pi.setAchievementId(achievementId);
				pi.setAuthorId(GetSessionUserId(request));
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
			aa.setAccessoryPath(Common.readProperties("path")+"/"+achievementId+"/"+stu.getStudentId()+"/"+files.get(files.size()-1).getName());
			aa.setAccessoryTime(new Timestamp(System.currentTimeMillis()));
			aa.setAchievementId(achievementId);
			aa.setAuthorId(GetSessionUserId(request));
			aa.setDeleteFlag(null);
			aaList.add(aa);
			iAchievementService.insertAchievementAccessory(aaList);
			/**文件处理结束***/
			return "redirect:/achievement/toAchievementMainPage"; 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "redirect:/achievement/toUploadAchievement"; 
		}
	}


	/**
	 * 发布大学生竞赛成果信息
	 * @return
	 */
	@RequestMapping(value="publishGDFCS")
	@SuppressWarnings({ "unused", "unchecked" })
	public String publishGDFCS(HttpServletRequest request){
		Student stu = (Student)request.getSession().getAttribute("student");
		try {
			String achievementId = Common.uuid();
			Object[] obj = Common.fileFactory(request,achievementId);
			List<File> files = (List<File>) obj[0];
			Map<String, Object> formdata = (Map<String, Object>) obj[1]; 			
			GDFCS gd = new GDFCS();
			gd.setAchievementCategory("毕业设计");
			gd.setAchievementId(achievementId);
			gd.setAchievementName((String)formdata.get("name"));
			gd.setBrowseVolume(1);
			gd.setDeleteFlag(1);
			gd.setAchievementDetail((String)formdata.get("detail"));
			gd.setCompere((String)formdata.get("compere"));
			gd.setFinishTime(ConverDate((String)formdata.get("finishTime")));
			gd.setFirstPicture(Common.readProperties("path")+"/"+achievementId+"/"+stu.getStudentId()+"/"+files.get(0).getName());
			gd.setGuidanceTeacher((String)formdata.get("guidanceTeacher"));
			gd.setIntroduction((String)formdata.get("introduction"));
			gd.setMemberNum((String)formdata.get("memberNum"));
			gd.setUploadAuthorId(GetSessionUserId(request));
			gd.setUploadTime(new Timestamp(System.currentTimeMillis()));
			iAchievementService.insertGDFCS(gd);
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
				pi.setAccessoryPath(Common.readProperties("path")+"/"+achievementId+"/"+stu.getStudentId()+"/"+f.getName());
				pi.setAccessoryTime(new Timestamp(System.currentTimeMillis()));
				pi.setAchievementId(achievementId);
				pi.setAuthorId(GetSessionUserId(request));
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
			aa.setAccessoryPath(Common.readProperties("path")+"/"+achievementId+"/"+stu.getStudentId()+"/"+files.get(files.size()-1).getName());
			aa.setAccessoryTime(new Timestamp(System.currentTimeMillis()));
			aa.setAchievementId(achievementId);
			aa.setAuthorId(GetSessionUserId(request));
			aa.setDeleteFlag(null);
			aaList.add(aa);
			iAchievementService.insertAchievementAccessory(aaList);
			/**文件处理结束***/
			return "redirect:/achievement/toAchievementMainPage"; 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "redirect:/achievement/toUploadAchievement"; 
		}
	}



	/**
	 * 发布大学生创新创业成果信息
	 * @return
	 */
	@RequestMapping(value="publishSIAE")
	@SuppressWarnings({ "unused", "unchecked" })
	public String publishSIAE(HttpServletRequest request){
		Student stu = (Student)request.getSession().getAttribute("student");
		try {
			String achievementId = Common.uuid();
			Object[] obj = Common.fileFactory(request,achievementId);
			List<File> files = (List<File>) obj[0];
			Map<String, Object> formdata = (Map<String, Object>) obj[1]; 
			SIAE si = new SIAE();
			si.setAchievementCategory("创新创业");
			si.setAchievementDetail((String)formdata.get("detail"));
			si.setAchievementId(achievementId);
			si.setAchievementName((String)formdata.get("name"));
			si.setBrowseVolume(1);
			si.setDeleteFlag(1);
			si.setCompere((String)formdata.get("compere"));
			si.setFeature((String)formdata.get("feature"));
			si.setFinishTime(ConverDate((String)formdata.get("finishTime")));
			si.setFirstPicture(Common.readProperties("path")+"/"+achievementId+"/"+stu.getStudentId()+"/"+files.get(0).getName());
			si.setGuidanceTeacher((String)formdata.get("guidanceTeacher"));
			si.setIntroduction((String)formdata.get("introduction"));
			si.setLevel((String)formdata.get("levelContent"));
			si.setMember((String)formdata.get("memberContent"));
			si.setMemberNum((String)formdata.get("memberNumContent"));
			si.setPlan((String)formdata.get("plan"));
			si.setStatus((String)formdata.get("status"));
			si.setTeamName((String)formdata.get("teamName"));
			si.setUploadAuthorId(GetSessionUserId(request));
			si.setUploadTime(new Timestamp(System.currentTimeMillis()));
			//si.setDeclaration(declaration);申报书的设置
			si.setDeclaration(Common.readProperties("path")+"/"+achievementId+"/"+stu.getStudentId()+"/"+files.get(files.size()-3).getName());
			//si.setMidreply(midreply);中期检查
			si.setMidreply(Common.readProperties("path")+"/"+achievementId+"/"+stu.getStudentId()+"/"+files.get(files.size()-2).getName());
			//si.setConcludingRreport(concludingRreport);结题报告
			si.setConcludingRreport(Common.readProperties("path")+"/"+achievementId+"/"+stu.getStudentId()+"/"+files.get(files.size()-1).getName());
			iAchievementService.insertSIAE(si);
			/**
			 * 文件的处理
			 * */
			List<AchievementPicture> pictureList = new ArrayList<>();
			AchievementPicture pi;
			for(int j = 0;j<files.size()-4;j++){
				File f = files.get(j);
				String accessoryId = Common.uuid();
				pi = new AchievementPicture();
				pi.setAccessoryId(accessoryId);
				pi.setAccessoryName(f.getName());
				pi.setAccessoryPath(Common.readProperties("path")+"/"+achievementId+"/"+stu.getStudentId()+"/"+f.getName());
				pi.setAccessoryTime(new Timestamp(System.currentTimeMillis()));
				pi.setAchievementId(achievementId);
				pi.setAuthorId(GetSessionUserId(request));
				pi.setDeleteFlag(null);
				pictureList.add(pi);
			}
			pictureList.remove(0);//第一张图片存至对象中，剩下图片放置入图片库
			iAchievementService.insertAchievementPicture(pictureList);
			AchievementAccessory aa = new AchievementAccessory();
			List<AchievementAccessory> aaList = new ArrayList<>();
			String accessoryId = Common.uuid();
			aa.setAccessoryId(accessoryId);
			aa.setAccessoryName(files.get(files.size()-4).getName());
			aa.setAccessoryPath(Common.readProperties("path")+"/"+achievementId+"/"+stu.getStudentId()+"/"+files.get(files.size()-4).getName());
			aa.setAccessoryTime(new Timestamp(System.currentTimeMillis()));
			aa.setAchievementId(achievementId);
			aa.setAuthorId(GetSessionUserId(request));
			aa.setDeleteFlag(null);
			aaList.add(aa);
			iAchievementService.insertAchievementAccessory(aaList);
			/**文件处理结束***/
			return "redirect:/achievement/toAchievementMainPage"; 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "redirect:/achievement/toUploadAchievement"; 
		}
	}
	/**************************************发布信息功能部分结束****************************************/
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
			List<AchievementComment> commentList = new ArrayList<>();
			iu = iAchievementService.queryIURPById(achievementId);
			List<AchievementPicture> piList = new ArrayList<>();
			List<IURP> listIURP = new ArrayList<>();
			listIURP = iAchievementService.queryIURP();
			mv.addObject("listIURP",listIURP);
			piList = iAchievementService.queryAchievementPicture(achievementId);
			iAchievementService.updateIURPBrowseVolume(iu.getProjectId());
			commentList = iAchievementService.queryComment(achievementId,"产学研");
			String member = iu.getMember();
			String[] me = member.split(",");
			List<String> memberList = new ArrayList<>();
			for (int i = 0; i < me.length; i++) {
				if(!me[i].equals(null)||!me[i].equals(""))
				{
					memberList.add(me[i]);
				}
			}
			mv.addObject("memberList",memberList);
			mv.addObject("comment",commentList);
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
			iAchievementService.updateCourseExpandBrowseVolume(ce.getAchievementId());
			List<AchievementComment> commentList = new ArrayList<>();
			String member = ce.getMember();
			String[] me = member.split(",");
			List<String> memberList = new ArrayList<>();
			for (int i = 0; i < me.length; i++) {
				if(!me[i].equals(null)||!me[i].equals(""))
				{
					memberList.add(me[i]);
				}
			}
			mv.addObject("memberList",memberList);
			commentList = iAchievementService.queryComment(achievementId,"课程拓展");
			List<CourseExpand> listCourseExpand = new ArrayList<>();
			listCourseExpand = iAchievementService.queryCourseExpand();
			mv.addObject("listAchievement",listCourseExpand);
			mv.addObject("comment",commentList);
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
			iAchievementService.updateGDFCSBrowseVolume(gd.getAchievementId());
			List<AchievementComment> commentList = new ArrayList<>();
			commentList = iAchievementService.queryComment(achievementId,"毕设");
			List<GDFCS> listGDFCS = new ArrayList<>();
			List<String> memberList = new ArrayList<>();
			memberList = null;
			mv.addObject("memberList",memberList);
			listGDFCS = iAchievementService.queryGDFCS();
			mv.addObject("listAchievement",listGDFCS);
			mv.addObject("comment",commentList);
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
			iAchievementService.updateSIAEBrowseVolume(si.getAchievementId());
			List<AchievementComment> commentList = new ArrayList<>();
			commentList = iAchievementService.queryComment(achievementId,"创新创业");
			List<SIAE> listSIAE = new ArrayList<>();
			String member = si.getMember();
			String[] me = member.split(",");
			List<String> memberList = new ArrayList<>();
			for (int i = 0; i < me.length; i++) {
				if(!me[i].equals(null)||!me[i].equals(""))
				{
					memberList.add(me[i]);
				}
			}
			String[] level = si.getLevel().split(",");
			List<String> levelList = new ArrayList<>();
			for (int i = 0; i < level.length; i++) {
				if(!level[i].equals(null)||!level[i].equals(""))
				{
					levelList.add(level[i]);
				}
			}
			mv.addObject("levelList",levelList);
			mv.addObject("memberList",memberList);
			listSIAE = iAchievementService.querySIAE();
			mv.addObject("listAchievement",listSIAE);
			mv.addObject("comment",commentList);
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
			iAchievementService.updateAOCSCBrowseVolume(ao.getAchievementId());
			List<AchievementComment> commentList = new ArrayList<>();
			commentList = iAchievementService.queryComment(achievementId,"竞赛");
			List<AOCSC> listAOCSC = new ArrayList<>();
			String member = ao.getMember();
			String[] me = member.split(",");
			List<String> memberList = new ArrayList<>();
			for (int i = 0; i < me.length; i++) {
				if(!me[i].equals(null)||!me[i].equals(""))
				{
					memberList.add(me[i]);
				}
			}
			String[] level = ao.getLevel().split(",");
			List<String> levelList = new ArrayList<>();
			for (int i = 0; i < level.length; i++) {
				if(!level[i].equals(null)||!level[i].equals(""))
				{
					levelList.add(level[i]);
				}
			}
			mv.addObject("memberList",memberList);
			mv.addObject("levelList",levelList);
			listAOCSC = iAchievementService.queryAOCSC();
			mv.addObject("listAchievement",listAOCSC);
			mv.addObject("comment",commentList);
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
		List<Course> listCourse = new ArrayList<>();
		try {
			listCourse = iTeacherService.getAllCourse();
			mv.addObject("courseList", listCourse);
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
	/******************************************评论操作部分开始*********************************************************/
	/**
	 * 大学生创新创业
	 * @param request
	 * @return
	 */
	@RequestMapping(value="insertAchievementComment")
	public void insertAchievementComment(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="addCommentContent") String commentContent,@RequestParam(value="category") String category,@RequestParam(value="achievementId") String achievementId){
		AchievementComment ac = new AchievementComment();
		Student stu = (Student) request.getSession().getAttribute("student");
		Teacher tea = (Teacher) request.getSession().getAttribute("teacher");
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String commentId = Common.uuid();
		try {
			ac.setAchievemendId(achievementId);
			if(stu!=null) {
				ac.setAuthorId(stu.getStudentId());
				ac.setAuthorName(stu.getStudentName());
				ac.setAuthorPicture(stu.getFaceImg());
			}
			if(tea!=null) {
				ac.setAuthorId(tea.getEmployeeNum());
				ac.setAuthorName(tea.getTeacherName());
				ac.setAuthorPicture(tea.getFaceImg());
			}
			ac.setCategory(category);
			ac.setCommentContent(commentContent);
			ac.setCommentId(commentId);
			ac.setUploadTime(new Timestamp(System.currentTimeMillis()));
			iAchievementService.insertAchievementComment(ac);
			List<AchievementComment> list = new ArrayList<AchievementComment>();
			list = iAchievementService.queryComment(achievementId, category);
			JSONArray json = new JSONArray();
			for (AchievementComment achievementComment : list) {
				JSONObject jo = new JSONObject();
				jo.put("commentId", achievementComment.getCommentId());
				jo.put("achievemendId",  achievementComment.getAchievemendId());
				jo.put("authorId",  achievementComment.getAuthorId());
				jo.put("category",  achievementComment.getCategory());
				jo.put("commentContent",  achievementComment.getCommentContent());
				jo.put("uploadTime",  achievementComment.getUploadTime().toString());
				jo.put("authorPicture",  achievementComment.getAuthorPicture());
				jo.put("authorName",  achievementComment.getAuthorName());
				json.put(jo);
			}
			try {
				response.getWriter().write(json.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



	/**
	 * 获取session中的用户信息ID
	 * */
	private String GetSessionUserId(HttpServletRequest request) {
		String userId = null;
		try {
			Student stu = null;
			stu = (Student) request.getSession().getAttribute("student");
			Teacher tea = null;
			tea = (Teacher) request.getSession().getAttribute("teacher");
			if(stu!=null)
			{
				userId = stu.getStudentId();
			}
			if(tea!=null)
			{
				userId = tea.getEmployeeNum();
			}
		} catch (Exception e) {
			userId = null;;
		}
		return userId;
	}

	/*是否有权限评论判断去**/
	@RequestMapping(value="verdictCommentForteacher/{id}",method= {RequestMethod.GET})
	public void verdictCommentForteacher(@PathVariable String id,HttpServletRequest request,HttpServletResponse response) throws Exception {			
		String userID = null;
		String result = null;
		userID = GetSessionUserId(request);
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		//先确定有没有权限
		if(userID != null) {
			//第一层判断，是否有权限去参与评论;若评论，返回值不为0
			int limit = iAchievementService.verifyLimitComment(userID,id);
			if(limit>=1)
			{//第二层判断，有权限参与评论后，有没有评论过
				int already = iAchievementService.verifyAlreadyComment(userID,id);
				if(already==0)
				{
					result = "您还未参与此成果评论";
				}
			}
			try {
				response.getWriter().print(result);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}}



	@RequestMapping(value="loginJudge",method= {RequestMethod.GET})
	public void loginJudge(HttpServletRequest request,HttpServletResponse response) throws Exception {			
		String result = null;
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		String userId = GetSessionUserId(request);
		if(userId==null)
		{
			result="您还未登录，不能发布评论";
		}
		try {
			response.getWriter().print(result);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}}
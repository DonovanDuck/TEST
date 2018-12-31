package cn.edu.tit.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.tit.iservice.IAdminService;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
		/**
		 * 添加管理员的方法  excel 相关的操作   能够将数据插入到数据库 
		 * */
		@Autowired
		private IAdminService adminService;
		
		//@ResponseBody
		@RequestMapping(value="DoExcel",method= {RequestMethod.POST})
		public ModelAndView DoExcel(@RequestParam(value="file_excel") MultipartFile file,HttpServletRequest request) {			
			ModelAndView mv = new ModelAndView();
			String readResult =null;
			try {
				readResult = adminService.addUserInfo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.addObject("readResult", readResult);
			mv.setViewName("/success");
	        return mv;
		}
}

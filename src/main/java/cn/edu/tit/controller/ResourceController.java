package cn.edu.tit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.tit.bean.Course;
import cn.edu.tit.bean.Task;
import cn.edu.tit.bean.Teacher;
import cn.edu.tit.iservice.IResourceService;
import cn.edu.tit.iservice.ITeacherService;

@RequestMapping("/resource")
@Controller
public class ResourceController {
	
	@Autowired
	private IResourceService resourceService;
	
	@Autowired
	private ITeacherService teacherService;

	/**
	 * 访问教师资源板块
	 * @param request
	 * @param courseId
	 * @return
	 */
	@RequestMapping(value="/toTeacherResource/{courseId}")
	public String toTeacherResource(HttpServletRequest request, @PathVariable String courseId){
		try {
			request.setAttribute("courseId", courseId);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "jsp/Teacher/teacher-resource";
	}
	
	/**
	 * 课程相关任务资源显示
	 * @return
	 */
	@RequestMapping(value="/toTaskResource/{courseId}/{taskType}")
	public String toTaskResource(HttpServletRequest request, @PathVariable String courseId, @PathVariable String taskType){
		try {
			//通过课程id查询对应类型资源
			Object[] obj = resourceService.showTaskByTypeAndCId(taskType, courseId);
			request.setAttribute("taskList", obj[0]);
			request.setAttribute("teacherNames", obj[1]);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsp/Teacher/teacher-resource-word";
	}
	@RequestMapping(value="toTeachResource/{courseId}")
	public String toTeachResource(HttpServletRequest request,  @PathVariable String courseId){
		//
		try {
			//通过课程id查询音频类型资源
			Object[] obj = resourceService.showResourceByTypeAndCId(2, courseId);
			request.setAttribute("audioresourceList", obj[0]);
			request.setAttribute("audioteacherNames", obj[1]);
			//通过课程id查询视频类型资源
			Object[] obj2 = resourceService.showResourceByTypeAndCId(3, courseId);
			request.setAttribute("videoresourceList", obj2[0]);
			request.setAttribute("videoteacherNames", obj2[1]);
			//通过课程id查询图片类型资源
			Object[] obj3 = resourceService.showResourceByTypeAndCId(4, courseId);
			request.setAttribute("imgresourceList", obj3[0]);
			request.setAttribute("imgteacherNames", obj3[1]);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
			return "jsp/Teacher/teacher-resource-media";
		
	}
	
	/**
	 * 下载文件
	 * 
	 * @param id
	 *            appid
	 * @param response
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "/download/{resourceId}")
	public void download(@PathVariable String resourceId, HttpServletResponse response, HttpServletRequest request)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		String filepath = "";
		filepath = resourceService.getResourcePathById(resourceId); // 获取资源路径

		File file = new File(filepath);
		InputStream inputStream = null;
		OutputStream outputStream = null;
		byte[] b = new byte[1024];        
		int len = 0;
		try {
			inputStream = new FileInputStream(file);
			outputStream = response.getOutputStream();  //创建文件输出流

			response.setContentType("application/force-download");
			String filename = file.getName();
			response.addHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(filename, "UTF-8")); //配置响应头
			response.setContentLength((int) file.length());

			while ((len = inputStream.read(b)) != -1) {
				outputStream.write(b, 0, len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (inputStream != null) {
				try {
					inputStream.close();
					inputStream = null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (outputStream != null) {
				try {
					outputStream.close();
					outputStream = null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}

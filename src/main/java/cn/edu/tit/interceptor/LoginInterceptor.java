package cn.edu.tit.interceptor;


import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.AbstractHandlerMethodMapping;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fasterxml.jackson.databind.cfg.HandlerInstantiator;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("teacherId"); // 当前teacherid
		// 判断点击的uri是否和登录页面有关，进行筛选
		String[] noFilters = new String[] { "login", "Login","main","Main" }; // url中如果有"login"和"handle"不拦截
		String uri = request.getRequestURI();
		boolean beFilter = true;
		if (uri.indexOf("spoc-mooc") != -1) {
			for (String s : noFilters) {
				if (uri.indexOf(s) != -1) {
					beFilter = false;
					break;
				}
			}
		}
		// 进行有野登录权限拦截
		if (beFilter) {
			if (null == obj) {
				// 未登录
				PrintWriter out = response.getWriter();
				StringBuilder builder = new StringBuilder();
				builder.append("<script type=\"text/javascript\" charset=\"UTF-8\">");
				builder.append("alert(\"页面过期，请重新登录\");");
				builder.append(
						"window.location.href=\"http://localhost:8080/spoc-mooc/jsp/Teacher/index.jsp\";</script>");
//               builder.append("spoc-mooc");  //这里是http://ip:port/项目名
//               builder.append("/jsp/Teacher/index.jsp\";</script>");  //这里是重新登录的页面url
				out.print(builder.toString());
				out.close();
				return false;
			}

		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		 
		
	}
	/**
	 * This implementation always returns {@code true}.
	 * @author wenli
	 * service之前执行
	 * 
	 */
	
	

}

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/classInfo.css"/>
		<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/js/iframeResizer.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	
		$(document).ready(function() {
			$(".rTitle ul li").click(function() {
			    $(this).siblings('li').removeClass("active");  
		        $(this).addClass("active"); 
			});
		});
	
		function reinitIframe(){
			var iframe = document.getElementById("lcontent");
					
					 try 
					{ 
					var bHeight = iframe.contentWindow.document.body.scrollHeight; 
					/* 
					var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
					var height = Math.max(bHeight, dHeight); 
					iframe.height = height; */ 
					iframe.height = bHeight; 
				//
					} 
					catch (ex) { } 
		}
		 
			function setIframeHeight() {
				var iframe = document.getElementById('lcontent');
				if (iframe) {
					var iframeWin = iframe.contentWindow
							|| iframe.contentDocument.parentWindow;
					if (iframeWin.document.body) {
						iframe.height = iframeWin.document.documentElement.scrollHeight
								|| iframeWin.document.body.scrollHeight;
					}
				}
			};
			window.onload = function() {
				//重复执行某个方法,动态刷新高度 
				var t1 = window.setInterval(setIframeHeight, 500);
				var t2 = window.setInterval("setIframeHeight()", 500);
				window.clearInterval(t1);
			};

		</script>

			
	
		

	</head>
	<body style="background-color:#F8F8F8; ">
		<jsp:include page="/jsp/top.jsp" flush="true"/>
		<div class="contentInfo" style="margin-top: 10px">
			<div class="rTitle" style="font-size: 18px;font-weight: bold;">
				<ul id="ls"  style="background-color: #fff;margin-right: 10px" class=" nav nav-pills  nav-stacked">
				  <li role="presentation" class="active" ><a id="als" target="lcontent"   href="${pageContext.request.contextPath}/teacher/toteacherTaskList?taskCategory=all">全部</a></li>
				  <li role="presentation" ><a target="lcontent" id="als"  href="${pageContext.request.contextPath}/teacher/toteacherTaskList">考勤</a></li>
				  <li role="presentation"><a  target="lcontent" id="als"  href="${pageContext.request.contextPath}/teacher/toteacherTaskList?taskCategory=work">作业</a></li>
				  <li role="presentation"><a  target="lcontent"  id="als" href="${pageContext.request.contextPath}/teacher/toteacherTaskList?taskCategory=course_design">课设</a></li>
				  <li role="presentation"><a  target="lcontent"  id="als" href="${pageContext.request.contextPath}/teacher/toteacherTaskList?taskCategory=trial">实验</a></li>
				<li role="presentation"><a  target="lcontent" id="als"  href="${pageContext.request.contextPath}/teacher/toteacherTaskList?taskCategory=trial">翻转</a></li>
				<li role="presentation"><a  target="lcontent"  id="als" href="${pageContext.request.contextPath}/teacher/toteacherTaskList?taskCategory=trial">挑战</a></li>
				<c:if test="${identify eq 'teacher' }">
				<li role="presentation"><a  target="lcontent" href="${pageContext.request.contextPath}/teacher/toAnalyseGrade">成绩分析</a></li>
					<li role="presentation"><a  target="lcontent" href="${pageContext.request.contextPath}/teacher/toPublishTask">发布作业</a></li>
				</c:if>
				<c:if test="${identify eq 'student' }">
				<li role="presentation"><a  target="_top" href="${pageContext.request.contextPath}/teacher/toPublishTask">个人成就</a></li>
				</c:if>
				
				</ul>
			</div>
			<div class="lContent">
				<iframe id="lcontent" name="lcontent" src="${pageContext.request.contextPath}/teacher/toteacherTaskList?taskCategory=all" width="900px" height="100%"  frameborder="no" border="0" scrolling="no" onload="setIframeHeight()">
				</iframe>
			</div>
		</div>
	</body>
</html>

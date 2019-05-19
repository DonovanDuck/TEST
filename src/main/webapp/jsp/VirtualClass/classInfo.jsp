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
		<script type="text/javascript">
			function reinitIframe() { 
				var iframe = document.getElementById("lcontent");
				 try 
				{ 
				var bHeight = iframe.contentWindow.document.body.scrollHeight; 
				/* 
				var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
				var height = Math.max(bHeight, dHeight); 
				iframe.height = height; */ 
				iframe.height = bHeight; 
				} 
				catch (ex) { } 
			};
			/* $("ul li").click(function() {
				   alert("sdfghj");
				     $(this).siblings('li').removeClass('active');  
			        $(this).addClass('active'); 
				}); */
		</script>

			 
	
		

	</head>
	<body style="background-color:#F8F8F8; ">
		<jsp:include page="/jsp/top.jsp" flush="true"/>
		<div class="contentInfo">
			<div class="rTitle">
				<ul id="ls"  style="background-color: #fff;margin-right: 10px" class=" nav nav-pills  nav-stacked">
				  <li role="presentation" class="active"  ><a id="als" target="lcontent"   href="${pageContext.request.contextPath}/teacher/toteacherTaskList">全部</a></li>
				  <li role="presentation" ><a target="lcontent" id="als"  href="${pageContext.request.contextPath}/teacher/toteacherTaskList">考勤</a></li>
				  <li role="presentation"><a  target="lcontent" id="als"  href="${pageContext.request.contextPath}/teacher/toteacherTaskListByTaskCategory?taskCategory=work">作业</a></li>
				  <li role="presentation"><a  target="lcontent"  id="als" href="${pageContext.request.contextPath}/teacher/toteacherTaskListByTaskCategory?taskCategory=course_design">课设</a></li>
				  <li role="presentation"><a  target="lcontent"  id="als" href="${pageContext.request.contextPath}/teacher/toteacherTaskListByTaskCategory?taskCategory=trial">实验</a></li>
				<li role="presentation"><a  target="lcontent" id="als"  href="${pageContext.request.contextPath}/teacher/toteacherTaskListByTaskCategory?taskCategory=trial">翻转</a></li>
				<li role="presentation"><a  target="lcontent"  id="als" href="${pageContext.request.contextPath}/jsp/challenge/content.jsp">挑战</a></li>
				<c:if test="${identify eq 'teacher' }">
				<li role="presentation"><a  target="_top" href="${pageContext.request.contextPath}/teacher/toPublishTask">成绩分析</a></li>
					<li role="presentation"><a  target="_top" href="${pageContext.request.contextPath}/teacher/toPublishTask">发布作业</a></li>
				</c:if>
				<c:if test="${identify eq 'student' }">
				<li role="presentation"><a  target="_top" href="${pageContext.request.contextPath}/teacher/toPublishTask">个人成就</a></li>
				</c:if>
				
				</ul>
			</div>
			<div class="lContent">
				<iframe id="lcontent" name="lcontent" src="" width="900px" height="100%"  frameborder="no" border="0" scrolling="no" onload="reinitIframe()">
					
				</iframe>
			</div>
		</div>
	</body>
</html>

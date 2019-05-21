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
				var iframe = document.getElementById("stateContent");
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
			}
		</script>
	</head>
	<body style="background-color: #D3D3D3;">
		<div class="fragtitle">
			<c:if test="${taskCategory  eq 'work'}">
		作业
		</c:if>
		<c:if test="${taskCategory  eq 'course_design'}">
		课设
		</c:if>
		<c:if test="${taskCategory  eq 'trial'}">
		实验
		</c:if>
		<c:if test="${taskCategory  eq 'all'}">
		全部
		</c:if>
		</div>
		<div class="state" >
			<ul class="nav nav-tabs">
			  <li role="presentation" class="active"><a target="stateContent" href="${pageContext.request.contextPath}/teacher/toteacherTaskListContent/${taskCategory }/every">全部</a></li>
			  <li role="presentation"><a target="stateContent"  href="${pageContext.request.contextPath}/teacher/toteacherTaskListContent/${taskCategory }/ing">正在进行</a></li>
			  <li role="presentation"><a  target="stateContent" href="${pageContext.request.contextPath}/teacher/toteacherTaskListContent/${taskCategory }/ed">已结束</a></li>
			</ul>
		</div>
		<div class="statefiframe" >
			<iframe onload="reinitIframe()" id="stateContent" name="stateContent" src="${pageContext.request.contextPath}/teacher/toteacherTaskListContent/${taskCategory }/every" width="900px" height="100%"  frameborder="no" border="0" scrolling="no"  >
				
			</iframe>
		</div>
	</body>
</html>

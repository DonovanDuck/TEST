<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>班级详情页-实验</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/course/teacher-experiment.css" />
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/course/teacher-task.css" />
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
</head>
<script type="text/javascript">
	$(function(){
		windows.parent.load();
	})
	</script>
<body>
	
		<div class="main_b_r">
			<div class="word">
				<c:forEach items="${taskList }" var="task">
					<div class="word1">
						<div class="images">
							<img src="${pageContext.request.contextPath}/images/word1.png"
								alt="" style="width: 80px; height: 80px;" />
						</div>
						<div class="word2">
							<p>
								实验名称：${task.taskTitle } <br>上传时间：${task.publishTime }
							</p>
							<p >&nbsp;&nbsp;&nbsp;被下载${task.watchNum }</p>
							<p >&nbsp;&nbsp;&nbsp;查看详情</p>
						</div>
					</div>
				</c:forEach>

			</div>
			<a
				href="${pageContext.request.contextPath}/teacher/toPublishTask"
				target="iframeContent"><div class="button">
					<p>发布实验</p>
				</div> </a>
		</div>
	
</body>
</html>
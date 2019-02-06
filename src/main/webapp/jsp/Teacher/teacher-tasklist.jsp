<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/course/teacher-task.css" />
	<script src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
	<script type="text/javascript">
	$(function(){
		windows.parent.load();
	})
	</script>
</head>
<body>

		<div class="main_b_r">
			<div class="task">
				<c:forEach items="${taskList }" var="task">
					<div class="task1">
						<h3>作业详情:</h3>
						<br>
						<h4>作业1：${task.taskTitle }</h4>
						<p class="text">${task.taskDetail }</p>
						<a target="iframeContent" href="${pageContext.request.contextPath}/teacher/toTaskDetail/${task.taskId }">
							<button class="search" value=""
								style="line-height: 20px; margin-top: 1%; font-size: 16px; float: left; margin-left: 1%; padding-left: 1%; padding-right: 1%;"
								type="button">查看全部</button>
						</a>
						<br> <br> <span class="span1">发布时间:${task.publishTime }
							9:00</span> <span class="span2">截至时间：${task.taskEndTime }</span><br> <br>
						<c:forEach items="${task.accessoryList }" var="accessory"  varStatus="status">
							<div
								style="padding-left: 1%; float: left; margin-left: 1%; padding-right: 1%; font-size: 16px;">
								
								<a href="${pageContext.request.contextPath}/teacher/resourceDownload?fileName=${accessory.accessoryName }&id=${task.taskId }">${accessory.accessoryName }</a>
								
							</div>
						</c:forEach>
						<button
							style="padding-left: 1%; float: right; margin-right: 1%; padding-right: 1%; font-size: 16px;">删除</button>
					</div>
				</c:forEach>
				
			</div>
			<c:if test="${teacher != null }">
			<a
				href="${pageContext.request.contextPath}/teacher/toPublishTask"
				target="iframeContent">
				<div class="button">
					<p>发布作业</p>
				</div>
			</a>
			</c:if>
		</div>
</body>
</html>
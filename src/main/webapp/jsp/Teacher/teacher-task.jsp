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
<title>班级详情页-作业</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/course/teacher-task.css" />
	<script src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
	<script type="text/javascript">
	function download(element) {
		
		 var params = {};//定义一个数组
		 var fileName = element.id;
		 alert(fileName);
		  params["fileName"] = fileName ;//把这些变量都存在这个数组里

		$.ajax({
			async:false,
			cache:false,
			url:"${pageContext.request.contextPath}/teacher/resourceDownload",
			type:"POST",
			data:params,
			dataType:"text",
			success:function(result) {
				
			}
		});
		
	}
	
</script>
</head>
<body>
	<header></header>
	<main>
	<div class="main_t">
		<div class="class">
			<p>
				<span>1720561班</span>&nbsp;&nbsp;<a href="#">编辑班级信息</a>
			</p>
		</div>
	</div>
	<div class="main_m">
		<nav>
		<ul>
			<li><a
				href="${pageContext.request.contextPath}/jsp/Teacher/teacher-task.jsp">作业</a></li>
			<li><a
				href="${pageContext.request.contextPath}/jsp/Teacher/teacher-experiment.jsp">实验</a></li>
			<li><a href="#">课设</a></li>
			<li><a href="#">翻转</a></li>
			<li><a href="#">授课计划</a></li>
			<li><a href="#">论坛</a></li>
			<li><a href="#">开放</a></li>
		</ul>
		</nav>
	</div>
	<div class="main_b">

		<div class="main_b_r">
			<div class="task">
				<c:forEach items="${taskList }" var="task">
					<div class="task1">
						<h3>作业详情:</h3>
						<br>
						<h4>作业1：${task.taskTitle }</h4>
						<p class="text">${task.taskDetail }</p>
						<button class="search" value=""
							style="line-height: 20px; margin-top: 1%; font-size: 16px; float: left; margin-left: 1%; padding-left: 1%; padding-right: 1%;"
							type="button">查看全部</button>
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
			<a
				href="${pageContext.request.contextPath}/teacher/toPublishTask"
				target="_parent">
				<div class="button">
					<p>发布作业</p>
				</div>
			</a>
		</div>
	</div>
	</main>
	<footer></footer>
</body>
</html>
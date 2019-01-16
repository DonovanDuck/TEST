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
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
<script type="text/javascript">
	function download(element) {

		var params = {};//定义一个数组
		var fileName = element.id;
		alert(fileName);
		params["fileName"] = fileName;//把这些变量都存在这个数组里

		$
				.ajax({
					async : false,
					cache : false,
					url : "${pageContext.request.contextPath}/teacher/resourceDownload",
					type : "POST",
					data : params,
					dataType : "text",
					success : function(result) {

					}
				});

	}
</script>
<script language="javascript">
	var timeIframe;
	window.onload = function() {
		timeIframe = setTimeout(GetIframeStatus, 10);
	}
	function GetIframeStatus() {
		var iframe = document.getElementById("iframeContent");
		var iframeWindow = iframe.contentWindow;
		//内容是否加载完
		if (iframeWindow.document.readyState == "complete") {
			var iframeWidth, iframeHeight;
			//获取Iframe的内容实际宽度
			iframeWidth = iframeWindow.document.documentElement.scrollWidth;
			//获取Iframe的内容实际高度
			iframeHeight = iframeWindow.document.documentElement.scrollHeight;
			//设置Iframe的宽度
			iframe.width = iframeWidth;
			//设置Iframe的高度
			iframe.height = iframeHeight;
		} else {
			timeIframe = setTimeout(GetIframeStatus, 10);
		}
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
			<li><a	target="iframeContent"
				href="${pageContext.request.contextPath}/teacher/teacherTaskList">全部</a></li>
			<li><a target="iframeContent"
				href="${pageContext.request.contextPath}/teacher/teacherTaskListByTaskCategory?taskCategory=trial">实验</a></li>
			<li><a href="#">课设</a></li>
			<li><a href="#">翻转</a></li>
			<li><a href="#">授课计划</a></li>
			<li><a href="#">论坛</a></li>
			<li><a href="#">开放</a></li>
		</ul>
		</nav>
	</div>
	<div class="main_b">
		<iframe id="iframeContent" name="iframeContent" style="width: 100%;"
			frameborder="no" border="0" scrolling="no" src="${pageContext.request.contextPath}/teacher/teacherTaskList"></iframe>
	</div>
	</main>
	<footer></footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>资源管理</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/managerResourceList.css"
	type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script language="javascript">
	var timeIframe;
	window.onload = function() {
		timeIframe = setTimeout(GetIframeStatus, 10);
	}
	function GetIframeStatus() {
		var iframe = document.getElementById("mainIframe");
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
<body class="body">
	<div class="header">
		<div class="logo-box">
			<img src="${pageContext.request.contextPath}/images/head.png"
				border="0">
			<button
				style="width: 7%; height: 5%; position: absolute; right: 4%; top: 2%;">
				<h4>个人信息</h4>
			</button>
		</div>
	</div>
	<div class="main">
		<div class="main-top">
			<div class="btn-group" role="group" aria-label="...">
				<c:forEach items="${resourceCategories }" var="resourceCategory">
					<a
						href="${pageContext.request.contextPath}/teacher/toResource/${resourceCategory.resourceTypeId }"
						target="mainIframe">
						<button type="button" class="btn btn-default">${resourceCategory.resourceType }</button>
					</a>
				</c:forEach>
			</div>
		</div>
		<div class="content">
			<iframe id="mainIframe" name="mainIframe"
				style="width: 100%;margin-top: 1%" frameborder="no"
				border="0" scrolling="no"
				src="${pageContext.request.contextPath}/teacher/toResource/${resourceCategories[0].resourceTypeId }"></iframe>
		</div>
	</div>
	<div class="footer">
		<div class="logo-box">
			<img src="${pageContext.request.contextPath}/images/bottom.png"
				width="100%" height="100%" border="0">
		</div>
	</div>
</body>
</html>
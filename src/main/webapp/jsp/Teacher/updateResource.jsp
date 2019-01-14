<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>资源管理</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/updateResource.css"
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
	<div class="banner">
		<div class="banner_t">
			<ul>
				<c:forEach items="${categories }" var="category" varStatus="status">
					<li><a
						href="${pageContext.request.contextPath}/teacher/readCourseInfoByCategory/${category.categoryId }"
						class="div1" style="font-size: 20px" target="course">${category.categoryName }</a>
					</li>
				</c:forEach>
				<div style="clear: both"></div>
			</ul>
		</div>
	</div>
	<div class="main">
		<div class="main-top">
			<div class="btn-group" role="group" aria-label="...">
				<c:forEach items="${resourceCategories }" var="resourceCategory">
					<a href="${pageContext.request.contextPath}/teacher/toResource/${map.key }"
						target="course"><button type="button" class="btn btn-default">${map.value }</button></a>
				</c:forEach>
			</div>
		</div>
		<div class="content">
			<iframe id="mainIframe" name="mainIframe"
				src="${pageContext.request.contextPath}/teacher/toWorkResource"></iframe>
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
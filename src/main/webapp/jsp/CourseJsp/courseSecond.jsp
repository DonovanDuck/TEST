<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>课程二级页面</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Course/courseSecondJsp.css"
	type="text/css">
</head>
<body class="body">
	<div class="header"></div>
	<div class="searchAndButton">
		<input class="search" type="search" placeholder="请输入关键词">
		<button class="search-button">搜索</button>
	</div>
	<div class="banner">
		<div class="banner_t">
			<ul>
				<c:forEach items="${categories }" var="category" varStatus="status">
					<li>
						<div class="div1">${category.categoryName }</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="main">
		<div class="courses">
			<c:forEach items="${courseListforMe }" var="courseListforMeItems" varStatus="status">
				<div class="course">
					<img src="${pageContext.request.contextPath}/img/Course/tu10.jpg"alt="" />
					<small>${courseListforMeItems.courseName }</small>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="footer"></div>
</body>
</html>
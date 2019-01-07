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
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Course/courseSecondJsp.css"
	type="text/css">

<script
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#searchButton").click(function() {
		var content = $("#search").val();
		$.ajax({
			type : "POST", //请求方式
			url : "", //请求路径：页面/方法名字
			data : content, //参数
			dataType : "text",
			contentType : "application/json; charset=utf-8",
			success : function(msg) { //成功
			},
			error : function(obj, msg, e) { //异常
				
			}
		});
	});
});
</script>
</head>
<body class="body">
	<div class="header"></div>
	<div class="searchAndButton">
		<input class="search" id="search" type="search" placeholder="请输入关键词">
		<button class="search-button" id="searchButton">搜索</button>
	</div>
	<div class="banner">
		<div class="banner_t">
			<ul>
				<c:forEach items="${categories }" var="category" varStatus="status">
					<li>
						<div class="div1">
							<a
								href="${pageContext.request.contextPath}/admin/resetStudentPassword/${category.categoryId }"
								class="" style="font-size: 20px">${category.categoryName }</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="main">
		<div class="main-top">
			<button>
				<a href="">我创建的课程</a>
			</button>
			<button>
				<a href="">我加入的课程</a>
			</button>
		</div>
		<div class="courses">
			<c:forEach items="${courseListforMe }" var="courseListforMeItems"
				varStatus="status">
				<div class="course">
					<img src="${pageContext.request.contextPath}/img/Course/tu10.jpg"
						alt="" style="margin-left: 7%;"/> 
						<div class= "courseName" style="text-align:center;">
							<small>${courseListforMeItems.courseName }</small>
						</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="footer"></div>
</body>
</html>
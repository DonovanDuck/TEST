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
<link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#searchButton").click(function() {
			var content = $("#search").val();
			$.ajax({
				type : "/teacher/", //请求方式
				url : "http", //请求路径：页面/方法名字
				data : {"content":content}, //参数
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function(msg) { //成功
				},
				error : function(obj, msg, e) { 
					alert("查找数据失败");
				}
			});
		});
	});

</script>
</head>
<body class="body">
	<jsp:include page="/jsp/top.jsp" flush="true"/>
	<div class="searchAndButton">
		<input class="search" id="search" type="search" placeholder="请输入关键词">
		<button class="search-button" id="searchButton">搜索</button>
	</div>
	<%-- <a href="${pageContext.request.contextPath}/teacher/toCreateCourse" style="position: relative;top: -26px;left:269px"><button class="btn btn-default" >创建课程</button></a> --%>
	<div class="banner">
		<div class="banner_t">
			<ul>
				<c:forEach items="${categories }" var="category" varStatus="status">
					<li>
						<div class="div1">
							<a
								href="${pageContext.request.contextPath}/teacher/readCourseInfoByCategory/${category.categoryId }"
								class="div1" style="font-size: 20px" target="course">${category.categoryName }</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="courses" style=" margin-left: 10%">
		<c:forEach items="${courseList }" var="courseListItems"
			varStatus="status">
			<a href="${pageContext.request.contextPath}/teacher/toCourseDetail/${courseListItems.courseId }">
				<div class="course" >
				<div style="width: 228px;height: 165px;">
					<img alt="" style="width: 100%;height: 100%" src = "${pageContext.request.contextPath}/jsp/showImg.jsp?path=${courseListItems.faceImg }" />
				</div>
				  
					<ul class="courseInfo">
						<li><small>课程名：${courseListItems.courseName }</small></li>
						<li><small>创建教师：${teacherNames[status.index]}</small></li>
						<li><small>创建时间：${courseListItems.publishTime }</small></li>
						<li><small>课程人数:${courseListItems.courseStudentNum }</small></li>
					</ul>
				</div>
			</a>
		</c:forEach>
	</div>
	<div class="footer">
	
	</div>
</body>
</html>
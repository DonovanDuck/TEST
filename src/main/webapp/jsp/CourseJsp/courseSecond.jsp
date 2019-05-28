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

<style>
	small{
		color: #000;
	}
</style>
</head>
<body class="body">
	<jsp:include page="/jsp/top.jsp" flush="true" />
	<%-- <div style="height: 96px;width: 350px;float: left;padding: 11px;background: #f3f3f3;border-radius: 6px;">
						<img style="height: 74px; width: 74px;margin-right: 10px;border-radius: 6px;float: left;" src="${pageContext.request.contextPath}/images/tu9.jpg">
						<label class="re_name" style="    position: relative;
    top: -2px;">c++基础知识应用</label>
     <div><span>c++基础知识应用,利用c++基础语法知识与算法原理完成关卡中所给题目。</span></div>
     <div>15题</div><div>2010.1.1</div>
					</div> --%>
					
	<form action="${pageContext.request.contextPath}/teacher/toCourseSecondSearch">
		<div class="form-group">
    <input style="width: 23%;float: left;margin-right: 13px;margin-left: 61%;"  
    class="form-control"  name="search" placeholder="请输入关键词">
  </div>
  <button type="submit" class="btn btn-default" >搜索</button>
		<!-- <div class="searchAndButton" style="margin-right: 4%">
			<input class="search" id="search" name="search" placeholder="请输入关键词">
			<button class="search-button" id="searchButton" type="submit">搜索</button>
		</div> -->
	</form>
	<%-- <a href="${pageContext.request.contextPath}/teacher/toCreateCourse" style="position: relative;top: -26px;left:269px"><button class="btn btn-default" >创建课程</button></a> --%>

	<div class="banner">
		<div class="banner_t">
			<ul>
				<c:forEach items="${categories }" var="category" varStatus="status">
					<li>
						<div class="div1">
							<a href="${pageContext.request.contextPath}/teacher/readCourseInfoByCategory/${category.categoryId }"
								class="div1" style="font-size: 20px" target="">
								<button style="width: 136px;" type="button" class="btn btn-default">${category.categoryName }</button>
								</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="courses" style="margin-left: 13%">
		<c:forEach items="${courseList }" var="courseListItems"
			varStatus="status">
			<a
				href="${pageContext.request.contextPath}/teacher/toCourseDetail/${courseListItems.courseId }">
				<div class="course">
					<div style="width: 228px; height: 165px;">
						<img alt="" style="width: 100%; height: 100%"
							src="${courseListItems.faceImg }" />
					</div>

					<ul class="courseInfo">
						<li><small>${courseListItems.courseName }</small></li>
						<li><small>
							教师团队：
                                      	<c:forEach items="${courseListItems.teacherList }" var="teacher">
                							${teacher.teacherName }
                						</c:forEach>
                              
						</small></li>
						<li><small>创建时间：${publishTime[status.index]  }</small></li>
						<li><small>课程人数:${courseListItems.courseStudentNum }</small></li>
					</ul>
				</div>
			</a>
		</c:forEach>
	</div>
	<div class="footer"></div>
</body>
</html>
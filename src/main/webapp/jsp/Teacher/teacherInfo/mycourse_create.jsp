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
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/own.css" />
<style type="text/css">
.main_b_r_b a:link {
	color: black;
}

.main_b_r_b a:visited {
	color: black;
}

.main_b_r_b a:hover {
	color: black;
}

.main_b_r_b a:active {
	color: black;
}
</style>
<script type="text/javascript"> 

</script> 
</head>
<body style="height: 100%;overflow: hidden;" onload="autoHeight();">
	<div style="height: 1px;"> 
	</div> 
	<div class="main_b_r_b" id="k1" style="padding-bottom: 10px;">
		<c:forEach items="${courseList }" var="course">
			<a
				href="${pageContext.request.contextPath}/teacher/toCourseDetail/${course.courseId }"
				target="_top">
				<div class="lesson">
					<div class="lesson_l">
						<c:if test="${empty course.faceImg }">
								<img
									src="${pageContext.request.contextPath}/img/workType/classDefault.jpg"
									alt="" style="width: 100%; height: 100%;" />
							</c:if>
						<c:if test="${not empty course.faceImg }">
							<img
								src="${course.faceImg }"
								alt="" style="width: 100%; height: 90%;" />
						</c:if>
					</div>
					<div class="lesson_r">
						<h3 style="margin: 0px">${course.courseName }</h3>
						<p style="margin-bottom: 1%">课程概述：${course.courseDetail }</p>
						<p style="margin-bottom: 1%">
							教师团队：
							<c:forEach items="${course.teacherList }" var="teacher">
                ${teacher.teacherName }
                </c:forEach>
						</p>
						<p style="margin-bottom: 1%">创课时间：${course.publishTime }</p>
					</div>
				</div>
			</a>
		</c:forEach>
	</div>
</body>
</html>
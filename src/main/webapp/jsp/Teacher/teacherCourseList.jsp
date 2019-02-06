<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    
</head>
<body>
<p> ${teacher.teacherName }</p>
<p>${readResult }</p>

<p>我的课程</p>
    <c:forEach items="${courseListforMe }" var="course">
    <a href="${pageContext.request.contextPath}/teacher/teacherClassList/${course.courseId}">
    <div style="width: 300px;height: 200px;float: left" id="${course.courseId }" name="${course.courseId }" >
		<tr >
			<td>${course.courseId }</td>
			<td>${course.courseName }</td>
			<td>${course.courseDetail }</td>
			<td>${course.courseCategory }</td>
			<td>${course.publisherId }</td>
		</tr>
	</div>
	</a>
	</c:forEach>
	
<p>我加入的</p>
<c:forEach items="${courseListByOthers }" var="course">
<a  href="${pageContext.request.contextPath}/teacher/teacherClassList">
    <div  style="width: 300px;height: 200px;float: left" id="${course.courseId }" name="${course.courseId }" >
		<tr >
			<td>${course.courseId }</td>
			<td>${course.courseName }</td>
			<td>${course.courseDetail }</td>
			<td>${course.courseCategory }</td>
			<td>${course.publisherId }</td>
		</tr>
		</div>
		</a>
	</c:forEach>

    


</body>
</html>
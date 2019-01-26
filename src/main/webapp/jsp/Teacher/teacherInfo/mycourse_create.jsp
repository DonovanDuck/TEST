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
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/teacher/own.css"/>
</head>
<body>
<div class="main_b_r_b" id="k1">
<c:forEach items="${courseList }" var="course">
    <a href="${pageContext.request.contextPath}/teacher/toCourseDetail/${course.courseId }" target="_top">
        <div class="lesson">
            <div class="lesson_l">
                <img src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${course.faceImg }" alt="" style="width: 100%;height: 100%"/>
            </div>
            <div class="lesson_r">
                <h3>${course.courseName }</h3>
                <p>课程概述：${course.courseDetail }</p>
                <p>教师团队：<c:forEach items="${course.teacherList }" var="teacher">
                ${teacher.teacherName }
                </c:forEach> </p>
                <p>创课时间：${course.publishTime }</p>
            </div>
        </div>
    </a>
    </c:forEach>
    
</div>

</body>
</html>
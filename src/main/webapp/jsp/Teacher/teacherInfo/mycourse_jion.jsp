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
<div  id="k2">
<<<<<<< HEAD
<c:forEach items="${courseList }" var="course" varStatus="status">
=======
<c:forEach items="${courseList }" var="course">
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
    <a href="${pageContext.request.contextPath}/teacher/toCourseDetail/${course.courseId }" target="_top">
        <div class="lesson">
            <div class="lesson_l">
                <img src="../images/tu6.jpg" style="width: 100%;" alt=""/>
            </div>
            <div class="lesson_r">
                <h3>${course.courseName }</h3>
                <p>课程概述：${course.courseDetail }</p>
                <p>教师团队：<c:forEach items="${course.teacherList }" var="teacher">
                ${teacher.teacherName }
                </c:forEach> </p>
<<<<<<< HEAD
                <p>创课时间：${publishTime[status.index]  }</p>
=======
                <p>创课时间：${course.publishTime }</p>
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
            </div>
        </div>
    </a>
    </c:forEach>
</div>
</body>
</html>
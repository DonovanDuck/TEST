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
</html>
<body>
<div  id="r1">
<div class="main_b_r_t">
    <div class="word1"  id="w1">
        <p><a target="mycourse" href="${pageContext.request.contextPath}/teacher/toMyCreateCourse" id="p1">我创建的课程</a></p>
    </div>
    <div class="word2"  id="w2">
        <p><a target="mycourse" href="${pageContext.request.contextPath}/teacher/toMyJoinCourse" id="p2">我加入的课程</a></p>
    </div>
    <div class="word2" id="w3">
        <p><a target="mycourse" href="../html/mycourse_interest.html" id="p3">我关注的课程</a></p>
    </div>
    <div class="word2" id="w3">
        <p><a target="_blank" href="${pageContext.request.contextPath}/teacher/toCreateCourse" >创建课程</a></p>
    </div>
</div>
<div class="hr"></div>
    <div class="main_b_r_b">
        <iframe  id="mycourse" name="mycourse"
                 style="width: 100%;height: 100%"
                 frameborder="no" border="0" 
                 src="${pageContext.request.contextPath}/teacher/toMyCreateCourse"></iframe>
    </div>



</div>
</body>
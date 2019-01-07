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
    <form action="${pageContext.request.contextPath}/teacher/teacherLogin" method="get" >
        <input id="teacherId" name="teacherId">
        <input id="teacherPassword" name ="teacherPassword">
       ${pageContext.request.contextPath}/teacher/teacherLogin
        <input type="submit" value="登录">
    </form>
</body>
</html>
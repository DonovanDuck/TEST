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
<body style="margin-left:-13%">
<div id="t6">
                <p>工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：${teacher.employeeNum }</p>
                <p>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：${teacher.teacherName }</p>
                <p>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：${teacher.teacherNickName }</p>
                <p>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：${teacher.teacherGender }</p>
                <p>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：${teacher.professionalTitles }</p>
                <p>出生日期：<input type="date" placeholder=""/></p>
                <p>政治面貌：</p>
                <p>研究方向：</p>
                <p>发表论文：</p>
                <p>教学改革：</p>
                <p>联系方式：</p>
                <div class="bj" onclick="g()">编辑</div>
            </div>

</body>
</html>
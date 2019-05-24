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
  <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/teacher/own.css"/>

    
</head>
<body style="margin-left:-21%">
<div id="r5">
<div class="main_b_r_t">
		<div class="main_b_r_t">
			<div class="word1" id="w1">
				<p>
					<a target="myinfo"
						href="${pageContext.request.contextPath}/teacher/toMyInfoBase"
						id="p1">基本信息</a>
				</p>
			</div>
			<div class="word2" id="w2">
				<p>
					<a target="myinfo"
						href="${pageContext.request.contextPath}/teacher/toMyInfoAll"
						id="p2">详细信息</a>
				</p>
			</div>
			<div class="word3" id="w3">
				<p>
					<a target="myinfo"
						href="${pageContext.request.contextPath}/teacher/toMyInfoFruit"
						id="p3">个人成果</a>
				</p>
			</div>
		</div>
		<div class="hr"></div>
		<div class="main_b_r_b">
			<iframe id="myinfo" name="myinfo"
				style="width: 100%; height: 100%" frameborder="no" border="0"
				src="${pageContext.request.contextPath}/teacher/toMyInfoBase"></iframe>
		</div>
</div>
</body>
</html>
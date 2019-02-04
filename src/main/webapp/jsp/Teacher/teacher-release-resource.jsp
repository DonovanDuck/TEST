<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>资源发布页面</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/teacher-release-task.css"
	type="text/css">
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
</head>
<body>
	<jsp:include page="/jsp/top.jsp" flush="true" />
	<div class="main_b">
		<div class="text">
			<form
				action="${pageContext.request.contextPath}/teacher/publishResource"
				enctype="multipart/form-data" method="post">
				<span><strong>名&nbsp;&nbsp;&nbsp;&nbsp;称：</strong></span> <input
					type="text" name="resourceName" placeholder="请输入名称："
					style="width: 60%; height: 30px; float: left;"> <br> <br>
				<span><strong>资源详情：</strong></span> <input name="resourceDetail"
					type="text" placeholder="请输入资源详情："
					style="width: 80%; height: 210px; float: left;">
				<div class="button">
					<b>附件:</b> <input name="file" type="file" multiple="multiple" />
					<button
						style="padding-left: 1%; padding-right: 1%; font-size: 16px; float: right; margin-right: 20%;">上传并发布</button>
				</div>
			</form>
		</div>
	</div>
	<div>
		<img alt="" src="${pageContext.request.contextPath}/images/bottom.png"
			style="width: 100%;">
	</div>
</body>
</html>
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
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/own.css" />

</head>
<body>
	<div id="r2" >
		<div class="main_b_r_t">
			<div class="word1"  id="w1">
				<p>
					<a target="myclass"
						href="${pageContext.request.contextPath}/teacher/toMyClassList"
						id="p1">我创建的班级</a>
				</p>
			</div>
			
		
			<div class="word2" id="w4" style="margin-left: -2%">
				<p>
					<a target="_parent"
						href="${pageContext.request.contextPath}/teacher/toCreateVirtualClass"
						id="p4">创建班级</a>
				</p>
			</div>
		</div>
		<div class="hr"></div>
		<div class="main_b_r_b">
			<iframe id="myclass" name="myclass"
				style="width: 100%; height: 100%" frameborder="no" border="0"
				src="${pageContext.request.contextPath}/teacher/toMyClassList"></iframe>
		</div>
	 
	</div>
</body>
</html>

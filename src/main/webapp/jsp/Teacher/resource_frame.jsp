<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/scaffolding.less">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/course3.css">
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
</head>
<style>
	.resourceList{
		-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;
	}
</style>
<body>


<main>

<div class="main_b">

<ul>
	<li style="float: left; margin-left: 25px;margin-top: 18px;">
		<div class="resourceList" style="  height: 151px;width: 300px;padding-left: 65px;padding-top: 15px;
		background: url('${pageContext.request.contextPath}/images/resource_back2.png') no-repeat;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;">
			<div style="font-weight: 400;font-size: 25px;">Java 实验一</div>
			<div>知识点：java类的继承</div>
			<div>发布人：dono</div>
			<div>发布时间：xxxxxxx</div>
			<div>下载次数：3</div>
		</div>
	</li>
	<li style="float: left;margin-left: 25px;margin-top: 18px;">
		<div class="resourceList" style="  height: 151px;width: 300px;padding-left: 65px;padding-top: 15px;
		background: url('${pageContext.request.contextPath}/images/resource_back3.png') no-repeat;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;">
			<div style="font-weight: 400;font-size: 25px;">Java 实验一</div>
			<div>知识点：java类的继承</div>
			<div>发布人：dono</div>
			<div>发布时间：xxxxxxx</div>
			<div>下载次数：3</div>
		</div>
	</li>
	<li style="float: left;margin-left: 25px;margin-top: 18px;">
		<div class="resourceList" style="  height: 151px;width: 300px;padding-left: 65px;padding-top: 15px;
		background: url('${pageContext.request.contextPath}/images/resource_back4.png') no-repeat;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;">
			<div style="font-weight: 400;font-size: 25px;">Java 实验一</div>
			<div>知识点：java类的继承</div>
			<div>发布人：dono</div>
			<div>发布时间：xxxxxxx</div>
			<div>下载次数：3</div>
		</div>
	</li>
	<li style="float: left;margin-left: 25px;margin-top: 18px;">
		<div class="resourceList" style=" height: 151px;width: 300px;padding-left: 65px;padding-top: 15px;
		background: url('${pageContext.request.contextPath}/images/resource_back1.png') no-repeat;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;">
			<div style="font-weight: 400;font-size: 25px;">Java 实验一</div>
			<div>知识点：java类的继承</div>
			<div>发布人：dono</div>
			<div>发布时间：xxxxxxx</div>
			<div>下载次数：3</div>
		</div>
	</li>
	<li style="float: left;margin-left: 25px;margin-top: 18px;">
		<div class="resourceList" style="  height: 151px;width: 300px;padding-left: 65px;padding-top: 15px;
		background: url('${pageContext.request.contextPath}/images/resource_back5.png') no-repeat;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;">
			<div style="font-weight: 400;font-size: 25px;">Java 实验一</div>
			<div>知识点：java类的继承</div>
			<div>发布人：dono</div>
			<div>发布时间：xxxxxxx</div>
			<div>下载次数：3</div>
		</div>
	</li>
	<li style="float: left;margin-left: 25px;margin-top: 18px;">
		<div class="resourceList" style="  height: 151px;width: 300px;padding-left: 65px;padding-top: 15px;
     	 background: url('${pageContext.request.contextPath}/images/resource_back1.png') no-repeat;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;">
			<div style="font-weight: 400;font-size: 25px;">Java 实验一</div>
			<div>知识点：java类的继承</div>
			<div>发布人：dono</div>
			<div>发布时间：xxxxxxx</div>
			<div>下载次数：3</div>
		</div>
	</li>
</ul>

</div>
</main>
<footer></footer>
</body>
</html>
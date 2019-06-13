<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title>${course. courseName}</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/course3.css">
<script
	src="${pageContext.request.contextPath}/js/backstagemanager/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/zh-cn.js"></script>
<script
	src="${pageContext.request.contextPath}/js/backstagemanager/bootstrap.js"></script>
<style type="text/css">
.cit {
	width: 100px;
	height: 100px;
	background-color: #CC9933;
	border-radius: 50px;
	text-align: center;
}
</style>
<script type="text/javascript" charset="utf-8">
	$(function() {
		var width = $("#content").width();
		var ue = UE.getEditor('detail', {
			initialFrameWidth : width,
			initialFrameHeight : 180,
			initialFrameMargin : 0,
		})
	})
</script>
</head>
<body style="background-color: white;">
	<div class="col-md-12">
		<div class="col-md-2">
			<div class="cit">
				<h3 style="padding-top: 37%">简介</h3>
			</div>
		</div>
		<div class="col-md-2">
			<div class="cit">
				<h3 style="padding-top: 37%">计划</h3>
			</div>
		</div>
		<div class="col-md-2">
			<div class="cit">
				<h3 style="padding-top: 37%">需求</h3>
			</div>
		</div>
		<div class="col-md-2">
			<div class="cit">
				<h3 style="padding-top: 37%">设计方案</h3>
			</div>
		</div>
		<div class="col-md-2">
			<div class="cit">
				<h3 style="padding-top: 37%">关键算法</h3>
			</div>
		</div>
		<div class="col-md-2">
			<div class="cit">
				<h3 style="padding-top: 37%">测试情况</h3>
			</div>
		</div>
		<div
			style="height: 5px; width: 80%; margin-left: 8%; margin-top: 6%; background-color: #0099CC;"></div>
	</div>
	<div class="col-md-12" id="content" style="margin-top: 2%">
		<textarea id="detail" name="detail" type="text" placeholder="作品详情"></textarea>
	</div>
	<div class="col-md-12" style="margin-top: 2%">
		<input type="text" class="form-control" style="width: 15%"
			placeholder="步骤设计者">
		<div class="col-md-12" style="padding: 0px; margin-top: 2%;">
			<p class="pull-left">最后修改时间：2011-05-99 12:00:00</p>
			<div class="col-md-4 pull-right" style="margin-top:-1%">
				<div class="btn-group" role="group" aria-label="...">
					<button type="button" class="btn btn-default">上一步</button>
					<button type="button" class="btn btn-default">保存</button>
					<button type="button" class="btn btn-default">下一步</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
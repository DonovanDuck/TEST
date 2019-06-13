<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>翻转三级页面</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/turnClass/overturn_threelevel.css">
<link
	href="${pageContext.request.contextPath}/css/backstagemanager/bootstrap.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/css/backstagemanager/bootstrap-table.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/js/backstagemanager/jquery-3.2.1.js"></script>
<script
	src="${pageContext.request.contextPath}/js/backstagemanager/bootstrap.js"></script>
</head>
<body style="background-color: #F0F0F0">
	<div class="main_t container-fluid row">
		<div class="word col-md-8">
			<h1>JAVA程序设计</h1>
			<p>参与人数：200 &nbsp;&nbsp;&nbsp;创课时间：2019年4月15日</p>
		</div>
		<div class="button col-md-4">
			<button type="button" class="btn btn-default">关注课程</button>
		</div>
	</div>
	<div class="main_m row" style="margin-left: 10%;background-color: yellow;">
		<div class="title col-md-11">
			<h2>贪吃蛇大作战</h2>
		</div>
		<div class="accept_task col-md-1">
			<button type="button" class="btn btn-link">接收任务</button>
		</div>
	</div>
	<div class="main_b_top row" style="margin-left: 10%">
		<h3 class="col-md-12">任务描述</h3>
		<div class="details col-md-12">
			第1部分 线性数据结构 <br> 该部分训练对线性结构实现方法，涉及线性表、队列、栈。第1部分
			线性数据结构该部分训练对线性结构实现方法，涉及线性表、队列、栈。第1部分 线性数据结构该部分训练对线性结构实现方法，涉及线性表、队列、栈。<br>
			1-1 数据结构与算法 - 线性表 <br> 1-2 数据结构与算法 - 队 <br> 1-1 数据结构与算法 -
			线性表 <br> 1-2 数据结构与算法 - 队列 <br>
		</div>
		<div class="enclosure col-md-12">
			<img src="../images/word.png" alt="">&nbsp;&nbsp; <img
				src="../images/word.png" alt=""> &nbsp;&nbsp;<img
				src="../images/word.png" alt="">
		</div>
		<div class="time col-md-4">
			发布时间：2019年3月2日&nbsp;&nbsp;截止时间：2019年4月21日</div>
	</div>
	<a href="${pageContext.request.contextPath}/turnClass/toTurnClassTeamDetail">
		<div class="main_b_group row" style="margin-left: 10%">
			<div class="group_t">
				<div class="col-md-1"></div>
				<div class="group_name col-md-3">
					<h4>小组1</h4>
				</div>
				<div class="group_name col-md-6">
					<h4>贪吃蛇小游戏</h4>
				</div>
				<div class="group_status col-md-2">
					<button type="button" class="btn btn-default">课前准备</button>
				</div>
			</div>
			<div class="group_m">
				<div class="people col-md-9">
					<div class="col-md-3">
						<div class="img-circle center-block">
							<img src="../images/tou2.png" alt="">
						</div>
						<p class="p1 text-center">192056101&nbsp;&nbsp;刘备</p>
						<p class="text-center">组长</p>
					</div>
					<div class="col-md-3">
						<div class="img-circle center-block">
							<img src="../images/tou2.png" alt="">
						</div>
						<p class="text-center">192056101&nbsp;&nbsp;张飞</p>
					</div>
					<div class="col-md-3">
						<div class="img-circle center-block">
							<img src="../images/tou2.png" alt="">
						</div>
						<p class="text-center">192056104&nbsp;&nbsp;孙权</p>
					</div>
					<div class="col-md-3">
						<div class="img-circle center-block">
							<img src="../images/tou2.png" alt="">
						</div>
						<p class="text-center">192056102&nbsp;&nbsp;诸葛亮</p>
					</div>
				</div>
				<div class="group_b col-md-12" style="margin-top:-2%">
					<p class="p2 col-md-3">接收任务时间：2019年3月3日</p>
					<p class=" p1 col-md-2">评论：24条</p>
				</div>
			</div>
		</div>
	</a>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>教师作业详情页</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/teacher/teacher_homework_detail.css" />
		<script src="${pageContext.request.contextPath}/js/teacher_homework_detail.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/course/teacher-task.css" />
		<script src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
	
	</head>
	<body>
		<div class="homework_description">
			<div class="description_detail">
				<span style="font-size: 18px;">作业描述</span>
				<p>距结束：<span>12：30：10</span></p>
				<p>${task.taskDetail }</p>
				<span>附件</span>
				<ul class="more">
					<c:forEach items="${task.accessoryList }" var="accessory">
						<li class="left">
							<img src="img/头像.png" />
							<a href="${pageContext.request.contextPath}/teacher/resourceDownload?fileName=${accessory.accessoryName }&id=${task.taskId }">${accessory.accessoryName }</a>
						</li>
					</c:forEach>
					
				</ul>
			</div>
		</div>
		<div class="homework_submit">
			<p class="submit_title">作业提交情况</p>
			<ul class="change_situation">
				<li class="left"id="already_submit"onclick="already()"style="background: coral;">已提交&nbsp;&nbsp;<span>30/43</span></li>
				<li class="left"id="no_submit"onclick="nothing()">未提交&nbsp;&nbsp;<span>13/43</span></li>
			</ul>
			<ul id="submit_detail">
				<li class="sbumit_detail_li">
					<p class="photo"><img src="img/头像.png" /></p>
					<p class="information"><span>162056201</span>&nbsp;&nbsp;<span>赵婉婷</span></p>
					<div class="submit_content">
						<p>提交内容：</p>
						<div class="addition">
							<p><span>2</span>个附件</p>
							<ul>
								<li class="left"><img src="img/头像.png" /></li>
								<li class="left"><img src="img/头像.png" /></li>
							</ul>
						</div>
						<p class="p"><span>12</span>月<span>27</span>日&nbsp;<span>08：52</span>提交</p>
						<a>写评语</a>
						<a class="right">评分</a>
					</div>
				</li>
				<li class="sbumit_detail_li">
					<p class="photo"><img src="img/头像.png" /></p>
					<p class="information"><span>162056201</span>&nbsp;&nbsp;<span>赵婉婷</span></p>
					<div class="submit_content">
						<p>提交内容：</p>
						<div class="addition">
							<p><span>2</span>个附件</p>
							<ul>
								<li class="left"><img src="img/头像.png" /></li>
								<li class="left"><img src="img/头像.png" /></li>
							</ul>
						</div>
						<p class="p"><span>12</span>月<span>27</span>日&nbsp;<span>08：52</span>提交</p>
						<a>写评语</a>
						<a class="right">评分</a>
					</div>
				</li>
				<li class="sbumit_detail_li">
					<p class="photo"><img src="img/头像.png" /></p>
					<p class="information"><span>162056201</span>&nbsp;&nbsp;<span>赵婉婷</span></p>
					<div class="submit_content">
						<p>提交内容：</p>
						<div class="addition">
							<p><span>2</span>个附件</p>
							<ul>
								<li class="left"><img src="img/头像.png" /></li>
								<li class="left"><img src="img/头像.png" /></li>
							</ul>
						</div>
						<p class="p"><span>12</span>月<span>27</span>日&nbsp;<span>08：52</span>提交</p>
						<a>写评语</a>
						<a class="right">评分</a>
					</div>
				</li>
				<li class="sbumit_detail_li">
					<p class="photo"><img src="img/头像.png" /></p>
					<p class="information"><span>162056201</span>&nbsp;&nbsp;<span>赵婉婷</span></p>
					<div class="submit_content">
						<p>提交内容：</p>
						<div class="addition">
							<p><span>2</span>个附件</p>
							<ul>
								<li class="left"><img src="img/头像.png" /></li>
								<li class="left"><img src="img/头像.png" /></li>
							</ul>
						</div>
						<p class="p"><span>12</span>月<span>27</span>日&nbsp;<span>08：52</span>提交</p>
						<a>写评语</a>
						<a class="right">评分</a>
					</div>
				</li>
			</ul>
			<ul id="list">
				<li id="li">
					<ul>
						<li class="left"style="margin-top: 0.5%;"><img src="img/头像.png" /></li>
						<li class="classnum left">162056201</li>
						<li class="name left">赵婉婷</li>
					</ul>
				</li>
				<li id="li">
					<ul>
						<li class="left"style="margin-top: 0.5%;"><img src="img/头像.png" /></li>
						<li class="classnum left">162056201</li>
						<li class="name left">赵婉婷</li>
					</ul>
				</li>
				<li id="li">
					<ul>
						<li class="left"style="margin-top: 0.5%;"><img src="img/头像.png" /></li>
						<li class="classnum left">162056201</li>
						<li class="name left">赵婉婷</li>
					</ul>
				</li>
				<li id="li">
					<ul>
						<li class="left"style="margin-top: 0.5%;"><img src="img/头像.png" /></li>
						<li class="classnum left">162056201</li>
						<li class="name left">赵婉婷</li>
					</ul>
				</li>
				<li id="li">
					<ul>
						<li class="left"style="margin-top: 0.5%;"><img src="img/头像.png" /></li>
						<li class="classnum left">162056201</li>
						<li class="name left">赵婉婷</li>
					</ul>
				</li>
			</ul>
		</div>
	</body>
</html>

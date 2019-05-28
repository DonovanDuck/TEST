<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN" style="padding-top: 25px;">
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
	<script
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script
	src="${pageContext.request.contextPath}/js/adminJs/bootstrap.min.js"></script>
	<script
	src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</head>

<body>


<main>

<!-- <div class="main_b">
<div style="    width: 100%;
    height: 100%;
    text-align: center;
    font-size: 92px;
    color: #fff;">
	暂无资源
</div>
</div>
</main>
<footer></footer> -->
<div class="container" >
					<div class="carousel slide" id="slidershow" data-ride="carousel" data-interval="2000">
						<!--计数器-->
						<ol class="carousel-indicators">
							<li class="active" data-target="#slidershow" data-slide-to="0"></li>
							<li data-target="#slidershow" data-slide-to="1"></li>
							<li data-target="#slidershow" data-slide-to="2"></li>
						</ol>
						<!--图片容器-->
						<div class="carousel-inner">
							<div class="item active">
								<img src="${pageContext.request.contextPath}/images/tu1.jpg"/>
								<!--添加对应标题和内容-->
								<div class="carousel-caption">
									<h4>图一</h4>
									<span>内容</span>
								</div>
							</div>
							<div class="item">
								<img src="${pageContext.request.contextPath}/images/tu1.jpg"/>
								<!--添加对应标题和内容-->
								<div class="carousel-caption">
									<h4>图二</h4>
								</div>
							</div>
							<div class="item">
								<img src="${pageContext.request.contextPath}/images/tu1.jpg"/>
								<!--添加对应标题和内容-->
								<div class="carousel-caption">
									<h4>图三</h4>
								</div>
							</div>
							<!--轮播导航-->
							<a href="#slidershow" data-slide="prev" class="left carousel-control" role="button">
								<img src="${pageContext.request.contextPath}/images/position.png"/>
							</a>
							<a href="#slidershow" data-slide="next" class="right carousel-control" role="button">
								<img src="${pageContext.request.contextPath}/images/position.png"/>
							</a>
						</div>
					</div>
				</div>
</body>
</html>
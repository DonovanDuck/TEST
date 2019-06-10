<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN" style="background: #fff;overflow-x: hidden;">
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title>首页教师团队</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/scaffolding.less">
<link
	href="${pageContext.request.contextPath}/css/achievement/achievementMain.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/course3.css">
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
</head>
<body style="background: #fff;">


<style>
	.a
{
	width:313px;
	height:0;
	background-color:#f0f0f0;
	opacity: 0;
	transition:height 0.2s linear,opacity 0.2s linear;
	-webkit-transition:height 0.2s linear,opacity 0.2s linear; /* Safari */
	padding-left: 26px;
    padding-top: 18px;
	
}
.b{
	width:187px;
	min-height:77px;
	height: auto;
	position: relative;
}

.b:hover .a
{
	height:100px;
	
	opacity: 1;
	
}
</style>


						<div class="b">
							
							<ul style="list-style: none;">
								<li style="float: left;">
									<div 
										style="width: 60px; height: 60px; margin-left: 10px; margin-top: 10px;">
										<img style="border-radius: 50%; width: 100%; height: 100%"
											src="${pageContext.request.contextPath}/images/touxiang_01.png" alt="" />
									</div>
								</li>
								<li style="float:left; position: relative; top: 30px; left: 18px;">
									<div style="width: 100px; height: 50px;">
										<ul style="list-style: none;">
											<li style="margin-right: 10px; float: left;">赵忠文</li>
											<li style="margin-right: 10px; float: left;">教授</li><li>经验值：10</li>
										</ul>
									</div>
								</li>
							</ul>
							<div style="clear: both;"></div>
							<div class="a">
							<div>简介：博士</div>
							</div>
						</div>
					<!-- 清除浮动 -->
					 <div style="clear: both;"></div>
					 
					 
					 <div class="b">
							
							<ul style="list-style: none;">
								<li style="float: left;">
									<div 
										style="width: 60px; height: 60px; margin-left: 10px; margin-top: 10px;">
										<img style="border-radius: 50%; width: 100%; height: 100%"
											src="${pageContext.request.contextPath}/images/touxiang_02.png" alt="" />
									</div>
								</li>
								<li style="float:left; position: relative; top: 30px; left: 18px;">
									<div style="width: 100px; height: 50px;">
										<ul style="list-style: none;">
											<li style="margin-right: 10px; float: left;">陈&nbsp;&nbsp;&nbsp;&nbsp;远</li>
											<li style="margin-right: 10px; float: left;">教授</li><li>经验值：10</li>
										</ul>
									</div>
								</li>
							</ul>
							<div style="clear: both;"></div>
							<div class="a">
							<div>简介：博士</div>
							</div>
						</div>
					<!-- 清除浮动 -->
					 <div style="clear: both;"></div>
					 
					 <div class="b">
							
							<ul style="list-style: none;">
								<li style="float: left;">
									<div 
										style="width: 60px; height: 60px; margin-left: 10px; margin-top: 10px;">
										<img style="border-radius: 50%; width: 100%; height: 100%"
											src="${pageContext.request.contextPath}/images/touxian_11.png" alt="" />
									</div>
								</li>
								<li style="float:left; position: relative; top: 30px; left: 18px;">
									<div style="width: 100px; height: 50px;">
										<ul style="list-style: none;">
											<li style="margin-right: 10px; float: left;">周&nbsp;&nbsp;&nbsp;&nbsp;昀</li>
											<li style="margin-right: 10px; float: left;">教授</li><li>经验值：10</li>
										</ul>
									</div>
								</li>
							</ul>
							<div style="clear: both;"></div>
							<div class="a">
							<div>简介：博士</div>
							</div>
						</div>
					<!-- 清除浮动 -->
					 <div style="clear: both;"></div>
					 
					 <div class="b">
							
							<ul style="list-style: none;">
								<li style="float: left;">
									<div 
										style="width: 60px; height: 60px; margin-left: 10px; margin-top: 10px;">
										<img style="border-radius: 50%; width: 100%; height: 100%"
											src="${pageContext.request.contextPath}/images/touxiang_01.png" alt="" />
									</div>
								</li>
								<li style="float:left; position: relative; top: 30px; left: 18px;">
									<div style="width: 100px; height: 50px;">
										<ul style="list-style: none;">
											<li style="margin-right: 10px; float: left;">赵忠文</li>
											<li style="margin-right: 10px; float: left;">教授</li><li>经验值：10</li>
										</ul>
									</div>
								</li>
							</ul>
							<div style="clear: both;"></div>
							<div class="a">
							<div>简介：博士</div>
							</div>
						</div>
					<!-- 清除浮动 -->
					 <div style="clear: both;"></div>
					 
					 <div class="b">
							
							<ul style="list-style: none;">
								<li style="float: left;">
									<div 
										style="width: 60px; height: 60px; margin-left: 10px; margin-top: 10px;">
										<img style="border-radius: 50%; width: 100%; height: 100%"
											src="${pageContext.request.contextPath}/images/touxiang_01.png" alt="" />
									</div>
								</li>
								<li style="float:left; position: relative; top: 30px; left: 18px;">
									<div style="width: 100px; height: 50px;">
										<ul style="list-style: none;">
											<li style="margin-right: 10px; float: left;">赵忠文</li>
											<li style="margin-right: 10px; float: left;">教授</li><li>经验值：10</li>
										</ul>
									</div>
								</li>
							</ul>
							<div style="clear: both;"></div>
							<div class="a">
							<div>简介：博士</div>
							</div>
						</div>
					<!-- 清除浮动 -->
					 <div style="clear: both;"></div>
					 
					 <div class="b">
							
							<ul style="list-style: none;">
								<li style="float: left;">
									<div 
										style="width: 60px; height: 60px; margin-left: 10px; margin-top: 10px;">
										<img style="border-radius: 50%; width: 100%; height: 100%"
											src="${pageContext.request.contextPath}/images/touxiang_01.png" alt="" />
									</div>
								</li>
								<li style="float:left; position: relative; top: 30px; left: 18px;">
									<div style="width: 100px; height: 50px;">
										<ul style="list-style: none;">
											<li style="margin-right: 10px; float: left;">赵忠文</li>
											<li style="margin-right: 10px; float: left;">教授</li><li>经验值：10</li>
										</ul>
									</div>
								</li>
							</ul>
							<div style="clear: both;"></div>
							<div class="a">
							<div>简介：博士</div>
							</div>
						</div>
					<!-- 清除浮动 -->
					 <div style="clear: both;"></div>
					 
					 <div class="b">
							
							<ul style="list-style: none;">
								<li style="float: left;">
									<div 
										style="width: 60px; height: 60px; margin-left: 10px; margin-top: 10px;">
										<img style="border-radius: 50%; width: 100%; height: 100%"
											src="${pageContext.request.contextPath}/images/touxiang_01.png" alt="" />
									</div>
								</li>
								<li style="float:left; position: relative; top: 30px; left: 18px;">
									<div style="width: 100px; height: 50px;">
										<ul style="list-style: none;">
											<li style="margin-right: 10px; float: left;">赵忠文</li>
											<li style="margin-right: 10px; float: left;">教授</li><li>经验值：10</li>
										</ul>
									</div>
								</li>
							</ul>
							<div style="clear: both;"></div>
							<div class="a">
							<div>简介：博士</div>
							</div>
						</div>
					<!-- 清除浮动 -->
					 <div style="clear: both;"></div>

			
</body>
</html>
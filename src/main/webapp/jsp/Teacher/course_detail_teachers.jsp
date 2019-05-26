<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN" style="background: #fff;">
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title>课程三级页面</title>
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


					<c:forEach items="${teacherList }" var="teacher">
						<div class="b">
							
							<ul style="list-style: none;">
								<li style="float: left;">
									<div 
										style="width: 60px; height: 60px; margin-left: 10px; margin-top: 10px;">
										<img style="border-radius: 50%; width: 100%; height: 100%"
											src="${teacher.faceImg }" alt="" />
									</div>
								</li>
								<li style="float:left; position: relative; top: 30px; left: 18px;">
									<div style="width: 100px; height: 50px;">
										<ul style="list-style: none;">
											<li style="margin-right: 10px; float: left;">${teacher.teacherName }</li>
											<li>${teacher.professionalTitles }</li>
										</ul>
									</div>
								</li>
							</ul>
							<div style="clear: both;"></div>
							<div class="a">
							<div>学历：${teacher.educationBackground }</div>
							<div>电话：${teacher.telephone }</div>
							<div>邮箱：${teacher.email }</div>
							</div>
						</div>
					<!-- 清除浮动 -->
					 <div style="clear: both;"></div>
					</c:forEach>
					<%--<li>
						<div>
							<ul style="list-style: none;">
								<li style="float: left;">
									<div
										style="width: 60px; height: 60px; margin-left: 10px; margin-top: 10px;">
										<img style="border-radius: 50%; width: 100%; height: 100%"
											src="${pageContext.request.contextPath}/images/t2.png" alt="" />
									</div>
								</li>
								<li style="float:left; position: relative; top: 30px; left: 18px;">
									<div style="width: 100px; height: 50px;">
										<ul style="list-style: none;">
											<li style="margin-right: 10px; float: left;">嘉能可</li>
											<li>副教授</li>
										</ul>
									</div>
								</li>
							</ul>
						</div>
					</li>
				</ul> --%>

			
</body>
</html>
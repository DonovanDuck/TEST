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
<body>

	<div class="main_b_m">
		 
			<div class="brother">
				<a href="#">更多</a>
				<h3>教案库</h3>
				
				<p>1、JAVA语言概述与开发环境的搭建</p>
				<p>2、简单的JAVA程序</p>
				<p>3、数据运算、流控制和数组</p>
				<p>4、类、包和接口</p>
			</div>
			<div class="brother">
				<a href="#">更多</a>
				<h3>实验库</h3>
				<p>1、创建java Application和 java Applet程序</p>
				<p>2、类的继承</p>
				<p>3、接口的应用</p>
				<p>4、熟练掌握多线程</p>
			</div>
			<div class="brother">
				<a href='${pageContext.request.contextPath}/teacher/toCourseResource/4'>更多</a>
				<h3>作业库</h3>
				<c:forEach items ="${taskList}" varStatus="status" var = "task"  begin="0" end ="4">
					<p>${requestScope.offset+status.index +1}、${task.taskTitle }</p>
				</c:forEach>
				<!-- <h3>作业库</h3>
				<p>1、创建第一个java 程序 Hello World</p>
				<p>2、练习数据类型转换</p>
				<p>3、熟练掌握类的继承</p>
				<p>4、用类实现求两点间的距离</p> -->
			</div>
			<div class="brother">
				<a href='${pageContext.request.contextPath}/teacher/toCourseResource/3'>更多</a>
				<h3>多媒体库</h3>
				<c:forEach items ="${resource}" varStatus="status" var = "re"  begin="0" end ="4">
					<p>${requestScope.offset+status.index +1}、${re.resourceName }</p>
				</c:forEach>
				<!-- 
				<p>2、简单的JAVA程序视频演示</p>
				<p>3、数据运算、流控制和数组视频教程</p>
				<p>4、类的使用视频教程</p> -->
			</div>
			<div class="brother">
				<a href="#">更多</a>
				<h3>课设库</h3>
				<p>1、图书信息管理系统</p>
				<p>2、简单小游戏</p>
				<p>3、记事本</p>
				<p>4、员工信息管理系统</p>
			</div>
			<div class="brother">
				<a href="#">更多</a>
				<h3>教学资源库</h3>
				<p>1、JAVA语言概述与开发环境的搭建</p>
				<p>2、简单的JAVA程序</p>
				<p>3、数据运算、流控制和数组</p>
				<p>4、类、包和接口</p>
			</div>
		</div> 
	

</body>
</html>
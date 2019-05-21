<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" href="css/base.css" />
		<link rel="stylesheet" type="text/css" href="css/index3.css"/>
		<script src="js/jquery-1.8.0.min.js" type="text/javascript" charset="utf-8"></script>
		
		
		</script>
		<style> 
.a
{
	width:222px;
	height:0;
	background:red;
	opacity: 0;
	transition:height  linear,opacity  linear;
	-webkit-transition:height  linear,opacity  linear; /* Safari */
	
	
}
.b{
	width:222px;
	min-height:100px;
	height: auto;
	position: relative;
}

.b:hover .a
{
	height:120px;
	opacity: 1;
}
</style>
	</head>
	<body>
		<div class="b">
			
			<div style="background:#9B9B9B; position: ; top: 0;left: 0;width: 100%;height: 100px;z-index: -1;">
				<div style="width: 60px; height: 60px; margin-left: 10px; margin-top: 10px;float: left;">
										<img style="border-radius: 50%; width: 100%; height: 100%;"
											src="${pageContext.request.contextPath}/images/t2.png" alt="" />
									</div>
				<div style="    position: relative;
    left: 21px;
    top: 26px;">姓名   mingzi</div>
			</div>
			<div class="a">
				<div>姓名：xxxxx</div>
				<div>姓名：xxxxx</div>
			</div>
		</div>
		<div class="b">
			<div class="a">
				<div>姓名：xxxxx</div>
				<div>姓名：xxxxx</div>
			</div>
			<div style="background: #9B9B9B; position: absolute; top: 0;left: 0;width: 100px;height: 100px;z-index: -1;">
				<div>姓名</div>
				<div>姓名</div>
			</div>
		</div>
		
	</body>
		
</html>

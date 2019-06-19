<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script
	src="${pageContext.request.contextPath}/js/backstagemanager/bootstrap.js"></script>
<style type="text/css">
.description {
	display: -webkit-box;
	-webkit-box-orient: vertical;
	overflow: hidden;
	overflow-x: hidden;
	overflow-y: hidden;
	font-size: 15px;
	word-break: break-all;
	text-overflow: ellipsis;
	-webkit-line-clamp: 1;
	color: gray;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="col-md-12" style="width: 80%; margin-left: 10%">
		<div class="col-md-12">
			<h3>课堂翻转</h3>
		</div>
		<div class="col-md-4" style="background-color: white;">
			<c:forEach items="${taskList }" var="item">
				<a
					href="${pageContext.request.contextPath}/turnClass/toTurnClassTeam?taskId=${item.taskId }">
					<div clas="col-md-12">
						<h3 class="text-center">
							<b>${item.taskTitle }</b>
						</h3>
						<p class="text-center">
							<c:forEach items="${item.classList }" var="i">
							${i.realClassNum }
						</c:forEach>
						</p>
						<p class="description">
							<b>${item.taskDetail }</b>
						</p>
						<div class="col-md-12" style="padding: 0px">
							<p class="pull-left">发布人：${item.publisherId }</p>
							<p class="pull-right">
								<fmt:formatDate value="${item.publishTime }"
									pattern="yyyy年MM月dd日" />
							</p>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
</body>
</html>
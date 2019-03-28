<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>资源发布页面</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/teacher-release-resource.css"
	type="text/css">
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
<script type="text/javascript">
	UE.getEditor('resourceDetail');
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/zh-cn.js"></script>
<link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/js/Admin/bootstrap.min.js"></script>
<script type="text/javascript">
	function submitButton() {
		var selectType = $("#taskCategory").val();//获取选择的类型
		var resourcePath = "${pageContext.request.contextPath}/teacher/publishResource";//资源的请求路径
		var taskPath = "${pageContext.request.contextPath}/teacher/publishTask";//任务的请求路径
	}
</script>
</head>
<body>
	<jsp:include page="/jsp/top.jsp" flush="true" />
	<div class="mian_top"
		style="margin-bottom: 1%; text-align: center; margin: 0px">
		<h2 style="margin-bottom: 4px; margin: 0;">课程名:&nbsp&nbsp${course.courseName
			}</h2>
		<h3 style="width: 22%; float: left; margin: 0; margin-top: 1%;">类型:&nbsp&nbsp${course.courseCategory
			}</h3>
		<h3
			style="width: 57%; float: left; margin: 0; margin-bottom: 1%; margin-top: 1%;">
			课程创建时间:&nbsp&nbsp
			<fmt:formatDate value="${course.publishTime }" pattern="yyyy年MM月dd日" />
		</h3>
		<h3 style="width: 20%; float: left; margin: 0; margin-top: 1%;">
			<a
				href="${pageContext.request.contextPath}/teacher/toPublishResource"
				target="_parent">
				<button type="button" class="btn btn-primary">发布资源</button>
			</a>
		</h3>
	</div>
	<div class="main_b">
		<div class="text">
			<form action="" enctype="multipart/form-data" method="post"
				onSubmit="submitButton()">
				<span><strong>名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</strong></span>
				<input type="text" name="resourceName" placeholder="请输入名称："
					style="width: 60%; height: 30px; float: left;">
				<div style="width: 10%; height: 30px; float: left">
					<select id="taskCategory" name="taskCategory">
						<option value="0">选择资源类型</option>
						<option value="1">教案资源</option>
						<option value="2">教学资源资源</option>
						<option value="work">作业资源</option>
						<option value="medio">多媒体资资源</option>
						<option value="trial">实验资源</option>
						<option value="6">课程设计资源</option>
					</select>
				</div>
				<br> <br> <span><strong>资源介绍：</strong></span> <input
					name="resourceDetail" type="text" placeholder="请输入资源详情：(字数100内)"
					style="width: 80%; height: 100px; float: left;" maxlength="100">
				<br> <br> <span style="margin-top: 1%"> <strong>附&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件：</strong></span>
				<ul id="accessoryUI" name="accessoryUI" style="margin-top: 4%;">
					<li id="accessory" name="accessory"><input name="upFile"
						type="file" id="upFile" multiple="multiple"></li>
				</ul>
				<div class="button">
					<button
						style="padding-left: 1%; padding-right: 1%; font-size: 16px; float: right; margin-right: 20%;"
						type="submit">上传并发布</button>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/jsp/footer.jsp" flush="true" />
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>资源更新页面</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/teacher-release-task.css"
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
</head>
<body>
	<jsp:include page="/jsp/top.jsp" flush="true" />
	<div class="main_b">
		<div class="text">
			<form
				action="${pageContext.request.contextPath}/teacher/"
				enctype="multipart/form-data" method="post">
				<span><strong>名&nbsp;&nbsp;&nbsp;&nbsp;称:</strong></span> <input
					type="text" name="resourceName" value="${resource.resourceName }"
					style="width: 60%; height: 30px; float: left;"> <br> <br>
				<span><strong>资源详情：</strong></span> <input name="resourceDetail"
					type="text"  value="${resource.resourceDetail }"
					style="width: 80%; height: 210px; float: left;">
				<div class="button">
					<b>附件:</b> <input name="file" type="file" multiple="multiple" />
					<button
						style="padding-left: 1%; padding-right: 1%; font-size: 16px; float: right; margin-right: 20%;">更新</button>
				</div>
			</form>
		</div>
	</div>
	<div>
		<img alt="" src="${pageContext.request.contextPath}/images/bottom.png"
			style="width: 100%;">
	</div>
</body>
</html>
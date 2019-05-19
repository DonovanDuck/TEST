<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>资源更新页面</title>
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
		var path = "${pageContext.request.contextPath}/teacher/updateResource/${resource.resourceId }";
		alert(path);
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
				<table class="table">
					<tbody>
						<tr>
							<th style="border: 0px">名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</th>
							<td style="border: 0px"><input type="text"
								name="resourceName" value="${resource.resourceName }"
								style="width: 60%; height: 30px; float: left;">
								<div style="width: 15%; height: 30px; float: left">
									<select id="taskCategory" name="taskCategory">
										<option value="0">选择资源类型</option>
										<option value="1">教案资源</option>
										<option value="2">教学资源资源</option>
										<option value="3">作业资源</option>
										<option value="4">多媒体资资源</option>
										<option value="5">实验资源</option>
										<option value="6">课程设计资源</option>
									</select>
								</div></td>
						</tr>
						<tr>
							<th style="border: 0px">资源介绍：</th>
							<td style="border: 0px"><input name="resourceDetail"
								type="text" value="${resource.resourceDetail }"
								style="width: 80%; height: 70px;" maxlength="100"></td>
						</tr>
						<c:if test="${empty resource.resourcePath }">
							<tr class="isEmpty">
								<th style="border: 0px">附&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件：</th>
								<td style="border: 0px"><input style="margin-top: 1%;"
									name="file" type="file" class="isEmpty" multiple="multiple"></td>
							</tr>
						</c:if>
						<c:if test="${!empty resource.resourcePath }">
							<tr class="notEmpty">
								<th style="border: 0px; padding-top: 16px">原始附件：</th>
								<td style="border: 0px"><a
									href="${pageContext.request.contextPath}/teacher/downLoadResorce?path=${resource.resourcePath }">
										<button type="button" class="btn btn-xs"
											style="margin-top: 1%;">${resource.resourceName }</button>
								</a>
									<button type="button" class="btn btn-xs"
										style="margin-top: 1%;">更新附件</button></td>
							</tr>
						</c:if>
						<tr>
							<th style="border: 0px"></th>
							<td style="border: 0px">
								<button class="btn btn-primary btn-xs"
									style="font-size: 16px; float: right; margin-right: 20%;">修改</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="/jsp/footer.jsp" flush="true" />
</body>
</html>
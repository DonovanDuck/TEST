<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/managerResourceList.css"
	type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link
	href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/js/Admin/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>


<script type="text/javascript">
	$(function() {
		window.parent.setTimeIframe();
	})
</script>
<script type="text/javascript">
	function deleteInfo() {
		var id = $("#deleteInfo").val();
		var path = "${pageContext.request.contextPath}/teacher/toDeleteResource/"
				+ id;
		$.ajax({
			async : false,
			cache : false,
			url : path,
			type : "POST",
			dataType : "json",
			error : function() {
				window.parent.refresh(id);
			},
			success : function(msg) {
				window.parent.refresh(id);
			}
		});
	}
</script>
<script type="text/javascript">
	function updateInfo() {
		var id = $("#updateInfo").val();
		window.parent.buttonClick(id);
	}
</script>
</head>
<body>
	<c:forEach items="${taskList }" var="list">
		<div class="course">
			<div class="imgContent col-md-3">
				<img src="${pageContext.request.contextPath}/images/tu11.jpg" alt="">
			</div>
			<div class="col-md-8" style="height: 100%">
			<div class="resource_name col-md-12" style="height: 20%">
					<label class="col-md-3 text-center" style="padding-left: 0%">资&nbsp&nbsp源&nbsp&nbsp名:</label>
					<label class="col-md-9 text-left" style="margin-left: -8%">${list.taskTitle }</label>
				</div>
				<div class="resource_name col-md-12" style="height: 20%">
					<label class="col-md-3 text-center" style="padding-left: 0%">资源介绍:</label>
					<label class="col-md-9 text-left" style="margin-left: -8%">${list.taskDetail }</label>
				</div>
				<div class="resource_name col-md-12" style="height: 20%">
					<label class="col-md-3 text-center" style="padding-left: 0%">作&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp者:</label>
					<label class="col-md-9 text-left" style="margin-left: -8%">${list.publisherId }</label>
				</div>
				<div class="resource_name col-md-12" style="height: 20%">
					<label class="col-md-3 text-center" style="padding-left: 0%">上传时间:</label>
					<label class="col-md-9 text-left" style="margin-left: -8%"><fmt:formatDate value="${list.publishTime }" pattern="yyyy年MM月dd日" /></label>
				</div>
				<div class="resource_name col-md-12" style="height: 20%">
					<label class="col-md-3 text-center" style="padding-left: 0%">引用次数:</label>
					<label class="col-md-9 text-left" style="margin-left: -8%">${list.useNum }</label>
				</div>
			</div>
			<div class="col-md-1">
				<button class="btn btn-default" id="deleteInfo" name="deleteInfo"
					value="${list.taskId }" style="margin-top: 30%"
					onclick="deleteInfo()">删除</button>
				<a target="_parent"
					href="${pageContext.request.contextPath}/teacher/toUpdateTaskPage/${list.taskId }"><button
						class="btn btn-default" style="margin-top: 46%" id="updateInfo"
						name="updateInfo" value="${list.taskId }" onclick="">修改</button></a>
			</div>
		</div>
	</c:forEach>
</body>
</html>
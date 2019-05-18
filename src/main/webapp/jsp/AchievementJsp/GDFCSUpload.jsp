<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en" style="background-color: white;">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/css/achievement/uploadAchievement.css"
	rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript">
	function submitButton() {
		$("#formContent").submit();
	}
</script>
<script type="text/javascript">
	$(function(){
		setIframeHeight();
	});
	function setIframeHeight() {
	    var height = $(".IURP").outerHeight(true)
		if (height) {
			$("#content").height(height);//直接设置元素的高
			}
		}
			window.onload = function() {
			//重复执行某个方法,动态刷新高度 
			var t1 = window.setInterval(setIframeHeight, 500);
			var t2 = window.setInterval("setIframeHeight()", 500);
			window.clearInterval(t1);
		};
</script>
</head>
<body class="body">
	<div class="top">
		<jsp:include page="/jsp/top.jsp" flush="true" />
	</div>
	<div class="content" id="content">
		<h3 class="text-center" style="margin: 0px; margin-bottom: 1%">大学毕业设计作品上传</h3>
		<form id="formContent"
			action="${pageContext.request.contextPath}/achievement/publishGDFCS"
			method="post" enctype="multipart/form-data">
			<div class="col-md-12 IURP panel panel-default"
				style="margin-top: 2%; padding: 3%; display: block">
				<div class="form-group">
					<label for="name">大学毕业设计作品名称</label> <input type="text"
						class="form-control" id="name" name="name" placeholder="作品名称">
				</div>
				<div class="form-group">
					<label for="compere">作品负责人</label>
					<div style="padding: 0px; margin: 0px; width: 100%;">
						<input type="text" class="form-control" id="compere"
							name="compere" style="float: left; width: 41%"
							placeholder="作品负责人"><input type="text"
							class="form-control" id="memberNum" name="memberNum"
							placeholder="学号"
							style="width: 58%; float: left; margin-left: 1%;">
					</div>
				</div>
				<div class="form-group">
					<label for="guidanceTeacher">指导教师</label> <input type="text"
						class="form-control" id="guidanceTeacher" name="guidanceTeacher"
						placeholder="指导教师">
				</div>
				<div class="form-group">
					<label for="introduction">作品简介</label> <input type="text"
						class="form-control" id="introduction" name="introduction"
						placeholder="作品简介(字数限制50)" maxlength="50">
				</div>
				<div class="form-group">
					<label for="detail">作品详情</label>
					<textarea class="form-control" id="detail" rows="10" name="detail"
						style="resize: none; height: 30%" placeholder="作品详情"></textarea>
				</div>
				<div>
					<div class="form-group" style="width: 50%; float: left">
						<label for="picture"
							style="float: left; margin-top: 1%; margin-right: 4%;">作品图片</label>
						<input type="file" id="picture" name="img" multiple="multiple" />
					</div>
					<div class="form-group" style="width: 50%; float: left">
						<label for="exampleInputFile"
							style="float: left; margin-top: 1%; margin-right: 4%;">作品附件</label>
						<input type="file" name="accessory" id="exampleInputFile">
					</div>
				</div>
				<div class="form-group">
					<label for="finishTime">作品结束时间</label> <input type="date"
						class="form-control" id="finishTime" name="finishTime"
						placeholder="作品结束时间">
				</div>
				<div class="form-group" style="margin-top: 8%">
					<input class="btn btn-primary" type="button" value="上传"
						onclick="submitButton()" style="margin-left: 20%"> <a
						href=”#” onClick=”javascript:history.back(-1)”><button
							class="btn btn-primary pull-right" style="margin-right: 20%">取消</button>
					</a>
				</div>
			</div>
		</form>
	</div>
	<div class="footer"></div>
</body>
</html>
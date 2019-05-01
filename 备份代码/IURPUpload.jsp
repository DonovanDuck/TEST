<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title></title>
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
		var member = "";
		$("input[name='member']").each(function(i) {
			member = member + $(this).val() + ",";
		});
		$("#memberContent").val(member);
		$("#formContent").submit();
	}
</script>
<script type="text/javascript">
	$(function() {
		$("#addMemberButton").click(function() {
			var mode = "<li style='padding: 0%; margin-bottom: 1%;width: 80%;'><input type='text' class='form-control' id='member' name='member' placeholder='项目成员'style='width: 100%;'></li>"		
			$("#ulContent").append(mode);
		});
	})
</script>
</head>
<body class="body">
	<form id="formContent"
		action="${pageContext.request.contextPath}/achievement/publishIURP"
		method="post" enctype="multipart/form-data">
		<div class="col-md-12 IURP panel panel-default"
			style="min-height: 400px; margin-top: 2%; padding: 1%; display: block">
			<div class="form-group text-center" style="margin-bottom: 30px">
				<h2>产学研成果上传</h2>
			</div>
			<div class="form-group">
				<label for="name">成果名称</label> <input type="text"
					class="form-control" id="name" name="name" placeholder="成果名称">
			</div>
			<div class="form-group">
				<label for="compere">项目负责人</label> <input type="text"
					class="form-control" id="compere" name="compere"
					placeholder="项目负责人">
			</div>
			<div class="form-group">
				<label for="member">项目成员</label> <br>
				<ul class="col-md-12" style="padding: 0; list-style: none"
					id="ulContent">
					<li id="liContent"
						style="padding: 0%; margin-bottom: 1%; float: left; width: 80%;"><input
						type="text" class="form-control" id="member" name="member"
						placeholder="项目成员" style="width: 100%;"></li>
					<li class="text-center"
						style="padding: 0%; margin-bottom: 1%; float: left" id="liButton">
						<button type="button" class="btn btn-primary btn-primary"
							id="addMemberButton">添加新成员</button>
					</li>
				</ul>
				<input type="text" style="display: none" id="memberContent"
					name="memberContent"> <br>
			</div>
			<div class="form-group">
				<label for="introduction">项目简介</label> <input type="text"
					class="form-control" id="introduction" name="introduction"
					placeholder="项目简介(字数限制50)" maxlength="50" >
			</div>
			<div class="form-group">
				<label for="detail">项目详情</label> <input type="text"
					class="form-control" id="detail" name="detail" placeholder="项目详情">
			</div>
			<div class="form-group">
				<label for="price">成果售价</label> <input type="number"
					class="form-control" id="price" name="price" placeholder="成果售价/元">
			</div>
			<div class="form-group">
				<label for="cooperator">合作单位</label> <input type="text"
					class="form-control" id="cooperator" name="cooperator"
					placeholder="合作单位">
			</div>
			<div class="form-group">
				<label for="startTime">项目开始时间</label> <input type="date"
					class="form-control" id="startTime" name="startTime"
					placeholder="项目开始时间">
			</div>
			<div class="form-group">
				<label for="endTime">项目结束时间</label> <input type="date"
					class="form-control" id="endTime" name="endTime"
					placeholder="项目结束时间">
			</div>
			<div class="form-group">
				<label for="isShare">是否分享</label> <select class="form-control"
					id="isShare" name="isShare">
					<option value="是">是</option>
					<option value="否">否</option>
				</select>
			</div>
			<div class="form-group">
				<label for="picture">成果图片</label> <input type="file" id="picture"
					name="img" multiple="multiple" />
			</div>
			<div class="form-group">
				<label for="exampleInputFile">成果附件</label> <input type="file"
					name="accessory" id="exampleInputFile">
			</div>
			<div class="form-group"  style="margin-top:8%">
				<input class="btn btn-primary" type="button" value="上传"
					onclick="submitButton()" style="margin-left:20%"> <a href=”#”
					onClick=”javascript:history.back(-1)”><button
						class="btn btn-primary pull-right" style="margin-right:20%">取消</button> </a>
			</div>
		</div>
	</form>
</body>
</html>
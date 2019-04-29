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
<title>发布成果页</title>
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
			var mode = "<li class='col-md-10' style='padding: 0%; margin-bottom: 1%'><input type='text' class='form-control' id='member' name='member' placeholder='项目成员'style='width: 100%;'></li>"		
			$("#ulContent").append(mode);
		});
	})
	/**删除DIV*/
	/* 	function removeLi(element) {
	 if (window.confirm("是否确认要删除?")) {
	 var node = element.parentNode.previousSibling;
	 var node2 = element.parentNode;
	 node.remove();
	 node2.remove();
	 }
	 }; */
</script>
</head>
<body class="body">
	<div class="main">
		<div class="top">
			<jsp:include page="/jsp/top.jsp" flush="true" />
		</div>
		<div class="content">
			<div class="col-md-12 topColumn" style="padding: 0%">
				<div class="input-group col-md-4">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">类别</button>
					</span> <select class="form-control" id="selectCategory"
						name="selectCategory">
						<option label="课程拓展" value="课程拓展" />
						<option label="大学生创新创业" value="大学生创新创业" />
						<option label="大学生竞赛" value="大学生竞赛" />
						<option label="毕业设计" value="毕业设计" />
						<option label="产学研" value="产学研" />
					</select>
				</div>
			</div>
			<form id="formContent"
				action="${pageContext.request.contextPath}/achievement/publishIURP"
				method="post" enctype="multipart/form-data">
				<div class="col-md-12 IURP panel panel-default"
					style="min-height: 400px; margin-top: 2%; padding: 1%">
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
						<!-- 提供复制的模板 此代码不可删除-->
						<ul class="col-md-12" style="padding: 0; list-style: none"
							id="ulContent">
							<li class="col-md-10" id="liContent"
								style="padding: 0%; margin-bottom: 1%"><input type="text"
								class="form-control" id="member" name="member"
								placeholder="项目成员" style="width: 100%;"></li>
							<li class="col-md-2 text-center"
								style="padding: 0%; margin-bottom: 1%" id="liButton">
								<button type="button" class="btn btn-primary btn-primary"
									id="addMemberButton">添加新成员</button>
							</li>
						</ul>
						<input type="text" style="display: none" id="memberContent" name="memberContent">
						<br> <br>
					</div>
					<div class="form-group">
						<label for="introduction">项目简介</label> <input type="text"
							class="form-control" id="introduction" name="introduction"
							placeholder="项目简介">
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
					<div class="form-group">
						<input class="btn btn-default" type="button" value="上传"
							onclick="submitButton()"> <a href=”#”
							onClick=”javascript:history.back(-1)”><button
								class="btn btn-default pull-right">取消</button> </a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="footer"></div>
</body>
</html>
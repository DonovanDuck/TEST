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
		$("#contentForm").submit();
}
</script>
<script>
	    function chan(i) {
		var objUrl = getObjectURL(i.files[0]);
		if (objUrl) {
			$("#photos").attr("src", objUrl);
		}
	};
	function getObjectURL(file) {
		var url = null;
		if (window.createObjectURL != undefined) {
			url = window.createObjectURL(file);
		} else if (window.URL != undefined) {
			url = window.URL.createObjectURL(file);
		} else if (window.webkitURL != undefined) {
			url = window.webkitURL.createObjectURL(file);
		}
		return url;
	} 
</script>
</head>
<body class="body">
	<div class="main">
		<div class="top">
			<jsp:include page="/jsp/top.jsp" flush="true" />
		</div>
		<form
			action="${pageContext.request.contextPath}/achievement/publishAchievement"
			method="post" enctype="multipart/form-data" id="contentForm">
			<div class="content">
				<div class="col-md-12 topColumn">
					<div class="input-group col-md-3">
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
				<div class="col-md-12 bottomColumn" style="min-height: 400px">
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">成果名称： </span> <input
							type="text" class="form-control" placeholder="成果名称" id="name"
							name="name" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">项目图片： </span>
						<ul class="phoneUl"
							style="list-style: none; margin: 0px; padding: 0px">
							<label for="faceImg" style="cursor: pointer; margin: 0px">
								<li><input type="file" id="faceImg" style="display: none;"
									onchange="chan(this)" name="faceImg" value=" "></li>
								<li><img id="photos" class="img-thumbnail"
									src="${pageContext.request.contextPath}/images/add.png"
									width="50%" height="50%" /></li>
							</label>
						</ul>
					</div>
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">团队名称： </span> <input
							type="text" class="form-control" placeholder="团队名称" id="teamName"
							name="teamName" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">团队成员： </span><input
							type="text" class="form-control" placeholder="成员"
							id="teamMemberOne" name="teamMemberOne"> <input
							type="text" class="form-control" placeholder="成员"
							id="teamMemberTwo" name="teamMemberTwo"> <input
							type="text" class="form-control" placeholder="成员"
							id="teamMemberThree" name="teamMemberThree"> <input
							type="text" class="form-control" placeholder="成员"
							id="teamMemberFour" name="teamMemberFour">
					</div>
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">项目描述： </span> <input
							type="text" class="form-control" placeholder="项目描述" id="detail"
							name="detail" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">项目附件： </span> <input
							name="upFile" type="file" id="upFile" multiple="multiple">
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3">
							<button type="button" class="btn btn-primary"
								onclick="submitButton()">发布</button>
							<button type="reset" class="btn btn-primary"
								onclick="history.go(-1)" style="margin-left: 47%">取消</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="footer"></div>
</body>
</html>
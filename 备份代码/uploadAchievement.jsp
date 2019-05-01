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
	$(function() {
		$("#selectCategory").change(function() {
			var selected = $(this).children('option:selected').val();
			switch (selected) {
			case "产学研":
				$("#IURP").click();
				break;
			case "大学生竞赛":
				$("#AOCSC").click();
				break;
			case "毕业设计":
				$("#GDFCS").click();
				break;
			case "课程拓展":
				$("#CourseExpand").click();
				break;
			case "大学生创新创业":
				$("#SIAE").click();
				break;
			default:
				break;
			}
		});
	})

	// document.domain = "caibaojian.com";
	function setIframeHeight(iframe) {
		if (iframe) {
			var iframeWin = iframe.contentWindow
					|| iframe.contentDocument.parentWindow;
			if (iframeWin.document.body) {
				iframe.height = iframeWin.document.documentElement.scrollHeight
						|| iframeWin.document.body.scrollHeight;
			}
		}
	};
	window.onload = function() {
		setIframeHeight(document.getElementById('iframeContent'));
	};
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
				<div style="display: none">
					<a target="iframeContent"
						href="${pageContext.request.contextPath}/achievement/toAOCSCUpload"><Button
							id="AOCSC"></Button></a> <a target="iframeContent"
						href="${pageContext.request.contextPath}/achievement/toIURPUpload"><Button
							id="IURP"></Button></a> <a target="iframeContent"
						href="${pageContext.request.contextPath}/achievement/toGDFCSUpload"><Button
							id="GDFCS"></Button></a> <a target="iframeContent"
						href="${pageContext.request.contextPath}/achievement/toSIAEUpload"><Button
							id="SIAE"></Button></a> <a target="iframeContent"
						href="${pageContext.request.contextPath}/achievement/toCourseExpandUpload"><Button
							id="CourseExpand"></Button></a>
				</div>
			</div>
			<iframe id="iframeContent" name="iframeContent"
				style="width: 100%; min-height: 1000px" ;height:
				auto;
                frameborder="no" border="0" scrolling="no"
				src="${pageContext.request.contextPath}/achievement/toCourseExpandUpload"
				onload="setIframeHeight(this)"></iframe>
		</div>
	</div>
	<div class="footer"></div>
</body>
</html>
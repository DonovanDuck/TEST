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
<!-- <script type="text/javascript">
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
		var iframe = document.getElementById('iframeContent');
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
		//重复执行某个方法,动态刷新高度 
		var t1 = window.setInterval(setIframeHeight, 500);
		var t2 = window.setInterval("setIframeHeight()", 500);
		window.clearInterval(t1);
	};
</script> -->
<script type="text/javascript">
	$(function() {
		/* 		$("ul li").on("click", function() {
		 $("ul li").removeClass("active");
		 $(this).addClass("active");
		 }); */
		var height = document.body.clientHeight;
		 $("#content").height(height);
		$("#categoryButton").click();
	});

	function selectCategory() {
		$("#categoryButton").click();
	}
</script>
</head>
<body class="body">
	<div class="main">
		<div class="top">
			<jsp:include page="/jsp/top.jsp" flush="true" />
		</div>
		<div class="content" id="content">
			<%-- 	<div class="col-md-12 topColumn" style="padding: 0%">
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
					<a  
						href="${pageContext.request.contextPath}/achievement/toAOCSCUpload"><Button
							id="AOCSC"></Button></a> <a  
						href="${pageContext.request.contextPath}/achievement/toIURPUpload"><Button
							id="IURP"></Button></a> <a  
						href="${pageContext.request.contextPath}/achievement/toGDFCSUpload"><Button
							id="GDFCS"></Button></a> <a  
						href="${pageContext.request.contextPath}/achievement/toSIAEUpload"><Button
							id="SIAE"></Button></a> <a  
						href="${pageContext.request.contextPath}/achievement/toCourseExpandUpload"><Button
							id="CourseExpand"></Button></a>
				</div>
			</div> --%>
			<%-- 	<ul class="nav nav-tabs nav-justified" style="margin-top: 5%">
				<li role="presentation" class="active"><a
					 
					href="${pageContext.request.contextPath}/achievement/toCourseExpandUpload">课程拓展</a></li>
				<li role="presentation"><a  
					href="${pageContext.request.contextPath}/achievement/toSIAEUpload">大学生创新创业</a></li>
				<li role="presentation"><a  
					href="${pageContext.request.contextPath}/achievement/toAOCSCUpload">大学生竞赛</a></li>
				<li role="presentation"><a  
					href="${pageContext.request.contextPath}/achievement/toGDFCSUpload">毕业设计</a></li>
				<li role="presentation"><a  
					href="${pageContext.request.contextPath}/achievement/toIURPUpload">产学研</a></li>
			</ul> --%>
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target=".bs-example-modal-sm" id="categoryButton"
				style="display: none"></button>
			<h3 class="text-center" style="margin: 0px; margin-bottom: 1%;margin-top:1%">上传作品</h3>
			<button type="button" class="btn btn-primary"
				onclick="selectCategory()" data-dismiss="modal"
				style="margin-left: 43%;margin-top:4%">作品类别选择</button>
			<div class="modal fade bs-example-modal-sm" tabindex="-1"
				role="dialog" aria-labelledby="mySmallModalLabel">
				<div class="modal-dialog modal-lg" style="margin-top: 15%"
					role="document">
					<div class="modal-content" style="padding: 28px">
						<h3 class="text-center" style="margin: 0px; margin-bottom: 1%">选择上传成果类别</h3>
						<div class="btn-group btn-group-justified" role="group"
							aria-label="...">
							<div class="btn-group" role="group">
								<a  
									href="${pageContext.request.contextPath}/achievement/toCourseExpandUpload"><button
										type="button" class="btn btn-default">课程拓展</button></a>
							</div>
							<div class="btn-group" role="group">
								<a  
									href="${pageContext.request.contextPath}/achievement/toSIAEUpload"><button
										type="button" class="btn btn-default">大学生创新创业</button></a>
							</div>
							<div class="btn-group" role="group">
								<a  
									href="${pageContext.request.contextPath}/achievement/toAOCSCUpload"><button
										type="button" class="btn btn-default">大学生竞赛</button></a>
							</div>
							<div class="btn-group" role="group">
								<a  
									href="${pageContext.request.contextPath}/achievement/toGDFCSUpload"><button
										type="button" class="btn btn-default">毕业设计</button></a>
							</div>
							<div class="btn-group" role="group">
								<a  
									href="${pageContext.request.contextPath}/achievement/toIURPUpload"><button
										type="button" class="btn btn-default">产学研</button></a>
							</div>
						</div>
						<div class="modal-footer"
							style="padding: 0px; padding-right: 6%; padding-top: 2%">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">确认</button>
						</div>

						<%-- 						<ul class="nav nav-tabs nav-justified" style="margin-top: 5%">
							<li role="presentation" class="active"><a
								 
								href="${pageContext.request.contextPath}/achievement/toCourseExpandUpload">课程拓展</a></li>
							<li role="presentation"><a  
								href="${pageContext.request.contextPath}/achievement/toSIAEUpload">大学生创新创业</a></li>
							<li role="presentation"><a  
								href="${pageContext.request.contextPath}/achievement/toAOCSCUpload">大学生竞赛</a></li>
							<li role="presentation"><a  
								href="${pageContext.request.contextPath}/achievement/toGDFCSUpload">毕业设计</a></li>
							<li role="presentation"><a  
								href="${pageContext.request.contextPath}/achievement/toIURPUpload">产学研</a></li>
						</ul> --%>
					</div>
				</div>
			</div>



			<%-- <div class="form-group">
				<iframe id="iframeContent" name="iframeContent" style="width: 100%;"
					;height: auto;
                frameborder="no" border="0"
					scrolling="no"
					src="${pageContext.request.contextPath}/achievement/toCourseExpandUpload"
					onload="setIframeHeight(this)"></iframe>

				<iframe id="iframeContent" name="iframeContent" style="width: 100%;"
					height: auto;
                frameborder="no" border="0"
					scrolling="no" onload="setIframeHeight(this)"></iframe>
			</div> --%>
		</div>
	</div>
	<div class="footer"></div>
	<script type="text/javascript">
		$(function() {
			$(".Modal").modal({
				backdrop : 'static',
				keyboard : false
			});
		});
	</script>
</body>
</html>
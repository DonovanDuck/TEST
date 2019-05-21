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
<html lang="en">
<head>
<meta charset="UTF-8">
<title>资源管理</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/managerResourceList.css"
	type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link
	href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/zh-cn.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/bootstrap.min.js"></script>
<!-- <script type="text/javascript">
	$('#exampleModal').on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget)
		var recipient = button.data('whatever')
		var modal = $(this)
		modal.find('.modal-title').text('New message to ' + recipient)
		modal.find('.modal-body input').val(recipient)
	})
</script>
<script type="text/javascript">
	function buttonClick(id) {
		//模拟点击按钮，在父页面显示模态框，调用函数在iframe
		//path为访问数据的路径
		$("#modelContent").click();
		var path = "${pageContext.request.contextPath}/teacher/toModalResource/"
				+ id;
		//为form的actionPath 赋值
		var actionPath = "${pageContext.request.contextPath}/teacher/toUpdateResource/"
				+ id;
		$("#commit").attr('action', actionPath);
		$.ajax({
			async : false,
			cache : false,
			url : path,
			type : "POST",
			dataType : "json",
			error : function() {
				alert("请求数据失败");
			},
			success : function(result) {
				var arr = eval(result);
				for (var i = 0; i < arr.length; i++) {
					$('#resourceName').val(" ");
					$('#resourceDetail').val(" ");
					$('#resourceName').val(arr[i].resourceName);
					$('#resourceDetail').val(arr[i].resourceDetail);
				}
			}
		});
	}
</script> -->
<script language="javascript">
	window.onload = function() {
		setTimeIframe();
	}
	function refresh(id) {
		// 刷新页面
		window.location.reload();
	}
	function setTimeIframe() {
		var timeIframe = setTimeout(GetIframeStatus, 10);
	}
	function GetIframeStatus() {
		var iframe = document.getElementById("mainIframe");
		var iframeWindow = iframe.contentWindow;
		//内容是否加载完
		if (iframeWindow.document.readyState == "complete") {
			var iframeWidth, iframeHeight;
			//获取Iframe的内容实际宽度
			iframeWidth = iframeWindow.document.documentElement.scrollWidth;
			//获取Iframe的内容实际高度
			iframeHeight = iframeWindow.document.documentElement.scrollHeight;
			//设置Iframe的宽度
			iframe.width = iframeWidth;
			//设置Iframe的高度
			iframe.height = iframeHeight;
		} else {
			timeIframe = setTimeout(GetIframeStatus, 10);
		}
	}
</script>
</head>
<body class="body" style="overflow-x: hidden;">
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
	<div class="main">
		<div class="main-top">
			<div class="btn-group" role="group" aria-label="...">
				<a
					href="${pageContext.request.contextPath}/teacher/toResourceCategory/1"
					target="mainIframe">
					<button type="button" class="btn btn-default">教案库</button>
				</a> <a
					href="${pageContext.request.contextPath}/teacher/toResourceCategory/2"
					target="mainIframe">
					<button type="button" class="btn btn-default">教学资源库</button>
				</a><a
					href="${pageContext.request.contextPath}/teacher/toResourceCategory/3"
					target="mainIframe">
					<button type="button" class="btn btn-default">多媒体资源</button>
				</a><a
					href="${pageContext.request.contextPath}/teacher/toResourceCategory/4"
					target="mainIframe">
					<button type="button" class="btn btn-default">作业库</button>
				</a> <a
					href="${pageContext.request.contextPath}/teacher/toResourceCategory/5"
					target="mainIframe">
					<button type="button" class="btn btn-default">实验库</button>
				</a> <a
					href="${pageContext.request.contextPath}/teacher/toResourceCategory/6"
					target="mainIframe">
					<button type="button" class="btn btn-default">课程设计库</button>
				</a><a
					href="${pageContext.request.contextPath}/teacher/toResourceCategory/7"
					target="mainIframe">
					<button type="button" class="btn btn-default">全部</button>
				</a>
			</div>
		</div>
		<div class="content">
			<iframe id="mainIframe" name="mainIframe"
				style="width: 100%; margin-top: 1%" frameborder="no" border="0"
				scrolling="no"
				src="${pageContext.request.contextPath}/teacher/toResourceCategory/1?courseId=${course.courseId }"></iframe>
		</div>
	</div>
	<jsp:include page="/jsp/footer.jsp" flush="true" />
	<!-- <!-- 	模态框   开始  (抛弃的更新资源方法)
	<div class="modal" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">修改资源</h4>
				</div>
				<div class="modal-body">
					<form id="commit" name="commit" action="" method="post">
						<div class="form-group">
							<label for="resourceName" class="control-label">资源名:</label> <input
								type="text" class="form-control" id="resourceName"
								name="resourceName">
						</div>
						<div class="form-group">
							<label for="resourceDetail" class="control-label">资源详情:</label>
							<textarea class="form-control" id="resourceDetail"
								name="resourceDetail"></textarea>
						</div>
						<div class="modal-footer">
							<button class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">提交</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	模态框   结束 -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>资源管理</title>
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
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/bootstrap.min.js"></script>
<script type="text/javascript">
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
</script>
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
<body class="body">
	<button type="button" id="modelContent" name="modelContent"
		class="btn btn-primary" style="display: none" data-toggle="modal"
		data-target="#exampleModal" data-whatever="@mdo"></button>
	<div class="header">
		<div class="logo-box">
			<img src="${pageContext.request.contextPath}/images/head.png"
				border="0">
			<button
				style="width: 7%; height: 5%; position: absolute; right: 4%; top: 2%;">
				<h4>个人信息</h4>
			</button>
		</div>
	</div>
	<div class="main">
		<div class="main-top">
			<div class="btn-group" role="group" aria-label="...">
				<c:forEach items="${resourceCategories }" var="resourceCategory">
					<a
						href="${pageContext.request.contextPath}/teacher/toResource/${resourceCategory.resourceTypeId }"
						target="mainIframe">
						<button type="button" class="btn btn-default">${resourceCategory.resourceType }</button>
					</a>
				</c:forEach>
			</div>
		</div>
		<div class="content">
			<iframe id="mainIframe" name="mainIframe"
				style="width: 100%; margin-top: 1%" frameborder="no" border="0"
				scrolling="no"
				src="${pageContext.request.contextPath}/teacher/toResource/${resourceCategories[0].resourceTypeId }"></iframe>
		</div>
	</div>
	<div class="footer">
		<div class="logo-box">
			<img src="${pageContext.request.contextPath}/images/bottom.png"
				width="100%" height="100%" border="0">
		</div>
	</div>

	<!-- 模态框   开始-->
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
								type="text" class="form-control" id="resourceName" name="resourceName">
						</div>
						<div class="form-group">
							<label for="resourceDetail" class="control-label">资源详情:</label>
							<textarea class="form-control" id="resourceDetail" name="resourceDetail"></textarea>
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
	<!-- 模态框   结束-->
</body>
</html>
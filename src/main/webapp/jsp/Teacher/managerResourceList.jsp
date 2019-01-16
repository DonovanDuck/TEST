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
		var button = $(event.relatedTarget) // Button that triggered the modal
		var recipient = button.data('whatever') // Extract info from data-* attributes
		// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		var modal = $(this)
		modal.find('.modal-title').text('New message to ' + recipient)
		modal.find('.modal-body input').val(recipient)
	})
</script>
<script language="javascript">
	window.onload = function() {
		setTimeIframe();
	} 
	function refresh(id)
	{
	// 刷新页面
	   window.location.reload();
	}
	function setTimeIframe(){
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
				style="width: 100%;margin-top: 1%" frameborder="no"
				border="0" scrolling="no"
				src="${pageContext.request.contextPath}/teacher/toResource/${resourceCategories[0].resourceTypeId }"></iframe>
		</div>
	</div>
	<div class="footer">
		<div class="logo-box">
			<img src="${pageContext.request.contextPath}/images/bottom.png"
				width="100%" height="100%" border="0">
		</div>
	</div>
	
	
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">New message</h4>
				</div>
				<div class="modal-body">
					<form id="commit" name="commit"
						action="${pageContext.request.contextPath}/admin/AddCategory"
						method="post">
						<div class="form-group">
							<label for="recipient-name" class="control-label">Recipient:</label>
							<input type="text" class="form-control" id="recipient-name">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">Message:</label>
							<textarea class="form-control" id="message-text"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Send message</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
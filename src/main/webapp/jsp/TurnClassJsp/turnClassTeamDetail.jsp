<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title>${course. courseName}</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/course3.css">
<script
	src="${pageContext.request.contextPath}/js/backstagemanager/jquery-3.2.1.js"></script>
<script
	src="${pageContext.request.contextPath}/js/backstagemanager/bootstrap.js"></script>
<script type="text/javascript">
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
<script type="text/javascript">
	function doSomething(category) {
		$("#design").removeClass("active");
		$("#end").removeClass("active");
		$("#prepare").removeClass("active");
		$("#feedback").removeClass("active");
		$("#edit").removeClass("active");
		$("#" + category).removeClass("active");
		$("#" + category).addClass("active");
	}
	function attention() {
		//alert('${course.courseId}');
		$
				.ajax({
					async : false,
					cache : false,
					url : "${pageContext.request.contextPath}/teacher/ajaxAttentionCourse",
					data : {
						'courseId' : '${course.courseId}'
					},
					type : "POST",
					dataType : "text",
					success : function(result) {
						alert(eval(result));
						if (eval(result) == "关注成功！") {
							$("#attention").html("已关注");
						} else {
							$("#attention").html("关注");
						}
					}
				});
	}
</script>
</head>
<body>
	<main> <jsp:include page="/jsp/top.jsp" flush="true" />
	<div class="main_t">
		<div class="container-fluid">
			<c:if test="${ attention != 2 }">
				<button type="button" class="btn btn-default" id="attention"
					onclick="attention()">关注</button>
			</c:if>
			<c:if test="${ attention == 2 }">
				<button type="button" class="btn btn-default" id="attention"
					onclick="attention()">已关注</button>
			</c:if>
			<h1>${course. courseName}</h1>
			<c:if test="${course.fine != null && course.fine != '' }">
				<div
					style="color: red; position: relative; left: 10%; height: 50px; float: left;">
					<span>${course.fine }</span>
				</div>
			</c:if>
			<p>类别：${course.courseName}系&nbsp;&nbsp;&nbsp;
				参与人数：${course.courseStudentNum }
				&nbsp;&nbsp;&nbsp;创课时间：${course.publishTime }</p>
		</div>
	</div>
	<div style="width: 82%; margin-left: 9%; margin-top: 1%;">
		<div class="col-md-12" id="taskDetail" name="taskDetail"
			style="background-color: white; padding: 0px">
			<div class="topTitle col-md-12" style="background-color: yellow;">
				<h3 class="pull-left">${task.taskTitle}</h3>
				<p class="pull-right" style="margin-top: 2%">
					小组: ${taskTeam.leaderName }
					<c:forEach items="${taskTeam.listStu }" var="i" varStatus="status">
					${i.studentName}&nbsp&nbsp&nbsp
					</c:forEach>
				</p>
			</div>
			<div class="detailContent col-md-12">${task.taskDetail }</div>
			<div class="fileContent col-md-12" style="margin-top: 1%">
				<h5>几个附件</h5>
				<div>
					<input type="file" id="file_excel" name="file_excel"
						style="float: left"> <input type="file" id="file_excel"
						name="file_excel" style="float: left">
				</div>
			</div>
			<p class="pull-right" style="margin-right: 6%">
				发布时间：
				<fmt:formatDate value="${task.publishTime }" pattern="yyyy年MM月dd日" />
			</p>
		</div>
	</div>
	<div class="col-md-12"
		style="width: 82%; margin-left: 9%; margin-top: 1%; padding: 0px">
		<div class="col-md-12" style="background-color: white;">
			<h3>项目名称：${taskTeam.projectName }</h3>
			<h3>项目名称：${taskTeam.projectIntro }</h3>
		</div>
		<div class="col-md-12" style="padding: 0px">
			<ul class="nav nav-pills nav-justified"
				style="background-color: white;">
				<li role="presentation" id="design" class="active"><a
					target="iframeContent" onclick="doSomething('design')"
					href="${pageContext.request.contextPath}/turnClass/toDesignBeforeClass?taskId=${task.taskId}&teamId=${taskTeam.teamId}">课前设计</a></li>
				<li role="presentation" id="prepare"><a target="iframeContent"
					onclick="doSomething('prepare')"
					href="${pageContext.request.contextPath}/turnClass/toPrepareForCourse?taskId=${task.taskId}&teamId=${taskTeam.teamId}">课堂准备</a></li>
				<li role="presentation" id="feedback"><a target="iframeContent"
					onclick="doSomething('feedback')"
					href="${pageContext.request.contextPath}/turnClass/toCourseFeedback?taskId=${task.taskId}&teamId=${taskTeam.teamId}">课堂反馈</a></li>
				<li role="presentation" id="edit"><a target="iframeContent"
					onclick="doSomething('edit')"
					href="${pageContext.request.contextPath}/turnClass/toCourseAfterEdit?taskId=${task.taskId}&teamId=${taskTeam.teamId}">课后修改</a></li>
				<li role="presentation" id="end"><a target="iframeContent"
					onclick="doSomething('end')"
					href="${pageContext.request.contextPath}/turnClass/toEndAchievement?taskId=${task.taskId}&teamId=${taskTeam.teamId}">最终成果</a></li>
			</ul>
		</div>
		<div class="content" id="content">
			<iframe id="iframeContent" name="iframeContent" width="100%"
				height="100%" style="margin-top: 1%;" frameborder="no" border="0"
				scrolling="no"
				src="${pageContext.request.contextPath}/turnClass/toDesignBeforeClass?taskId=${task.taskId}&teamId=${taskTeam.teamId}"></iframe>
		</div>
	</div>
	<jsp:include page="/jsp/footer.jsp" flush="true" /></main>
</body>
</html>
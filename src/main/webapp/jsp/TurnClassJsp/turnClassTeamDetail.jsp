<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
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
</head>
<body>
	<main>
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
			<p>类别：${category}系&nbsp;&nbsp;&nbsp;
				参与人数：${course.courseStudentNum }
				&nbsp;&nbsp;&nbsp;创课时间：${publishTime }</p>
		</div>
	</div>
	<div style="width: 82%; margin-left: 9%; margin-top: 1%;">
		<div class="col-md-12" id="taskDetail" name="taskDetail"
			style="background-color: white; padding: 0px">
			<div class="topTitle col-md-12" style="background-color: yellow;">
				<h3 class="pull-left">任务名字</h3>
				<p class="pull-right" style="margin-top: 2%">小组:组长1好 组员1好 组员1好
					组员1好 组员1好</p>
			</div>
			<div class="detailContent col-md-12">
				第一步，配置Java环境：进入Oracle官网下载JDK。然后解压压缩包到任何目录。然后修改/etc/profile文件, 增加
				JAVA_HOME=/home/caizhw3/Downloads/jdk1.8.0_191 export
				PATH=$JAVA_HOME/bin:$PATH export
				CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
				第二步，下载Eclipse、Tomcat：分别在官网下载Linux版本即可，下载下来以后直接解压，然后直接点击就可以使用，启动项后缀名为sln。tomcat启动后，打开浏览器输入localhost:8080,出现tomcat标识即说明成功。
				第三步，配置开发环境：打开Eclipse，在上部工具栏选择“window”菜单，单击下方的“Preferences”，寻找Server下方的Runtime
				Environment（运行环境），单击右方的Add按钮，选择已经测试成功可以使用的Tomcat版本，单击Next，设置Tomcat的解压目录，选择完成后选择OK即可。
			</div>
			<div class="fileContent col-md-12" style="margin-top: 1%">
				<h5>几个附件</h5>
				<div>
					<input type="file" id="file_excel" name="file_excel"
						style="float: left"> <input type="file" id="file_excel"
						name="file_excel" style="float: left">
				</div>
			</div>
			<p class="pull-right" style="margin-right: 6%">发布时间：2019 06
				22&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp截止时间：2019
				07 33</p>
		</div>
	</div>
	<div class="col-md-12"
		style="width: 82%; margin-left: 9%; margin-top: 1%; padding: 0px">
		<div class="col-md-12">
			<ul class="nav nav-pills nav-justified"
				style="background-color: white;">
				<li role="presentation" class="active"><a href="#">课前设计</a></li>
				<li role="presentation"><a href="#">课堂准备</a></li>
				<li role="presentation"><a href="#">课堂反馈</a></li>
				<li role="presentation"><a href="#">课后修改</a></li>
				<li role="presentation"><a href="#">最终成果</a></li>
			</ul>
		</div>
		<div class="content" id="content">
			<iframe id="iframeContent" name="iframeContent" width="100%"
				height="100%" style="margin-top: 1%;" frameborder="no" border="0"
				scrolling="no"
				src="${pageContext.request.contextPath}/turnClass/toDesignBeforeClass"></iframe>
		</div>
	</div>
	<jsp:include page="/jsp/footer.jsp" flush="true" /></main>
</body>
</html>
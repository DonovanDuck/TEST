<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title></title>
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
	
<script type="text/javascript"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/own.css" />
	<script type="text/javascript">
	function reinitIframe(){
		var iframe = document.getElementById("mycourse");
				
				 try 
				{ 
				var bHeight = iframe.contentWindow.document.body.scrollHeight; 
				/* 
				var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
				var height = Math.max(bHeight, dHeight); 
				iframe.height = height; */ 
				iframe.height = bHeight; 
			//
				} 
				catch (ex) { } 
	};
	function setIframeHeight() {
		
		var iframe = document.getElementById('mycourse');
		if (iframe) {
			var iframeWin = iframe.contentWindow
					|| iframe.contentDocument.parentWindow;
			if (iframeWin.document.body) {
				iframe.height = iframeWin.document.documentElement.scrollHeight
						|| iframeWin.document.body.scrollHeight;
			}
		}
	};

	</script>
</head>
<body style="margin-left: -21%;">
	<div id="r1">
		<div class="main_b_r_t">
			<div class="word1" id="w1">
				<p>
					<a target="mycourse"
						href="${pageContext.request.contextPath}/teacher/toMyCreateCourse"
						id="p1">我创建的课程</a>
				</p>
			</div>
			<div class="word2" id="w2">
				<p>
					<a target="mycourse"
						href="${pageContext.request.contextPath}/teacher/toMyJoinCourse"
						id="p2">我加入的课程</a>
				</p>
			</div>
			<div class="word2" id="w3">
				<p>
					<a target="mycourse"
						href="${pageContext.request.contextPath}/teacher/toMyInterestCourse"
						id="p3">我关注的课程</a>
				</p>
			</div>
			<div class="word2" id="w4" style="margin-left: -2%">
				<p>
					<a target="_top"
						href="${pageContext.request.contextPath}/teacher/toCreateCourse"
						id="p4">创建课程</a>
				</p>
			</div>
		</div>
		<div class="hr"></div>
		<div class="main_b_r_b">
			<iframe id="mycourse" name="mycourse" width="900px" height="100%"
				style="overflow: hidden;"  frameborder="no" border="0" scrolling="no" "
				src="${pageContext.request.contextPath}/teacher/toMyCreateCourse"></iframe>
		</div>
	</div>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	href="${pageContext.request.contextPath}/css/scaffolding.less">
<link
	href="${pageContext.request.contextPath}/css/achievement/achievementMain.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/course3.css">
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
</head>
<body>


	<style>
.a {
	width: 313px;
	height: 0;
	background-color: #f0f0f0;
	opacity: 0;
	transition: height 0.2s linear, opacity 0.2s linear;
	-webkit-transition: height 0.2s linear, opacity 0.2s linear;
	/* Safari */
	padding-left: 26px;
	padding-top: 18px;
}

.b {
	width: 187px;
	min-height: 77px;
	height: auto;
	position: relative;
}

.b:hover .a {
	height: 100px;
	opacity: 1;
}

.xiangmu-out .rel-img img {
	width: 100%;
	height: 100%;
	overflow: hidden;
	transition: all 0.5s;
}

.xiangmu-out:hover {
	box-shadow: 0 0 15px grey;
	transform: translate(0, -10px);
}

.xiangmu-out .rel-img {
	overflow: hidden;
}
</style>

	<script type="text/javascript">
	function attention(){
		//alert('${course.courseId}');
		 $.ajax({
			async:false,
			cache:false,
			url:"${pageContext.request.contextPath}/teacher/ajaxAttentionCourse",
			data:{'courseId':'${course.courseId}'},
			type:"POST",
			dataType:"text",
			success:function(result) {
				alert(eval(result));
				if(eval(result) == "关注成功！"){
					$("#attention").html("已关注");
				}
				else{
					$("#attention").html("关注");
				}
			}
		}); 
	}
</script>
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
	<jsp:include page="/jsp/footer.jsp" flush="true" />
</body>
</html>
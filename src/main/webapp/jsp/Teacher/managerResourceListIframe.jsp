<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/managerResourceList.css"
	type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
		window.parent.setTimeIframe();
})
</script>
<script type="text/javascript">
function deleteInfo() {
	var id=$("#deleteInfo").val();
	var path = "${pageContext.request.contextPath}/teacher/toDeleteResource/"+id;
	$.ajax({
		async : true,
		cache : false,
		url : path,
		type : "POST",
		dataType:"text",
		error : function() {
			 window.location.reload; 
		},
        success : function(data) {
        }
		}
	);
}
</script>
</head>
<body>
	<c:forEach items="${resource }" var="list">
		<div class="course">
			<div class="imgContent col-md-3">
				<img src="${pageContext.request.contextPath}/images/tu11.jpg" alt="">
			</div>
			<div class="col-md-8" style="height: 100%">
				<div class="resource_name col-md-12" style="height: 20%">
					<label class="col-md-3 text-center">资源名:</label> <label
						class="col-md-9 text-left" style="margin-left: -1%">${list.resourceName }</label>
				</div>
				<div class="resourse_Info" style="height: 80%">
					<div class="col-md-3 text-right">
						<label class="col-md-12 text-center">资源介绍:</label>
					</div>
					<div class="col-md-9 text-left">
						<textarea readonly
							style="width: 100%; height: 100px; border: 0px; outline: none;">${list.resourceDetail }</textarea>
					</div>
				</div>
			</div>
			<div class="col-md-1">
				<button class="btn btn-default" id="deleteInfo" name="deleteInfo" value="${list.resourceId }"
					style="margin-top: 30%" onclick="deleteInfo()">删除</button>
				<a
					href="${pageContext.request.contextPath}/teacher/toUpdateResource/${list.resourceId }">
					<input class="btn btn-default" style="margin-top: 46%"
					type="submit" value="修改">
				</a>
			</div>
		</div>
	</c:forEach>
</body>
</html>
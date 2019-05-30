<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-table.min.css">
		<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap-table.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/js/JSONToExcelConvertor.js" type="text/javascript" charset="utf-8"></script>
		
		<script type="text/javascript">

				function changeHeight(element) {
					
					var attenceAll = $(".studentNoAttence"+element.id).css("display");
					if(attenceAll=="none"){
						$(".studentNoAttence"+element.id).css("display","block");
					}else if(attenceAll=="block"){
						$(".studentNoAttence"+element.id).css("display","none");
					}
					
				};
		
		</script>
	</head>
	<body style="background-color: #F1F3F4;">
			<div style="width: 100%; height: 50px; margin: 0 auto; background-color: #fff;">
				<div style="width: 20px; height: 50px; background: #015293;float: left;"></div>
				<span style="line-height: 55px;font-size: 18px;margin-left: 20px">成绩分析</span>
				<button type="button" class="btn btn-primary" style="float: right;margin-top: 10px;margin-right: 20px;">导出总成绩表</button>
			</div>
			<!-- ************************第一次考情************************************ -->
			<c:forEach items="${attendanceList }" var="attendance">
				<div class="attenceContent" style="margin-top: 10px;">
					<div style="width: 100%;height: 50px;background-color: #fff;line-height: 47PX;">
						<span style="font-size: 18px;font-weight: bold;margin-right: 30px;margin-left: 30PX;">第${attendance.index }次考勤</span>
						<span  style="font-size: 12px;margin-right: 30px;">考勤时间:${attendance.attendanceTime }</span>
						<c:if test="${attenceStudentMap[attendance.attendanceId] }">
						</c:if>
							<span style="font-size: 12px;margin-right: 10px;">本次考情状态：
							<c:if test="${attenceStudentMap[attendance.attendanceId] }">
							<span style="color: #5cb85c">已签到</span>
							</c:if>
							<c:if test="${leaveStudentMap[attendance.attendanceId] }">
							<span style="color: #d58512">请假</span>
							</c:if>
							<c:if test="${truancyStudentMap[attendance.attendanceId] }">
							<span style="color: #ac2925">旷课</span>
							</c:if>
							</span>
					</div>
				</div>
			</c:forEach>
		<!-- ************************第一次考情************************************ -->
		
	</body>
</html>

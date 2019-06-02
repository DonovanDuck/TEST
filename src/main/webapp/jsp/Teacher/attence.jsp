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
				<span style="line-height: 55px;font-size: 18px;margin-left: 20px;font-weight: bold;">考勤分析</span>
				<button type="button" class="btn btn-primary" style="float: right;margin-top: 10px;margin-right: 20px;">导出总成绩表</button>
			</div>
			<!-- ************************第一次考情************************************ -->
			<c:forEach items="${attendanceList }" var="attendance">
			<div class="attenceContent" style="margin-top: 10px;">
				<div style="width: 100%;height: 50px;background-color: #fff;line-height: 47PX;">
					<span style="font-size: 18px;font-weight: bold;margin-right: 10px;margin-left: 30PX;">第${attendance.index }次考勤</span>
					<span  style="font-size: 12px;margin-right: 10px;">考勤时间:${attendance.attendanceTime }</span>
					<span style="font-size: 12px;margin-right: 10px;">已签到人数/总人数:${attendance.attendanceNum }/${attendance.totalNum }</span>
					<span style="font-size: 12px;margin-right: 10px;">请假:${attendance.leaveNum }人</span>
					<span style="font-size: 12px;margin-right: 10px;">旷课；${attendance.truancyNum }人</span>
					<span  style="font-size: 12px;">
						<button id="${attendance.index }" class="btn btn-default" type="submit" onclick="changeHeight(this)">详情</button>
						
					</span>
				</div>
				<div class="studentNoAttence${attendance.index }" style="height: 100%;width: 100%;background-color: #fff;overflow: hidden;display: none;" >
					<div class="leave" >
						<span style="font-size: 18px;font-weight: bold;width: 50px;height: 20px;margin: 20px 20px 20px 30px;">请假情况</span>
						<div style="width: 100%;">
						<c:forEach items="${leaveStudentMap[attendance.attendanceId] }" var="student">
							<div style="float: left;width: 25%;height: 80px;">
								<div style="width: 80%;height: 60px;margin: 0 auto;">
									<img data-src="holder.js/140x140" class="img-circle" alt="140x140" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgdmlld0JveD0iMCAwIDE0MCAxNDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzE0MHgxNDAKQ3JlYXRlZCB3aXRoIEhvbGRlci5qcyAyLjYuMC4KTGVhcm4gbW9yZSBhdCBodHRwOi8vaG9sZGVyanMuY29tCihjKSAyMDEyLTIwMTUgSXZhbiBNYWxvcGluc2t5IC0gaHR0cDovL2ltc2t5LmNvCi0tPjxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PCFbQ0RBVEFbI2hvbGRlcl8xNmFmOGMzNTg1ZSB0ZXh0IHsgZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQgfSBdXT48L3N0eWxlPjwvZGVmcz48ZyBpZD0iaG9sZGVyXzE2YWY4YzM1ODVlIj48cmVjdCB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjQ0LjA2MjUiIHk9Ijc0LjM1OTM3NSI+MTQweDE0MDwvdGV4dD48L2c+PC9nPjwvc3ZnPg==" 
									data-holder-rendered="true" style="width: 60px; height: 60px;float: left;">
									<div style="float: left; padding-top: 11px;padding-left: 20px;" >
										<div style="font-weight: bold;font-size: 18px;">${student.studentName }</div>
										<div style="font-size: 12px;">${student.studentId }</div>
									</div>
								</div>
							</div>
						</c:forEach>
						</div>
					</div><!-- leverend -->
					<div class="div1 clearfloat" style="clear: both;">	</div>
							<hr >
					<div class="truancy" >
						<span style="font-size: 18px;font-weight: bold;width: 50px;height: 20px;margin: 20px 20px 20px 30px;">旷课情况</span>
						<div style="width: 100%;">
						<c:forEach items="${truancyStudentMap[attendance.attendanceId] }" var="student">
							<div style="float: left;width: 25%;height: 80px;">
								<div style="width: 80%;height: 60px;margin: 0 auto;">
									<img data-src="holder.js/140x140" class="img-circle" alt="140x140" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgdmlld0JveD0iMCAwIDE0MCAxNDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzE0MHgxNDAKQ3JlYXRlZCB3aXRoIEhvbGRlci5qcyAyLjYuMC4KTGVhcm4gbW9yZSBhdCBodHRwOi8vaG9sZGVyanMuY29tCihjKSAyMDEyLTIwMTUgSXZhbiBNYWxvcGluc2t5IC0gaHR0cDovL2ltc2t5LmNvCi0tPjxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PCFbQ0RBVEFbI2hvbGRlcl8xNmFmOGMzNTg1ZSB0ZXh0IHsgZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQgfSBdXT48L3N0eWxlPjwvZGVmcz48ZyBpZD0iaG9sZGVyXzE2YWY4YzM1ODVlIj48cmVjdCB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjQ0LjA2MjUiIHk9Ijc0LjM1OTM3NSI+MTQweDE0MDwvdGV4dD48L2c+PC9nPjwvc3ZnPg==" 
									data-holder-rendered="true" style="width: 60px; height: 60px;float: left;">
									<div style="float: left; padding-top: 11px;padding-left: 20px;" >
										<div style="font-weight: bold;font-size: 18px;">${student.studentName }</div>
										<div style="font-size: 12px;">${student.studentId }</div>
									</div>
								</div>
							</div>
						</c:forEach>
						</div>
					</div><!-- 旷课结束 -->
					<div class="div1 clearfloat" style="clear: both;">	</div>
					<hr >
			</div><!-- 详情div结束 -->
		</div>
		</c:forEach>
		<!-- ************************第一次考情************************************ -->
		
	</body>
</html>

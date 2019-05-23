<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/teacherwork.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
		<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body style="background-color: #f8f8f8;">
			<jsp:include page="/jsp/top.jsp" flush="true"/>
		<div class="worktitle">
			<div style="width: 10px;height: 10px;margin-top: 20px;margin-left: 20px;background-color: blue;float: left;"></div>
			<h4 style="float: left;line-height: 170%;margin-left: 20px;font-weight: bold;">${task.taskTitle }</h4>
		</div>
		<div class="workdiv">
			<div class="workcontent">
				<div style="height: 70px;">
					<div style="float: left;"><h4  style="font-weight: bold;">任务要求</h4></div>
					<!-- <div style="float: right;"><input class="btn btn-default" type="button" value="编辑"></div>  -->
				</div>
				
				<div style="text-align:left ;  padding-left: 36px;">
					<span style="word-wrap:break-word; word-break:break-all; overflow: hidden; font-size: 16px">${task.taskDetail }</span>
				</div>
				<hr >
				<div style="height: 35px;">
					<div style="float: left;font-weight: bold;"><h4 style="font-weight: bold;">附件</h4></div>
				</div>
				<div style="height: 75px;padding-left: 36px;">
					<div class="accessorylist">
						<c:forEach items="${task.accessoryList }" var="accessory"  varStatus="status">
							<a href="${pageContext.request.contextPath}/teacher/resourceDownload?fileName=${accessory.accessoryName }&id=${task.taskId }">
								<button class="btn btn-default" type="submit" style="border-radius: 20px;float: left;" >${accessory.accessoryName }</button>
							</a>
						</c:forEach>
					</div>
				</div>
				<div class="timestaus" style="float: left;height: 50px;margin-top: -10px;">
					<span style="font-size: 10px">发布时间：${fn:substring(task.publishTime,0,10)}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;截止时间：${fn:substring(taskEndTime,0,10)}</span>
				</div>
			</div>
			
		</div>
		<div class="publishdiv">
			<div class="publishcontent">
				<div class="publishstaus">
					<button  class="published btn btn-default"    onclick="published()">已提交</button> <button class="unpublish btn btn-default"   href="" onclick="unpublished()">未提交</button>
				</div>
				<hr >
				<div id="publishedlist" style="display: block;"  class="publishedlist" >
				<c:forEach items="${studentUpedList }"  var="student1">
					
						<div class="studentinfo">
							<img src="${pageContext.request.contextPath}/img/facedownload.jpg" alt="头像" class="img-circle" style="float: left;width: 100px;height: 100px;">
							<div class="" style="float: left;margin: 10px 30px;width: 20%;">
								<div class="classnum"> <h4>${student1.studentId }</h4> </div>
								<div class="studentname"> <h3>${student1.studentName }</h3> </div>
							</div>
							<div style="width: 30%;height: 100px;margin: 0 auto;line-height: 620%;float: left;">
								<c:if test="${empty studentTograde[student1.studentId] }"><span style="font-size: 18px">尚未评分</span></c:if>
								<c:if test="${not empty studentTograde[student1.studentId] }">
								<span style="font-size: 18px">获得分数：</span><span style="font-size: 18px;color: red;font-weight: bold;">${studentTograde[student1.studentId] }</span>
								</c:if>
								
							</div>
							<c:if test="${ empty studentTograde[student1.studentId]  }">
								<div style="width: 150px;height: 100px;line-height: 620%;float: left;">
									<a style="font-size: 20px;" href="${pageContext.request.contextPath}/teacher/toCommentWork?studentId=${student1.studentId }&taskId=${task.taskId}">查看作业</a>
								</div>
							</c:if>
							<c:if test="${not empty studentTograde[student1.studentId]  }">
								<div style="width: 150px;height: 100px;line-height: 620%;float: left;">
									<a style="font-size: 20px;" href="${pageContext.request.contextPath}/teacher/toCommentWork?studentId=${student1.studentId }&taskId=${task.taskId}">已批阅</a>
								</div>
							</c:if>
						</div>
						
						<hr>
					
				</c:forEach>
				</div>
				<div id="unpublishedlist"  style="display: none;" class="unpublishedlist" >
				<c:forEach items="${studentNotUpList }" var="student2">
					
						<div class="studentinfo">
							<img src="${pageContext.request.contextPath}/img/下载.jpg" alt="" class="img-circle" style="float: left;width: 100px;height: 100px;">
							<div class="" style="float: left;margin: 10px 30px;width: 30%;">
								<div class="classnum"> <h4>${student2.studentId }</h4> </div>
								<div class="studentname"> <h3>${student2.studentName }</h3> </div>
							</div>
							<div style="width: 30%;height: 100px;margin: 0 auto;line-height: 620%;float: left;">
							</div>
							<div style="width: 150px;height: 100px;line-height: 620%;float: left;">
								<a style="font-size: 20px;" href="">提醒提交</a>
							</div>
						</div>
						<hr>
					
				</c:forEach>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			// $(document).ready(function(){
			// 	$("#publishedlist").css('display','none'); 
			// 	$("#publishedlist").css('display','none'); 
			// 	
			// });
			// $(function(){     
			// 	$(".published").click(function(){
			// 		$('#publishedlist').show(); 
			// 		$('.published').css('color','blue'); 
			// 		$('#unpublishedlist').hide(); 
			// 		$('.unpublish').css('color','#000'); 
			// 	});
			// 	$(".unpublish").click(function(){
			// 		$('#publishedlist').hide(); 
			// 		$('.published').css('color','#000'); 
			// 		$('#unpublishedlist').show(); 
			// 		var show =$('#publishedlist').css('display'); 
			// 		alert(show);
			// 		$('.unpublish').css('color','blue'); 
			// 	});
			// })
			function published(){
				$('#publishedlist').show();
				$('#unpublishedlist').hide();
			}
			function unpublished(){
				$('#publishedlist').hide();
				$('#unpublishedlist').show();
			}
		</script>
		<div class="goback" style="height: 30px;width: 60px;position: fixed;bottom: 170px;right: 70px;">
			<a target="_top" href="${pageContext.request.contextPath}/teacher/toClassDetail?virtualClassNum=${virtualClassNum }&virtualClassName=${virtualClassName }">
				<span class="glyphicon glyphicon-send" aria-hidden="true"></span>
				<span class="glyphicon-class">返回作业列表页</span>
			</a>
		</div>
	</body>
</html>

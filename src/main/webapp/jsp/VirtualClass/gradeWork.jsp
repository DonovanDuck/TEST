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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/studentwork.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
		<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			function clearNoNum(obj){
        obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符
        obj.value = obj.value.replace(/^\./g,"");  //验证第一个字符是数字而不是.
        obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的.
        obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
 
    }
		</script>
	</head>
	<body style="background-color: #f8f8f8;" >
	<jsp:include page="/jsp/top.jsp" flush="true"/>
		<div id="header">
		</div>
		<div style="width: 1200px;padding-top: 10px;margin: 0 auto; margin-bottom: 10px;">
		<div style="width: 100%;height: 100px;background-color: #fff;margin-bottom: 10px;text-align:left;padding-left: 20px;padding-top: 20px">
				<div style="margin-bottom: 10px"><span style="font-size: 28px;font-weight: bold;">${courseName }</span></div>
				<div><span style="font-size: 18px;">${virtualClassName } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;授课教师：${teacherClassName }</span></div>
		</div>
		<div class="worktitle">
			<div style="width: 10px;height: 10px;margin-top: 20px;margin-left: 20px;background-color: blue;float: left;"></div>
			<h4 style="float: left;line-height: 170%;margin-left: 20px;font-weight: bold;">${task.taskTitle }</h4>
		</div>
		<div class="workdiv">
			<div class="workcontent">
				<div style="height: 70px;">
					<div style="float: left;"><h4 style="font-weight: bold;">任务要求</h4></div>
				</div>
				
				<div style="text-align:left ;    padding-left: 36px;">
					<span  style="word-wrap:break-word; word-break:break-all; overflow: hidden;font-size: 16px ">${task.taskDetail }</span>
				</div>
				<hr >
				<div style="height: 35px;">
					<div style="float: left;font-weight: bold;"><h4 style="font-weight: bold;">附件</h4></div>
				</div>
				
				<div style="height: 75px;padding-left: 36px;">
					<div class="accessorylist">
						<c:forEach items="${task.accessoryList }" var="accessory"  varStatus="status">
							<a href="${pageContext.request.contextPath}/teacher/resourceDownload?fileName=${accessory.accessoryName }&id=${task.taskId }&type=teacherPub">
								<button class="btn btn-default" type="submit" style="border-radius: 20px;float: left;" >${accessory.accessoryName }</button>
							</a>
						</c:forEach>
					</div>
				</div>
				<div class="timestaus" style="float: left;height: 50px;margin-top: -10px;">
					<span style="font-size: 10px">发布时间：${fn:substring(task.publishTime,0,16)}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;截止时间：${fn:substring(taskEndTime,0,16)}</span>
				</div>
			</div>
			
		</div>
		<div class="workdiv" style="margin-top: 10px;">
			<div class="workcontent">
					<div style="height: 30px;">
						<div style="float: left;"><h4 style="font-weight: bold;">作业详情</h4></div>
						
					</div>
					<hr >
					<div style="text-align:left ;" style="display: block;" class="edited">
						<span id="editedtext" style="word-wrap:break-word; word-break:break-all; overflow: hidden; ">${upTaskDetail }</span>
					</div>
					
					
					<div style="height: 90px;margin-top: 20px;">
						<div class="accessorylist">
							<c:forEach items="${accessoriesName }" var="accessoriesName"  varStatus="status">
								<a href="${pageContext.request.contextPath}/teacher/resourceDownload?fileName=${accessoriesName }&id=${task.taskId }&type=studentUp">
									<button class="btn btn-default" type="button" style="border-radius: 20px;float: left;" >${accessoriesName }</button>
								</a>
							</c:forEach>
						</div>
					</div>
					<div class="timestaus" style="float: left;height: 50px;margin-top: -10px;">
						<h8>提交人：${student1.studentName }</h8>
					</div>
				</form>
			</div>
		</div>

		<div class="workdiv" style="margin-top: 10px;">
			<div class="workcontent">
				<form action="${pageContext.request.contextPath}/teacher/commendWork?studentId=${student1.studentId }&taskId=${task.taskId}" method="post">
					<div style="height: 30px;">
						<div style="float: left;"><h4 style="font-weight: bold;">评分详情</h4></div>
						
						<!-- <div style="float: right;"><input class="btn btn-default" type="button" value="编辑"></div> -->
					</div>
					<hr >
					
					<c:if test="${empty grade }">
						
					
					<div class="tograde" >
						<h5 style="float: left;">作业成绩：</h5>
						
						<!-- <input id="stuentgrade" type="text"onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="2" size="1"  class="form-control" style="float: left;width: 10%;"  placeholder="Jane Doe"/> -->
						
						<input id="grade" name="grade"  style="float: left;width: 15%;" type="text"  name="payMoney[]" onkeyup="clearNoNum(this)" value="0" placeholder="请输入学生分数(纯数字)"  class="form-control" oninput="if(value>10)value=10;if(value<0)value=0">
					</div>
					<div class="torecommend" style="width: 100%;">
						<textarea name="comment"  autofocus="autofocus" placeholder="作业评语"  style="resize:none; width: 100%;height: 150px;margin-top: 20px;" id="TestCode" wrap="logical" ></textarea>
					</div>
					
					<div style="margin-bottom: 50px;">
						<button type="submit" class="btn btn-primary">提交</button>
					</div>
					</c:if>
					<c:if test="${not empty grade }">
							<div style="text-align:left ;">
								<span style="word-wrap:break-word; word-break:break-all; overflow: hidden;font-size: 16px;font-weight: bold; ">评语：</span><span style="font-size: 16px;">${comment }</span>
							</div>
							<hr>
							<div style="text-align:left ;">
								<span style="font-size: 16px;font-weight: bold;">作业成绩：</span> <span style="font-size: 20px;color: red;font-weight: bold; ">${grade }</span>
							</div>
					</c:if>
				</form>

			</div>
			
		</div>
		</div>
		<div style="width: 100%;height: 20px;background-color: #f8f8f8;">
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
				alert("published");
				var published = document.getElementById('publishedlist');
				var unpublished = document.getElementById('unpublishedlist');
				published.style.display="block";
				unpublished.style.display="none";
			};
			function unpublished(){
				alert("unpublished");
				var published = document.getElementById('publishedlist');
				var unpublished = document.getElementById('unpublishedlist');
				published.style.display="none";
				unpublished.style.display="block";
			}
		</script>
		<jsp:include page="/jsp/footer.jsp" flush="true" />
	</body>
</html>

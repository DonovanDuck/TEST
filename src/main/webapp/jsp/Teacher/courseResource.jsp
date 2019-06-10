<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <title>课程资源页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/scaffolding.less">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/course3.css">
    <script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
  
  <style>
  	.xiangmu-out .rel-img img{
    		width: 100%;
    		height: 100%;
    		overflow: hidden;
    		transition:all 0.5s;
    	}
   .xiangmu-out:hover{
    box-shadow: 0 0 15px grey;
    transform: translate(0,-10px);
}

.xiangmu-out .rel-img{
	overflow: hidden;
}
.daohang{
	font-size: 17px;
    border: 0;
    background: #f0f0f0;
}
  </style>
  
  <script language="javascript">
  	function deleteR(obj){
  		//alert($(obj).attr('id'));
  		var id = $(obj).attr('id')
  		if(confirm("确定要删除数据吗？")){
  		 $.ajax({
			async:false,
			cache:false,
			url:"${pageContext.request.contextPath}/teacher/toDeleteResource/"+id,
			data:{},
			type:"POST",
			dataType:"text",
			success:function(result) {
				alert(eval(result));
				if(eval(result) == "删除成功"){
					location.reload(true);
				}
				else{
					alert("删除失败");
				}
			}
		}); 
  	  }
  	}
  
  </script>
  <script>
$(document).ready(function() { 
	var cid = "${category}";
	
	if(cid != null && cid != "null" && cid != ""){
		$("#"+cid).css("background","#015293");
		$("#"+cid).css("color","#fff");
	}
	else{
		$("#allSelect").css("background","#015293");
		$("#allSelect").css("color","#fff");
	} 
	});
	
</script>
</head>
<body>
<jsp:include page="/jsp/top.jsp" flush="true" />
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
		<p>参与人数：${course.courseStudentNum }
			&nbsp;&nbsp;&nbsp;创课时间：${publishTime }</p>
	</div>
</div>
<div class="main_b_t" style="margin-bottom: 70px;margin-left: 103px;">
				<nav>
					<ul style="    margin-top: 25px;margin-left: 30px;">
						<li style="float: left;margin-right: 25px"><a style="font-size: 22px;"
							href="${pageContext.request.contextPath}/teacher/toCourseResource/0"
							><button id="0" class="btn btn-default daohang">全部</button></a></li>
						<li style="float: left;margin-right: 25px"><a style="font-size: 22px;"
							href="${pageContext.request.contextPath}/teacher/toCourseResource/6"
							><button id="6" class="btn btn-default daohang">教案库</button></a></li>
						<li style="float: left;margin-right: 25px"><a style="font-size: 22px;"
							href="${pageContext.request.contextPath}/teacher/toCourseResource/7"
							><button id="7" class="btn btn-default daohang">教学资源库</button></a></li>
						<li style="float: left;margin-right: 25px"><a style="font-size: 22px;"
							href="${pageContext.request.contextPath}/teacher/toCourseResource/5"
							><button id="5" class="btn btn-default daohang">多媒体资源库</button></a>
						 <li style="float: left;margin-right: 25px"><a style="font-size: 22px;"
							href="${pageContext.request.contextPath}/teacher/toCourseResource/8"
							><button id="8" class="btn btn-default daohang">作业库</button></a></li> 
						 <li style="float: left;margin-right: 25px"><a style="font-size: 22px;"
							href="${pageContext.request.contextPath}/teacher/toCourseResource/9"
							><button id="9" class="btn btn-default daohang">实验库</button></a></li>
						<li style="float: left;margin-right: 25px"><a style="font-size: 22px;"
							href="${pageContext.request.contextPath}/teacher/toCourseResource/10"
							><button id="10" class="btn btn-default daohang">课程设计库</button></a></li> 
					</ul>
				</nav>
			</div>
</main>
<div class="main2" style="height: auto;width: auto;min-height: 800px;">
	
	<div style="font-size: 30px;font-weight: 600;margin-left: 140px;margin-top: 20px;">
		<c:if test="${isTeacher == 1 && resourceName !='全部' }">
		<div style="float: right;position: relative;left: -10%;top: -50px;">
			<a href="${pageContext.request.contextPath}/teacher/toPublishResource/${category }/${course.courseId}">
				<button type="button" class="btn btn-primary">发布资源</button>
			</a>
		</div>
		</c:if>
	</div>
	
	<div class="mian2_content" style="height: auto;width: auto;min-height: 170px;margin-left: 140px;">
		<ul style="list-style: none;">
			<c:if test="${resource != null }">
			<c:forEach items="${resource }" var="re" varStatus="status">
			<li style="float: left;height: 170px;width: 350px;margin-top: 49px; margin-right: 20px;">
				<div class="xiangmu-out" style="height: 170px;width: 350px;">
					<%-- <c:if test="${isTeacher == 1 }">
						<div id="${re.resourceId }" style="height: 20px; width: 20px;position: relative;left: 91%;top: 18%; cursor: pointer;" onclick="deleteR(this)">
							<img style="height: 100%;width: 100%" src="${pageContext.request.contextPath}/images/timg.jpg" />
						</div>
					</c:if> --%>
					<div style="height: 127px;width: 350px;background: #fff;padding-top: 23px;border: 1px solid #dadada; border-bottom: 0">
						<ul>
							<li style="text-align: center; font-size: 17px;font-weight: 600;margin-bottom: 7px;">${re.resourceName }</li>
							<li>
								<div style="margin-left: 42px;width: 275px;">知识点：${re.resourceDetail }...</div>
								<div style="margin-left: 12%;">发布人：${re.publisherId }</div>
								<div style="margin-left: 12%;">类型：多媒体资源</div>
							</li>
						</ul>
					</div>
					<div style="height: 70px;width: 350px;background: #f0f0f0;padding-top: 9px;border:1px solid #dadada;border-top: 0">
						<div style="margin-left: 42px;width: 193px;padding-bottom: 8px;float: left;">
							<div style="width: 100%;padding-bottom: 8px;">${time[status.index] }</div>
							<div style="width: 100%;">已下载：${re.watchNum }</div>
						</div>
						<c:if test="${sessionScope.student != null }">
						<div>
							<button type="button" class="btn btn-info" style="margin-top: 9px;">查看资源</button>
						</div>
						</c:if>
						<c:if test="${isTeacher == 1 }">
							<div>
								<a href="${pageContext.request.contextPath}/teacher/toUpdateResource/${re.resourceId }"><button type="button" class="btn btn-info" style="margin-top: 9px;">修改资源</button></a>
							</div>
						</c:if>
					</div>
				</div>
			</li>
			</c:forEach>
			</c:if>
			
			<c:if test="${taskList != null }">
			<c:forEach items="${taskList }" var="task" varStatus="status">
			<li style="float: left;height: 170px;width: 350px;margin-top: 49px; margin-right: 20px;">
				<div class="xiangmu-out" style="height: 170px;width: 350px;">
					<div style="height: 127px;width: 350px;background: #fff;padding-top: 23px;border: 1px solid #dadada; border-bottom: 0">
						<ul>
							<li style="text-align: center; font-size: 17px;font-weight: 600;margin-bottom: 7px;">${task.taskTitle }</li>
							<li>
								<div style="margin-left: 42px;width: 275px;">知识点：${task.taskDetail }...</div>
								<div style="margin-left: 12%;">发布人：${task.publisherId }</div>
								
								<div style="margin-left: 12%;">
								<c:if test="${task.taskType == 'work' }">
									类型：作业资源
								</c:if>
								<c:if test="${task.taskType == 'trial' }">
									类型：实验资源
								</c:if>
								<c:if test="${task.taskType == 'curriculum_design' }">
									类型：课程设计资源
								</c:if>
								</div>
							</li>
						</ul>
					</div>
					<div style="height: 70px;width: 350px;background: #f0f0f0;padding-top: 9px;border:1px solid #dadada;border-top: 0">
						<div style="margin-left: 42px;width: 193px;padding-bottom: 8px;float: left;">
							<div style="width: 100%;padding-bottom: 8px;">${time[status.index] }</div>
							<div style="width: 100%;">已下载：${task.watchNum }</div>
						</div>
						<c:if test="${sessionScope.student != null }">
						<div>
							<button type="button" class="btn btn-info" style="margin-top: 9px;">查看资源</button>
						</div>
						</c:if>
						<c:if test="${isTeacher == 1 }">
							<div>
								<a href="${pageContext.request.contextPath}/teacher/toUpdateTaskResource/${task.taskId }"><button type="button" class="btn btn-info" style="margin-top: 9px;">修改资源</button></a>
							</div>
						</c:if>
					</div>
				</div>
			</li>
			</c:forEach>
			</c:if>
			
			<!-- <li style="float: left;height: 170px;width: 350px;margin-top: 25px; margin-right: 20px;">
				<div style="height: 170px;width: 350px;">
					<div style="height: 100px;width: 350px;background: #fff;padding-top: 23px;border: 1px solid #dadada; border-bottom: 0">
						<ul>
							<li style="text-align: center; font-size: 23px;font-weight: 600;margin-bottom: 7px;">java教案一</li>
							<li>
								<div style="margin-left: 42px;float: left;width: 195px;">知识点：</div>
								<div>发布人：</div>
							</li>
						</ul>
					</div>
					<div style="height: 70px;width: 350px;background: #f0f0f0;padding-top: 22px;border:1px solid #dadada;border-top: 0">
						<div style="margin-left: 42px;float: left;width: 195px;">2019.1.12</div>
								<div>已下载：72</div>
					</div>
				</div>
			</li>
			<li style="float: left;height: 170px;width: 350px;margin-top: 25px; margin-right: 20px;">
				<div style="height: 170px;width: 350px;">
					<div style="height: 100px;width: 350px;background: #fff;padding-top: 23px;border: 1px solid #dadada; border-bottom: 0">
						<ul>
							<li style="text-align: center; font-size: 23px;font-weight: 600;margin-bottom: 7px;">java教案一</li>
							<li>
								<div style="margin-left: 42px;float: left;width: 195px;">知识点：</div>
								<div>发布人：</div>
							</li>
						</ul>
					</div>
					<div style="height: 70px;width: 350px;background: #f0f0f0;padding-top: 22px;border:1px solid #dadada;border-top: 0">
						<div style="margin-left: 42px;float: left;width: 195px;">2019.1.12</div>
								<div>已下载：72</div>
					</div>
				</div>
			</li>
			<li style="float: left;height: 170px;width: 350px;margin-top: 25px; margin-right: 20px;">
				<div style="height: 170px;width: 350px;">
					<div style="height: 100px;width: 350px;background: #fff;padding-top: 23px;border: 1px solid #dadada; border-bottom: 0">
						<ul>
							<li style="text-align: center; font-size: 23px;font-weight: 600;margin-bottom: 7px;">java教案一</li>
							<li>
								<div style="margin-left: 42px;float: left;width: 195px;">知识点：</div>
								<div>发布人：</div>
							</li>
						</ul>
					</div>
					<div style="height: 70px;width: 350px;background: #f0f0f0;padding-top: 22px;border:1px solid #dadada;border-top: 0">
						<div style="margin-left: 42px;float: left;width: 195px;">2019.1.12</div>
								<div>已下载：72</div>
					</div>
				</div>
			</li> -->
			
		</ul>
	</div>
</div>
<jsp:include page="/jsp/footer.jsp" flush="true"/>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN" style="background: #fff;overflow: hidden;">
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/scaffolding.less">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/course3.css">
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
</head>
<style>
	.resourceList{
		-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;
	}
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
</style>
<body>


<main>
 <c:if test="${taskList != null || resource != null }">
<div class="main_b" style="margin-bottom: 27px;">
<div style="position: absolute;
    top: 16px;
    left: 93%;">
					<a target="_blank"  href='${pageContext.request.contextPath}/teacher/toCourseResource/${category}'>更多>></a>
</div>
</c:if>


<c:if test="${taskList != null }">
<ul style="    margin-top: 3%">
<div class="row">
	
	<c:forEach items="${taskList }" var="task" varStatus="status" begin="0" end="0">
	<div  class="col-xs-4 col-md-4 LI0" style="height: auto;">
	<li style="float: left; margin-left: 25px;margin-top: 18px;">
		<div class="resourceList xiangmu-out" style="  height: 151px;width: 300px;padding-left: 28px;padding-top: 12px;
		background: url('${pageContext.request.contextPath}/images/resource_back2.png') no-repeat;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;">
			<div style="font-weight: 400;font-size: 20px;">${task.taskTitle }</div>
			<div>知识点：${task.taskDetail }...</div>
			<div>发布人：${task.publisherId }</div>
			<div>发布时间：${time[status.index] }</div>
			<div>下载次数：${task.watchNum }</div>
		</div>
	</li></div>
	</c:forEach>
	
	
	 
	
	
	<c:forEach items="${taskList }" var="task" varStatus="status" begin="2" end="2">
	<div class="col-xs-4 col-md-4 LI2" style="height: auto;">
	<li class="LI2" style="float: left;margin-left: 25px;margin-top: 18px;">
		<div class="resourceList xiangmu-out" style="  height: 151px;width: 300px;padding-left: 28px;padding-top: 12px;
		background: url('${pageContext.request.contextPath}/images/resource_back4.png') no-repeat;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;">
			<div style="font-weight: 400;font-size: 20px;">${task.taskTitle }</div>
			<div>知识点：${task.taskDetail }...</div>
			<div>发布人：${task.publisherId }</div>
			<div>发布时间：${time[status.index] }</div>
			<div>下载次数：${task.watchNum }</div>
		</div>
	</li></div>
	</c:forEach>
	
	
	<c:forEach items="${taskList }" var="task" varStatus="status" begin="3" end="3">
	<div class="col-xs-4 col-md-4 LI3" style="height: auto;">
	<li style="float: left;margin-left: 25px;margin-top: 18px;">
		<div class="resourceList xiangmu-out" style=" height: 151px;width: 300px;padding-left: 28px;padding-top: 12px;
		background: url('${pageContext.request.contextPath}/images/resource_back1.png') no-repeat;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;">
			<div style="font-weight: 400;font-size: 20px;">${task.taskTitle }</div>
			<div>知识点：${task.taskDetail }...</div>
			<div>发布人：${task.publisherId }</div>
			<div>发布时间：${time[status.index] }</div>
			<div>下载次数：${task.watchNum }</div>
		</div>
	</li></div>
	</c:forEach>
	
	
	<c:forEach items="${taskList }" var="task" varStatus="status" begin="4" end="4">
	<div class="col-xs-4 col-md-4 LI4" style="height: auto;">
	<li style="float: left;margin-left: 25px;margin-top: 18px;">
		<div class="resourceList xiangmu-out" style="  height: 151px;width: 300px;padding-left: 28px;padding-top: 12px;
		background: url('${pageContext.request.contextPath}/images/resource_back5.png') no-repeat;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;">
			<div style="font-weight: 400;font-size: 20px;">${task.taskTitle }</div>
			<div>知识点：${task.taskDetail }...</div>
			<div>发布人：${task.publisherId }</div>
			<div>发布时间：${time[status.index] }</div>
			<div>下载次数：${task.watchNum }</div>
		</div>
	</li></div>
	</c:forEach>
	
	
	<c:forEach items="${taskList }" var="task" varStatus="status" begin="5" end="5">
	<div class="col-xs-4 col-md-4 LI5" style="height: auto;">
	<li style="float: left;margin-left: 25px;margin-top: 18px;">
		<div class="resourceList xiangmu-out" style="  height: 151px;width: 300px;padding-left: 28px;padding-top: 12px;
     	 background: url('${pageContext.request.contextPath}/images/resource_back1.png') no-repeat;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;">
			<div style="font-weight: 400;font-size: 20px;">${task.taskTitle }</div>
			<div>知识点：${task.taskDetail }...</div>
			<div>发布人：${task.publisherId }</div>
			<div>发布时间：${time[status.index] }</div>
			<div>下载次数：${task.watchNum }</div>
		</div>
	</li></div>
	</c:forEach>

	<c:forEach items="${taskList }" var="task" varStatus="status" begin="1" end="1">
	<div class="col-xs-4 col-md-4 LI3" style="height: auto;">
	<li style="float: left;margin-left: 25px;margin-top: 18px;">
		<div class="resourceList xiangmu-out" style=" height: 151px;width: 300px;padding-left: 28px;padding-top: 12px;
		background: url('${pageContext.request.contextPath}/images/resource_back2.png') no-repeat;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;">
			<div style="font-weight: 400;font-size: 20px;">${task.taskTitle }</div>
			<div>知识点：${task.taskDetail }...</div>
			<div>发布人：${task.publisherId }</div>
			<div>发布时间：${time[status.index] }</div>
			<div>下载次数：${task.watchNum }</div>
		</div>
	</li></div>
	</c:forEach>
	
	</div>
	</c:if>
	
	<c:if test="${resource != null }">
	<c:forEach items="${resource }" var="re" varStatus="status" begin="0" end="0">
	<li style="float: left; margin-left: 25px;margin-top: 18px;">
		<div class="resourceList xiangmu-out" style="  height: 151px;width: 300px;padding-left: 28px;padding-top: 12px;
		background: url('${pageContext.request.contextPath}/images/resource_back2.png') no-repeat;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;">
			<div style="font-weight: 400;font-size: 20px;">${re.resourceName }</div>
			<div>知识点：${re.resourceDetail }...</div>
			<div>发布人：${re.publisherId }</div>
			<div>发布时间：${time[status.index] }</div>
			<div>下载次数：${re.watchNum }</div>
		</div>
	</li>
	</c:forEach>
	<c:forEach items="${resource }" var="re" varStatus="status" begin="1" end="1">
	<li style="float: left;margin-left: 25px;margin-top: 18px;">
		<div class="resourceList xiangmu-out" style="  height: 151px;width: 300px;padding-left: 28px;padding-top: 12px;
		background: url('${pageContext.request.contextPath}/images/resource_back3.png') no-repeat;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;">
			<div style="font-weight: 400;font-size: 20px;">${re.resourceName }</div>
			<div>知识点：${re.resourceDetail }...</div>
			<div>发布人：${re.publisherId }</div>
			<div>发布时间：${time[status.index] }</div>
			<div>下载次数：${re.watchNum }</div>
		</div>
	</li>
	</c:forEach>
	<c:forEach items="${resource }" var="re" varStatus="status" begin="2" end="2">
	<li style="float: left;margin-left: 25px;margin-top: 18px;">
		<div class="resourceList xiangmu-out" style="  height: 151px;width: 300px;padding-left: 28px;padding-top: 12px;
		background: url('${pageContext.request.contextPath}/images/resource_back4.png') no-repeat;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;">
			<div style="font-weight: 400;font-size: 20px;">${re.resourceName }</div>
			<div>知识点：${re.resourceDetail }...</div>
			<div>发布人：${re.publisherId }</div>
			<div>发布时间：${time[status.index] }</div>
			<div>下载次数：${re.watchNum }</div>
		</div>
	</li>
	</c:forEach>
	<c:forEach items="${resource }" var="re" varStatus="status" begin="3" end="3">
	<li style="float: left;margin-left: 25px;margin-top: 18px;">
		<div class="resourceList xiangmu-out" style=" height: 151px;width: 300px;padding-left: 28px;padding-top: 12px;
		background: url('${pageContext.request.contextPath}/images/resource_back2.png') no-repeat;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;">
			<div style="font-weight: 400;font-size: 20px;">${re.resourceName }</div>
			<div>知识点：${re.resourceDetail }...</div>
			<div>发布人：${re.publisherId }</div>
			<div>发布时间：${time[status.index] }</div>
			<div>下载次数：${re.watchNum }</div>
		</div>
	</li>
	</c:forEach>
	<c:forEach items="${resource }" var="re" varStatus="status" begin="4" end="4">
	<li style="float: left;margin-left: 25px;margin-top: 18px;">
		<div class="resourceList xiangmu-out" style="  height: 151px;width: 300px;padding-left: 28px;padding-top: 12px;
		background: url('${pageContext.request.contextPath}/images/resource_back5.png') no-repeat;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;">
			<div style="font-weight: 400;font-size: 20px;">${re.resourceName }</div>
			<div>知识点：${re.resourceDetail }...</div>
			<div>发布人：${re.publisherId }</div>
			<div>发布时间：${time[status.index] }</div>
			<div>下载次数：${re.watchNum }</div>
		</div>
	</li>
	</c:forEach>
	<c:forEach items="${resource }" var="re" varStatus="status" begin="5" end="5">
	<li style="float: left;margin-left: 25px;margin-top: 18px;">
		<div class="resourceList xiangmu-out" style="  height: 151px;width: 300px;padding-left: 28px;padding-top: 12px;
     	 background: url('${pageContext.request.contextPath}/images/resource_back1.png') no-repeat;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;">
			<div style="font-weight: 400;font-size: 20px;">${re.resourceName }</div>
			<div>知识点：${re.resourceDetail }...</div>
			<div>发布人：${re.publisherId }</div>
			<div>发布时间：${time[status.index] }</div>
			<div>下载次数：${re.watchNum }</div>
		</div>
	</li>
	</c:forEach>
	</c:if>
</ul>

</div>
<%-- <c:if test="${taskList != null && resource != null }">
<div class="main_b">
<div style="position: absolute;
    top: 16px;
    left: 931px;">
					<a target="_blank" href='${pageContext.request.contextPath}/teacher/toCourseResource/${category}'>更多>></a>
</div>
</c:if>
<c:if test="${taskList == null && resource == null }">
	<div class="main_b">
<div style="    width: 100%;
    height: 100%;
    text-align: center;
    font-size: 92px;
    color: #fff;">
	暂无资源
</div>
</div>
</c:if> --%>
</main>
<footer></footer>
</body>
</html>
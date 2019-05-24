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
    <title>课程三级页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/scaffolding.less">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/course3.css">
    <script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
  
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
  
</head>
<body>
<head>
    <div class="container-fluid">
    <nav>
    <ul class="nav nav-pills">
        <li role="presentation" class="active"><a href="#">首页</a></li>
        <li role="presentation"><a href="#">课程</a></li>
        <li role="presentation"><a href="#">讨论区</a></li>
        <li role="presentation"><a href="#">学生成果</a></li>
        <li role="presentation"><a href="#">产学研项目</a></li>
    </ul>
    </nav>
    </div>
</head>
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
</main>
<div class="main2" style="height: auto;width: auto;min-height: 800px;">
	<div style="font-size: 30px;font-weight: 600;margin-left: 140px;margin-top: 20px;">
		<label style="float: left;margin-right: 76%;">${resourceName }库</label>
		<c:if test="${isTeacher == 1 }">
		<div>
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
			<li style="float: left;height: 170px;width: 350px;margin-top: 25px; margin-right: 20px;">
				<div style="height: 170px;width: 350px;">
					<c:if test="${isTeacher == 1 }">
						<div id="${re.resourceId }" style="height: 20px; width: 20px;position: relative;left: 91%;top: 18%; cursor: pointer;" onclick="deleteR(this)">
							<img style="height: 100%;width: 100%" src="${pageContext.request.contextPath}/images/timg.jpg" />
						</div>
					</c:if>
					<div style="height: 100px;width: 350px;background: #fff;padding-top: 23px;border: 1px solid #dadada; border-bottom: 0">
						<ul>
							<li style="text-align: center; font-size: 23px;font-weight: 600;margin-bottom: 7px;">${re.resourceName }</li>
							<li>
								<div style="margin-left: 42px;float: left;width: 195px;">知识点：${re.resourceDetail }</div>
								<div>发布人：${publisher[status.index] }</div>
							</li>
						</ul>
					</div>
					<div style="height: 70px;width: 350px;background: #f0f0f0;padding-top: 9px;border:1px solid #dadada;border-top: 0">
						<div style="margin-left: 42px;width: 193px;padding-bottom: 8px;float: left;">
							<div style="width: 100%;padding-bottom: 8px;">${time[status.index] }</div>
							<div style="width: 100%;">已下载：${re.useNum }</div>
						</div>
						<c:if test="${sessionScope.student != null }">
						<div>
							<button type="button" class="btn btn-info" style="margin-top: 9px;">我要完成</button>
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
			<li style="float: left;height: 170px;width: 350px;margin-top: 25px; margin-right: 20px;">
				<div style="height: 170px;width: 350px;">
					<div style="height: 100px;width: 350px;background: #fff;padding-top: 23px;border: 1px solid #dadada; border-bottom: 0">
						<ul>
							<li style="text-align: center; font-size: 23px;font-weight: 600;margin-bottom: 7px;">${task.taskTitle }</li>
							<li>
								<div style="margin-left: 42px;float: left;width: 195px;">知识点：${task.taskDetail }</div>
								<div>发布人：${publisher[status.index] }</div>
							</li>
						</ul>
					</div>
					<div style="height: 70px;width: 350px;background: #f0f0f0;padding-top: 9px;border:1px solid #dadada;border-top: 0">
						<div style="margin-left: 42px;width: 193px;padding-bottom: 8px;float: left;">
							<div style="width: 100%;padding-bottom: 8px;">${time[status.index] }</div>
							<div style="width: 100%;">已下载：${task.useNum }</div>
						</div>
						<div>
							<button type="button" class="btn btn-info" style="margin-top: 9px;">我要完成</button>
						</div>
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
<footer></footer>
</body>
</html>
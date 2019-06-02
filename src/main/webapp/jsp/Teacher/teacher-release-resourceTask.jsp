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
<title>发布资源</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/scaffolding.less">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/course3.css">
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/zh-cn.js"></script>
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
<script type="text/javascript">
	function submitButton() {
		var selectType = ${category };//获取选择的类型
		var path;
		if(selectType == "work" || selectType=="trial"){
			path = "${pageContext.request.contextPath}/teacher/publishTask";//任务的请求路径
		}
		else
			path = "${pageContext.request.contextPath}/teacher/publishResource";//资源的请求路径
		
		$("#resourceForm").attr('action',path);    //通过jquery为action属性赋值
        $("#resourceForm").submit(); 
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
		<p>参与人数：${course.courseStudentNum }
			&nbsp;&nbsp;&nbsp;创课时间：${publishTime }</p>
	</div>
</div>

<div class="main_b">
<div style="font-size: 30px;font-weight: 600;margin-left: 140px;margin-top: 20px;margin-bottom: 55px;">
		${resourceName }发布作业资源：
	</div>
	<div style="width: 800px;height: auto;min-height: 500px;margin-left: 22%;">
	<form action="${pageContext.request.contextPath}/teacher/publishTaskResourse" enctype="multipart/form-data" method="post" id="resourceForm">
	<div class="form-group">
    <label for="exampleInputName2" style="float: left;padding-left: 13px;margin-right: 5px;">资源名：</label>
    <input type="text" class="form-control" id="exampleInputName2" name="taskTitle" style="width: 663px;">
		<input type="hidden" name="taskCategory" value="${category } ">
	<input type="hidden" name="courseId" value="${course.courseId }">
  </div>
		<div class="form-group">
					<label for="exampleInputName2">资源介绍：</label>
					<textarea id="taskDetail" name="taskDetail" type="text" placeholder=""
						style="width:700px; height: 200px; float: left; margin-left: 9%;margin-bottom: 31px;" ></textarea>
		</div>
		<div class="form-group">
    <label for="exampleInputName2" style="float: left;margin-right: 5px;">上传附件：</label>
    <input style="margin-top: 6%;" name="file" type="file" multiple="multiple">
  </div>
  <div style="width: auto;height: auto;min-height: 35px;padding-left: 38%;margin-top: 8%;margin-bottom: 8%;">
  	<div style="float: left;margin-right: 131px;">
  		<button type="submit" class="btn btn-info">确认</button>
  	</div>
  	<div>
  		<button type="button" class="btn btn-danger">取消</button>
  	</div>
  </div>
  </form>
	</div>
	
				
</div>
</body>
<script type="text/javascript" charset="utf-8">
	UE.getEditor('taskDetail');
	
</script>
</html>
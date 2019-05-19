<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
<<<<<<< HEAD
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
		发布${resourceName }资源：
	</div>
	<div style="width: 800px;height: auto;min-height: 500px;margin-left: 22%;">
	<form action="${pageContext.request.contextPath}/teacher/publishResource" enctype="multipart/form-data" method="post" id="resourceForm">
	<div class="form-group">
    <label for="exampleInputName2" style="float: left;padding-left: 13px;margin-right: 5px;">资源名：</label>
    <input type="text" class="form-control" id="exampleInputName2" name="resourceName" style="width: 663px;">
    <input type="hidden" name="resourceType" value="${category }">
    <input type="hidden" name="courseId" value="${course.courseId }">
  </div>
		<div class="form-group">
					<label for="exampleInputName2">资源介绍：</label>
					<textarea id="resourceDetail" name="resourceDetail" type="text" placeholder=""
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
	UE.getEditor('resourceDetail');
	
</script>
=======
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>资源发布页面</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/teacher-release-resource.css"
	type="text/css">
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
<script type="text/javascript">
	UE.getEditor('resourceDetail');
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/zh-cn.js"></script>
</head>
<body>
	<jsp:include page="/jsp/top.jsp" flush="true" />
	<div class="main_b">
		<div class="text">
			<form
				action="${pageContext.request.contextPath}/teacher/publishResource"
				enctype="multipart/form-data" method="post">
				<span><strong>名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</strong></span>
				<input type="text" name="resourceName" placeholder="请输入名称："
					style="width: 60%; height: 30px; float: left;">
				<div style="width: 10%; height: 30px; float: left">
					<select id="taskCategory" name="taskCategory">
						<option value="">选择资源类型</option>
						<option value="">教案资源</option>
						<option value="">教学资源资源</option>
						<option value="">作业资源</option>
						<option value="">多媒体资资源</option>
						<option value="">实验资源</option>
						<option value=""
						]>课程设计资源</option>
					</select>
				</div>
				<br> <br> <span><strong>资源介绍：</strong></span> <input
					name="resourceDetail" type="text" placeholder="请输入资源详情："
					style="width: 80%; height: 100px; float: left;"> <br>
				<br> <span style="margin-top: 1%;"><strong>附&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件：</strong></span><input
					style="margin-top: 1%;" name="file" type="file" multiple="multiple">
				<div class="button">
					<button
						style="padding-left: 1%; padding-right: 1%; font-size: 16px; float: right; margin-right: 20%;">上传并发布</button>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/jsp/footer.jsp" flush="true" />
</body>
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
</html>
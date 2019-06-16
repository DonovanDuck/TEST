<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title>查看资源</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/scaffolding.less">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/course3.css">
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/zh-cn.js"></script>
	<script
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>
<head>
<jsp:include page="/jsp/top.jsp" flush="true" />
</head>

<script type="text/javascript">
	function attention() {
		//alert('${course.courseId}');
		$
				.ajax({
					async : false,
					cache : false,
					url : "${pageContext.request.contextPath}/teacher/ajaxAttentionCourse",
					data : {
						'courseId' : '${course.courseId}'
					},
					type : "POST",
					dataType : "text",
					success : function(result) {
						alert(eval(result));
						if (eval(result) == "关注成功！") {
							$("#attention").html("已关注");
						} else {
							$("#attention").html("关注");
						}
					}
				});
	}
</script>
<script type="text/javascript">
	function submitButton() {
		var selectType = $
		{
			category
		}
		;//获取选择的类型
		var path;
		if (selectType == "work" || selectType == "trial") {
			path = "${pageContext.request.contextPath}/teacher/publishTask";//任务的请求路径
		} else
			path = "${pageContext.request.contextPath}/teacher/publishResource";//资源的请求路径

		$("#resourceForm").attr('action', path); //通过jquery为action属性赋值
		$("#resourceForm").submit();
	}
</script>
<script>
	function modifyRe(){
		$("[type=file]").click();
		$("[type=file]").on('change', function( e ){
	        //e.currentTarget.files 是一个数组，如果支持多个文件，则需要遍历
	        var name = e.currentTarget.files[0].name;
	        $(".re_name").html(name);
	    });
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
		<p>类别：${type}系&nbsp;&nbsp;&nbsp;参与人数：${course.courseStudentNum }
			&nbsp;&nbsp;&nbsp;创课时间：${publishTime }</p>
	</div>
</div>

<div class="main_b" style="width: 70%;margin-left: 17%; padding-top: 3%;background: #fff;height: 100%;">
	<!-- <div
		style="font-size: 27px;
    font-weight: 600;
    margin-left: 43%; margin-top: 0px;margin-bottom: 55px;">
		修改资源</div> -->
	<div
		style="width: 800px;height: auto;min-height: 500px;margin-left: 7%;">
		
			<div class="form-group">
				<label for="exampleInputName2"
					style="float: left; padding-left: 13px; margin-right: 5px;">资源名：</label>
				<input type="text" class="form-control" id="exampleInputName2"
					name="taskTitle" style="width: 663px;"
					value="${task.taskTitle }"> <input type="hidden"
					name="taskType" value="${task.taskType }">
					<input type="hidden"
					name="taskId" value="${taskId }">
					 <input
					type="hidden" name="courseId" value="${course.courseId }">
			</div>
			<div class="form-group">
  	<label for="exampleInputName2" style="float: left;padding-left: 2px;margin-right: 0px;">资源类型：</label>
   <c:if test="${task.taskType == 'work' }">
    <input type="text" class="form-control" readonly="true"  style="width: 663px;" value="作业资源">
    </c:if>
     <c:if test="${task.taskType == 'trial' }">
    <input type="text" class="form-control" readonly="true"  style="width: 663px;" value="实验资源">
    </c:if>
     <c:if test="${task.taskType == 'curriculum_design' }">
    <input type="text" class="form-control" readonly="true"  style="width: 663px;" value="课程设计资源">
    </c:if>
  </div>
			<div class="form-group">
				<label for="exampleInputName2">资源介绍：</label>
				<textarea id="taskDetail" name="taskDetail" type="text"
					placeholder=""
					style="width: 700px; height: 200px; float: left; margin-left: 9%; margin-bottom: 31px;"
					value="">${task.taskDetail }</textarea>
			</div>
			
				
					
				 <label for="exampleInputName2"
					style="float: left; margin-right: 5px;">查看附件：</label>
					<div style="height: 96px;width: 274px;float: left;padding: 15px;background: #f0f0f0;border-radius: 11px;">
						<img style="height: 50px; width: 50px;margin-right: 10px;" src="${pageContext.request.contextPath}/images/file.jpg">
						<label class="re_name">${task.taskTitle }</label>
						<form action="${pageContext.request.contextPath}/teacher/resourceDownload2/${acc.accessoryName} /${task.taskId }/teacherPub" method="POST">
						 <button type="submit" class="btn btn-default" style="color: #c9302c;
    position: relative;
    top: 40%;
    left: 75%;
    cursor: pointer;
    border: none;
    background: #f0f0f0;">下载</button>
						 <!-- </a> -->
						 </form>
					</div>
					
			<div
				style=" height: 35px; min-height: 35px; padding-left: 0; margin-top: 62%; margin-bottom: 13%;">
				<div style="float: left; margin-right: 131px;">
					<button type="button" onClick="javascript :history.back(-1);" class="btn btn-info">返回</button>
				</div>
				
			</div>
	</div>


</div>
</body>
<script type="text/javascript" charset="utf-8">
	var ue = UE.getEditor('taskDetail',{

	    initialFrameWidth :661,//设置编辑器宽度

	    initialFrameHeight:200,//设置编辑器高度
	    initialFrameMargin:0,

	    scaleEnabled:true
	    

	 });
</script>
</html>
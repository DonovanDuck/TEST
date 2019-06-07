<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en" style="background-color: white;">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/css/achievement/uploadAchievement.css"
	rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ueditor/zh-cn.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/My97DatePicker/calendar.js"
	charset="utf-8"></script>
<script type="text/javascript">
	function submitButton() {
		var judge = true;//定义判断，如果有空，则不可提交,默认可以提交
		var alertJudge = true;//弹框判断
		 $("#content").find("input[type='text']").each(function(){
                 if($(this).val()==""&&alertJudge==true){
			         alert($(this).attr("placeholder")+"    不可为空")
			         judge = false;  alertJudge = false;
					 }
					 });
		 var detail = $("#detail").text();
		 if(detail==""&&alertJudge==true)
			 {
			 alert("作品详情    不可为空")
	         judge = false;  alertJudge = false;
			 }
		 $("#content").find("input[type='file']").each(function(){
					 if($(this).val()==""&&alertJudge==true){
					 alert($(this).attr("placeholder")+"    不可为空")
					 judge = false;  alertJudge = false;
					 }
					 });
		 $("#content").find("input[type='date']").each(function(){
					 if($(this).val()==""&&alertJudge==true){
					 alert($(this).attr("placeholder")+"    不可为空")
					 judge = false;  alertJudge = false;
					 }
					 });
		 if(judge)
			 {
			 $("#formContent").submit();
			 }
	}
</script>
<script type="text/javascript">
	function readCompereId() {
		var memberNum = $("#memberNum").val();
		$
				.ajax({
					async : false,
					cache : false,
					url : "${pageContext.request.contextPath}/teacher/getStudentNameById/"+memberNum,
					type : "POST",
					dataType : "text",
					success : function(result) {
				$("#compere").val(result)
					},
					error:function(){
					}
				});
	}
</script>
<script type="text/javascript">
	function readGuidance() {
		var guidanceTeacherId = $("#guidanceTeacherId").val();
		$
				.ajax({
					async : false,
					cache : false,
					url : "${pageContext.request.contextPath}/teacher/getTeacherNameById/"+guidanceTeacherId,
					type : "POST",
					dataType : "text",
					success : function(result) {
				$("#guidanceTeacher").val(result)
					},
					error:function(){
					}
				});
	}
</script>
<script type="text/javascript" charset="utf-8">
$(function (){
	var width = $("#name").width();
	var height = $("#name").height();
	$("#finishTime").height(height);
	var ue = UE.getEditor('detail',{
	initialFrameWidth:width,
	initialFrameHeight:180,
	initialFrameMargin:0,
	})
})
</script>
<script type="text/javascript">
	$(function(){
		setIframeHeight();
	});
	function setIframeHeight() {
	    var height = $(".IURP").outerHeight(true)
		if (height) {
			$("#content").height(height);//直接设置元素的高
			}
		}
			window.onload = function() {
			//重复执行某个方法,动态刷新高度 
			var t1 = window.setInterval(setIframeHeight, 500);
			var t2 = window.setInterval("setIframeHeight()", 500);
			window.clearInterval(t1);
		};
</script>
</head>
<body class="body">
	<div class="top">
		<jsp:include page="/jsp/top.jsp" flush="true" />
	</div>
	<div class="content" id="content">
		<h3 class="text-center" style="margin: 0px; margin-bottom: 1%">大学毕业设计作品上传</h3>
		<form id="formContent"
			action="${pageContext.request.contextPath}/achievement/publishGDFCS"
			method="post" enctype="multipart/form-data">
			<div class="col-md-12 IURP panel panel-default"
				style="margin-top: 2%; padding: 3%; display: block">
				<div class="form-group">
					<label for="name">大学毕业设计作品名称</label> <input type="text"
						class="form-control" id="name" name="name" placeholder="作品名称">
				</div>
				<div class="form-group">
					<label for="compere">作品负责人</label>
					<div style="padding: 0px; margin: 0px; width: 100%;">
						<input type="text" class="form-control" id="memberNum"
							onkeyup="this.value=this.value.replace(/[^\d]/g,'') "
							onafterpaste="this.value=this.value.replace(/[^\d]/g,'') "
							name="memberNum" placeholder="学号" oninput="readCompereId()"
							style="width: 50%; float: left;"> <input type="text"
							class="form-control" id="compere" name="compere"
							style="float: left; width: 48%; margin-left: 2%"
							placeholder="作品负责人" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label for="guidanceTeacher">指导教师</label>
					<div style="padding: 0px; margin: 0px; width: 100%;">
						<input type="text" class="form-control" id="guidanceTeacherId"
							name="guidanceTeacherId" placeholder="工号"
							onkeyup="this.value=this.value.replace(/[^\d]/g,'') "
							onafterpaste="this.value=this.value.replace(/[^\d]/g,'') "
							oninput="readGuidance(event)" style="width: 50%; float: left">
						<input type="text" class="form-control" id="guidanceTeacher"
							name="guidanceTeacher"
							style="float: left; width: 48%; margin-left: 2%"
							placeholder="指导教师" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label for="introduction">作品简介</label> <input type="text"
						class="form-control" id="introduction" name="introduction"
						placeholder="作品简介(字数限制50)" maxlength="50">
				</div>
				<div class="form-group">
					<label for="detail">作品详情</label>
					<div style="padding-left: 0px; margin-left: 2%">
						<textarea id="detail" name="detail" type="text" placeholder="作品详情"></textarea>
					</div>
				</div>
					<div class="form-group">
						<label for="picture"
							style="float: left;margin-right: 4%;">作品图片</label>
						<input type="file" id="picture" name="img" multiple="multiple"
							placeholder="作品图片" />
					</div>
					<div class="form-group" style="margin-top:3%;">
						<label for="exampleInputFile"
							style="float: left;margin-right: 4%;">作品附件</label>
						<input type="file" name="accessory" id="exampleInputFile"
							placeholder="作品附件">
					</div>
				<div class="form-group" style="margin-top:3%">
					<label for="finishTime">作品完成时间</label> <input type="text"
						style="height: 30px;" class="Wdate form-control" name="finishTime"
						id="finishTime"
						onclick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d %H:%m:%s'})"
						placeholder="作品完成时间" />
				</div>
				<div class="form-group" style="margin-top: 8%">
					<input class="btn btn-primary" type="button" value="上传"
						onclick="submitButton()" style="margin-left: 20%"> <a
						href=”#” onClick=”javascript:history.back(-1)”><button
							class="btn btn-primary pull-right" style="margin-right: 20%">取消</button>
					</a>
				</div>
			</div>
		</form>
	</div>
	<div class="footer"></div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>courseCreate</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Course/create_lesson.css"
	type="text/css">
<link href="http://www.tit.edu.cn/images/logo.ico" rel="Shortcut Icon">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/Course/common.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link
	href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/bootstrap.min.js"></script>
<!-- 图片预加载 -->
<script>
	//浏览图片
	function chan(i) {
		var objUrl = getObjectURL(i.files[0]);
		if (objUrl) {
			$("#photos").attr("src", objUrl); //这里的id是要显示图片位置的Id
		}
	};
	//建立一個可存取到該file的url
	function getObjectURL(file) {
		var url = null;
		// 下面函数执行的效果是一样的，只是需要针对不同的浏览器执行不同的 js 函数而已
		if (window.createObjectURL != undefined) { // basic
			url = window.createObjectURL(file);
		} else if (window.URL != undefined) { // mozilla(firefox)
			url = window.URL.createObjectURL(file);
		} else if (window.webkitURL != undefined) { // webkit or chrome
			url = window.webkitURL.createObjectURL(file);
		}
		return url;
	} 
</script>
<script type="text/javascript">
	function OnInput() {
		var classNum = $("#inputSelectClass").val();
		$
				.ajax({
					async : false,
					cache : false,
					url : "${pageContext.request.contextPath}/teacher/readRealClassToSelect/"
							+ classNum,
					type : "POST",
					dataType : "json",
					success : function(result) {
						var arr = eval(result);
						$("#classContent").empty();
						for (var i = 0; i < arr.length; i++) {
							$("#classContent")
									.append(
											"<label class='checkbox-inline' id="
													+ arr[i].realClassNum
													+ " style='width: 30%; margin-left: 2%; margin-top: 1%;'><input type='checkbox' name='unSelect' onclick='checkboxOnclick(this)'  value='"
													+ arr[i].realClassNum
													+ "'>"
													+ arr[i].realClassNum
													+ "</label>");
						}
					}
				});
	}
</script>

<script type="text/javascript">
	function checkboxOnclick(checkbox) {
		if (checkbox.checked == true) {
			var value = checkbox.value;
			$("input[name = 'select']").each(function() {
				if ($(this).val() == value)
					$("#" + value).remove();
			});
			$("input[name = 'unSelect']").each(function() {
				if ($(this).val() == value)
					$("#" + value).remove();
			});
			$("#classSelectedContent")
					.append(
							"<label class='checkbox-inline' id="
									+ value
									+ "  style='width: 30%; margin-left: 2%; margin-top: 1%;'><input name='select' type='checkbox' checked onclick='checkboxBackclick(this)'  value='"
									+ value + "'>" + value + "</label>");
		}
	}
</script>

<script type="text/javascript">
	function checkboxBackclick(checkbox) {
		if (checkbox.checked == false) {
			var value = checkbox.value;
			$("input[name = 'select']").each(function() {
				if ($(this).val() == value)
					$("#" + value).remove();
			});
			$("input[name = 'unSelect']").each(function() {
				if ($(this).val() == value)
					$("#" + value).remove();
			});
			$("#classContent")
					.append(
							"<label class='checkbox-inline' id="
									+ value
									+ "  style='width: 30%; margin-left: 2%; margin-top: 1%;'><input  name='unSelect' onclick='checkboxOnclick(this)'  type='checkbox' value='"
									+ value + "'>" + value + "</label>");
		}
	}
</script>

<script type="text/javascript">
function submitForm(){
	var selectClass = "";
	$("input[name = 'select']").each(function() {
		selectClass = selectClass + $(this).val()+",";
	});
	$("#selectClass").val(selectClass);
	$("#formContent").submit();
}
</script>
</head>
<body style="background-color: #E8EBF0;">
	<jsp:include page="/jsp/top.jsp" flush="true" />
	<div class="content"
		style="width: 50%; margin-left: 25%; background-color: white; padding: 1%">
		<h3 class="text-center" style="margin-top: 1%; margin-bottom: 4%">创建班级</h3>
		<form class="form-horizontal" id="formContent"
			action="${pageContext.request.contextPath}/teacher/createVirtualClass"
			method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label"
					style="padding-right: 0px">课程名称：</label>
				<div class="col-sm-10" style="padding-left: 0px; width: 75%">
					<select class="form-control" id="courseId" name="courseId">
						<c:forEach items="${courseList }" var="courses">
							<option value="${courses.courseId }">${courses.courseName }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label"
					style="padding-right: 0px">开设学期：</label>
				<div class="col-sm-10" style="padding-left: 0px; width: 75%">
					<select class="form-control" id="selectTerm" name="selectTerm">
						<c:forEach items="${listTerm }" var="listTerm">
							<option value="${listTerm.termId }">${listTerm.startYear }-${listTerm.endYear }&nbsp&nbsp${listTerm.term}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label"
					style="padding-right: 0px">班级名称：</label>
				<div class="col-sm-10" style="padding-left: 0px; width: 75%">
					<input class="form-control" id="className" name="className"
						placeholder="班级名称">
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label"
					style="padding-right: 0px">添加图片：</label>
				<ul class="col-sm-10 phoneUl"
					style="padding-left: 0px; width: 75%; margin: 0px">
					<label for="faceImg" style="cursor: pointer">
						<li><input type="file" id="faceImg" style="display: none;"
							onchange="chan(this)" name="faceImg"></li>
						<li><img id="photos"
							src="${pageContext.request.contextPath}/images/add.png"
							class="img-thumbnail" width="100" height="100" /></li>
					</label>
				</ul>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label"
					style="padding-right: 0px">开设班级：</label>
				<div class="col-sm-10" style="padding-left: 0px; width: 75%">
					<div class="panel panel-default classSelectedContent"
						id="classSelectedContent"
						style="margin-top: 1%; height: 40px; overflow-y: auto"></div>
					<input class="form-control" oninput="OnInput (event)"
						id="inputSelectClass" name="inputSelectClass" placeholder="筛选班级"
						style="margin-top: 1%">
					<div class="panel panel-default classContent" id="classContent"
						style="margin-top: 1%; height: 80px; overflow-y: auto">
						<c:forEach items="${listRealClass }" var="item">
							<label class="checkbox-inline" id="${item.realClassNum }"
								style="width: 30%; margin-left: 2%; margin-top: 1%;"> <input
								name="unSelect" type="checkbox" value="${item.realClassNum }"
								onclick="checkboxOnclick(this)"> ${item.realClassNum }
							</label>
						</c:forEach>
					</div>
				</div>
				<input name="selectClass" id="selectClass" style="display: none" />
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-md-6">
					<button onclick="submitForm()" class="btn btn-primary">提交</button>
				</div>
				<div class="col-md-2">
					<a href="${pageContext.request.contextPath}/teacher/toTeacherPage"><button
							class="btn btn-primary pull-right" style="margin-right: 20%">取消</button>
					</a>
				</div>
			</div>
		</form>
	</div>
	<div class="footer">
		<div class="container">
			<!--row End-->
			<div class="foot-bq">
				<!-- 版权内容请在本组件"内容配置-版权"处填写 -->
				<div
					style="width: 900px; text-align: center; float: left; position: relative; left: 135px; top: 8px;">
					<p>地址：山西省太原市尖草坪区新兰路31号&nbsp;&nbsp;&nbsp;&nbsp;邮编：030008</p>
					<p>
						版权所有：太原工业学院&nbsp;&nbsp;&nbsp;&nbsp;ICP备案号：晋ICP备14003279号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;晋公网安备号：140110430070001
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
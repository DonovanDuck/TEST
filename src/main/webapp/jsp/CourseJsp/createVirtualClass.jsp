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
<script type="text/javascript">
	$(function() {
		$("#realClassContent")
				.bind(
						"input propertychange",
						function() {
							var path = "${pageContext.request.contextPath}/teacher/readRealClassToSelect/"
									+ $("#realClassContent").val();
							$("#realClassUI").empty();
							$
									.ajax({
										async : true,
										cache : false,
										url : path,
										dataType : "json",
										success : function(result) {
											$("#realClassUI").empty();
											var arr = eval(result);
											for (var i = 0; i < arr.length; i++) {
												var msg = "<li id='realClass' name='realClass'><input type='checkbox' value='"
														+ arr[i].realClassNum
														+ "' name='realClassCheckbox' id='realClassCheckbox' class='realClassCheckbox'/>"
														+ arr[i].realClassNum
														+ "</li>";
												$("#realClassUI")
														.append($(msg));
											}
										},
										error : function() {
										}
									});
						});
	})
</script>
<script type="text/javascript">
	$(document)
			.on(
					"click",
					".realClassCheckbox",
					function() {
						$(".friend").css("display", "block");
						if (this.checked) {
							var content = this.value;
							var msg = "<li id='selectedRealClass' name='selectedRealClass' style='float: left; margin-left: 2%;'><input type='checkbox' value='"
				+ content
				+ "' name='realClassCheckboxSelected' checked='true' id='realClassCheckboxSelected' class='realClassCheckboxSelected'/>"
									+ content + "</li>";
							$("#selectedRealClassUI").append($(msg));
						}
					})
</script>
<!-- 图片预加载 -->
<script>
	    function chan(i) {
		var objUrl = getObjectURL(i.files[0]);
		if (objUrl) {
			$("#photos").attr("src", objUrl);
		}
	};
	function getObjectURL(file) {
		var url = null;
		if (window.createObjectURL != undefined) {
			url = window.createObjectURL(file);
		} else if (window.URL != undefined) {
			url = window.URL.createObjectURL(file);
		} else if (window.webkitURL != undefined) {
			url = window.webkitURL.createObjectURL(file);
		}
		return url;
	} 
</script>
<script type="text/javascript">
	$(
			function() {
				$("#submitButton")
						.click(
								function() {
									var check = ",";
									$(
											"input[name='realClassCheckboxSelected']:checked")
											.each(
													function(i) {
														check = check
																+ $(this).val()
																+ ",";
													});
									$("#realClassToController").val(check);
								});
			})
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/jsp/top.jsp" flush="true" />
		<div class="main_top" style="text-align: center;">
			<h2 style="margin: 0; padding: 0;">创建新班级</h2>
		</div>
		<div class="main">
			<form
				action="${pageContext.request.contextPath}/teacher/createVirtualClass"
				method="post" enctype="multipart/form-data">
				<div class="input1">
					<span>课程名称:</span> <select placeholder=""
						style="width: 40%; height: 30px; float: left; margin-left: 4%;"
						id="courseName" name="courseName">
						<c:forEach items="${courseList }" var="courses">
							<option value="${courses.courseName }">${courses.courseName }</option>
						</c:forEach>
					</select>
				</div>
				<div class="input1">
					<span>班级名称：</span> <input name="className" id="className"
						style="width: 40%; height: 30px; float: left; margin-left: 2%;"
						placeholder="班级名称">
				</div>
				<div class="input1">
					<span>开课学期：</span> <select name="selectTerm" id="selectTerm"
						style="width: 40%; height: 30px; float: left; margin-left: 2%;">
						<c:forEach items="${listTerm }" var="listTerm">
							<option value="${listTerm.termId }">${listTerm.startYear }/${listTerm.endYear }&nbsp学年&nbsp&nbsp${listTerm.term}</option>
						</c:forEach>
					</select>
				</div>
				<div class="input1">
					<ul class="phoneUl">
						<span style="float: left;">课程图片：</span>
						<label for="faceImg" style="cursor: pointer; margin-left: 2%;">
							<li><input type="file" id="faceImg" style="display: none;"
								onchange="chan(this)" name="faceImg" value=" "></li>
							<li><img id="photos"
								src="${pageContext.request.contextPath}/images/add.png"
								width="50%" height="50%" style="border: 1px solid black" /></li>
						</label>
					</ul>
				</div>
				<div class="teacher-friend">
					<span>开设班级：</span>
					<div class="friend">
						<p>已选班级：</p>
						<ul id="selectedRealClassUI" name="selectedRealClassUI"
							class="selectedRealClassUI">
						</ul>
						<input value="" name='realClassToController'
							id='realClassToController' class="realClassToController"
							style="dispaly: none" />
					</div>
					<div class="">
						<input name="realClassContent" id="realClassContent"
							class="realClassContent" placeholder="筛选班级"
							style="border: 1px solid #969696">
						<div class="selectClassContent">
							<ul id="realClassUI" name="realClassUI">
								<c:forEach items="${listRealClass }" var="item">
									<li id="realClass" name=“realClass”><input type="checkbox"
										value="${item.realClassNum }" name="realClassCheckbox"
										id="realClassCheckbox" class="realClassCheckbox" />${item.realClassNum }</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<hr>
				<div class="button">
					<div class="create">
						<span style="color: white;">
							<button type="onSubmit" id="submitButton" class="btn btn-primary">确定</button>
						</span>
					</div>
					<div class="delete">
						<a href="#"><button type="button" id="pull"
								class="btn btn-primary">取消</button> </a>
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
	</div>
</body>

</html>
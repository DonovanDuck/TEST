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
<<<<<<< HEAD
	href="${pageContext.request.contextPath}/css/create_lesson.css"
	type="text/css">
<link href="http://www.tit.edu.cn/images/logo.ico" rel="Shortcut Icon">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css">
=======
	href="${pageContext.request.contextPath}/css/Course/create_lesson.css"
	type="text/css">
<link href="http://www.tit.edu.cn/images/logo.ico" rel="Shortcut Icon">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/Course/common.css">
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76

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
<<<<<<< HEAD
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
	$(function() {
		$("#submitButton").click(function() {
			var check = ",";
			$("input[name='realClassCheckboxSelected']:checked").each(function(i) {
				check = check + $(this).val() + ",";
			});
			$("#realClassToController").val(check);
=======
<script>
	$('#exampleModal').on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget) // Button that triggered the modal
		var recipient = button.data('whatever') // Extract info from data-* attributes
		// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		var modal = $(this)
		modal.find('.modal-title').text('New message to ' + recipient)
		modal.find('.modal-body input').val(recipient)
	})
</script>
<script type="text/javascript">
	$(function() {
		$("#pull")
				.click(

						function() {
							$
									.ajax({
										async : false,
										cache : false,
										url : "${pageContext.request.contextPath}/teacher/ajaxGetRealClass",
										type : "POST",
										dataType : "json",
										success : function(result) {
											var arr = eval(result);
											for (var i = 0; i < arr.length; i++) {
												$("#realClassLi")
														.append(
																"<input type='checkbox' value='"+arr[i].realClassNum+"' name='realClass'/>"
																		+ arr[i].realClassNum);
											}
										}
									});
						});
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#close").click(
				function() {
					//拟态框每次关闭要清除之前信息，否则会叠加
					$("#realClass").remove();
					//清除后要留一空li,以保证下次成功动态加载
					$("#realClassUl").append(
							" <li id="+"realClass"+">"
									+ "<input type='hidden' name='test'/>"
									+ "</li>");
				});
	});
</script>
<script type="text/javascript">
	$(function() {
		//定义两个全局变量
		var checked = [];//点击确认后获取的多选框的值
		var new_arr = []; //经过筛选后的多选框的值，无重复值
		$("#modalConfirm")
				.click(
						function() {
							$('input:checkbox:checked')
									.each(
											function() {
												checked.push($(this).val()); //获取到多选框的一个值
												for (var i = 0; i < checked.length; i++) {
													var items = checked[i];
													if ($.inArray(items,
															new_arr) == -1) {
														new_arr.push(items);//判断元素是否已在new_arr
														$("#selectedRealClass")
																.append(
																		"<li id='selectedRealClass' name='selectedRealClass' style='float: left;margin-left:2%;'>"
																				+ "<input value='"+items+"' name='selectedRealClassContent' id='selectedRealClassContent'/></li>");
													}
												}

											});
						});
	});
</script>
<script type="text/javascript">
	$(function() {
		$("#adsf").click(function() {
			var check = ",";
			$("input[name='realClass']:checked").each(function(i) {
				check = check + $(this).val() + ",";
			});
			$("#realClassContent").val(check);
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
		});
	})
</script>
</head>
<body>
	<div class="wrapper">
<<<<<<< HEAD
		<%-- <jsp:include page="/jsp/top.jsp" flush="true" /> --%>
		<div class="main_top" style="text-align: center;">
			<h2 style="margin: 0; padding: 0;">创建新班级</h2>
		</div>
		<div class="main">
			<form
				action="${pageContext.request.contextPath}/teacher/createVirtualClass"
				method="post" enctype="multipart/form-data">
				<div class="input1">
					<span>课程名称:</span> <select placeholder=""
						style="width: 40%; height: 30px; float: left; margin-left: 4%;" id="courseName" name="courseName">
						<c:forEach items="${courseList }" var="courses">
							<option value="${courses.courseName }">${courses.courseName }</option>
=======
		<jsp:include page="/jsp/top.jsp" flush="true" />
		<div class="main">
			<form
				action="${pageContext.request.contextPath}/teacher/createVirtualClass?courseId=null"
				method="post">
				<div class="input3">
					<span>开设学期：</span> <select name="selectTerm" id="selectTerm">
						<c:forEach items="${listTerm }" var="listTerm">
							<option value="${listTerm.termId }">${listTerm.startYear }-${listTerm.endYear }&nbsp&nbsp${listTerm.term}</option>
							
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
						</c:forEach>
					</select>
				</div>
				<div class="input1">
<<<<<<< HEAD
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
					<div class="friend" style="">
						<p>已选班级：</p>
						<ul id="selectedRealClassUI" name="selectedRealClassUI"
							class="selectedRealClassUI">
						</ul>
						<input value="" name='realClassToController' id='realClassToController' class="realClassToController"
							style="dispaly:none"/>
					</div>
					<div class="selectClassContent">
						<input name="realClassContent" id="realClassContent" class="realClassContent"
							placeholder="筛选班级" style="border:1px solid #969696">
						<ul id="realClassUI" name="realClassUI">
							<c:forEach items="${listRealClass }" var="item">
								<li id="realClass" name=“realClass”><input type="checkbox"
									value="${item.realClassNum }" name="realClassCheckbox"
									id="realClassCheckbox" class="realClassCheckbox" />${item.realClassNum }</li>
							</c:forEach>
						</ul>
=======
					<!-- <span>开设课程：</span> 
					
					<input name="courseName" id="courseName"
						value="${course.courseName }"
						style="width: 40%; height: 30px; float: left; margin-left: 2%;"
						readonly="readonly">
						 -->
						<span>开设课程:</span>
            <select placeholder="" style="width: 40%; height: 30px; float: left; margin-left: 2%;" >
            	<c:forEach items="${courseList }" var="courses">
            	 	<option value="${courses.courseName }"
            	 		 <c:if test="${!empty course && courses.courseName eq course.courseName }"> selected="selected" </c:if> >${courses.courseName }</option>
            	</c:forEach>
            </select>
         
				</div>
				<div class="input1">
					<span>班级名称：</span> <input name="className" id="className"
						style="width: 40%; height: 30px; float: left; margin-left: 2%;">
				</div>
				<div class="teacher-friend">
					<span>开设班级：</span>
					<div class="friend">
						<ul id="selectedRealClassUI" style="list-style-type: none;">
							<li id="selectedRealClass" name=“selectedRealClass”
								style="float: left; margin-left: 2%;"></li>
						</ul>
						<div class="add">
							<button type="button" id="pull" class="btn btn-primary"
								data-toggle="modal" data-target="#exampleModal"
								data-whatever="@mdo">选择班级</button>
						</div>
						<input value="" name='realClassContent' id='realClassContent'
							type="hidden" />
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
					</div>
				</div>
				<hr>
				<div class="button">
					<div class="create">
						<span style="color: white;">
<<<<<<< HEAD
							<button type="onSubmit" id="submitButton" class="btn btn-primary">确定</button>
=======
							<button type="onSubmit" id="adsf" class="btn btn-primary">确定</button>
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
						</span>
					</div>
					<div class="delete">
						<a href="#"><button type="button" id="pull"
								class="btn btn-primary">取消</button> </a>
					</div>
				</div>
			</form>
<<<<<<< HEAD
		</div>
		<!-- <div class="footer">
			<div class="container">
				row End
				<div class="foot-bq">
					版权内容请在本组件"内容配置-版权"处填写
=======
			<!-- 拟态框star -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<ul id="realClassUl" style="list-style-type: none;">
							<li id="realClassLi"><input type="hidden" name="test" /></li>
						</ul>
						<div class="modal-footer">
							<button id="close" type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary" id="modalConfirm"
								data-dismiss="modal">确定</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 拟态框end -->
		</div>
		<div class="footer">
			<div class="container">
				<!--row End-->
				<div class="foot-bq">
					<!-- 版权内容请在本组件"内容配置-版权"处填写 -->
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
					<div
						style="width: 900px; text-align: center; float: left; position: relative; left: 135px; top: 8px;">
						<p>地址：山西省太原市尖草坪区新兰路31号&nbsp;&nbsp;&nbsp;&nbsp;邮编：030008</p>
						<p>
							版权所有：太原工业学院&nbsp;&nbsp;&nbsp;&nbsp;ICP备案号：晋ICP备14003279号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;晋公网安备号：140110430070001
						</p>
					</div>
				</div>
			</div>
<<<<<<< HEAD
		</div> -->
=======
		</div>
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
	</div>
</body>

</html>
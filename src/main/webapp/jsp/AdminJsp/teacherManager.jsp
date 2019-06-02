﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type"
	content="multipart/form-data; charset=UTF-8">
<title>教师信息管理</title>
<link
	href="${pageContext.request.contextPath}/css/Admin/font-awesome.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/js/Admin/morris/morris-0.4.3.min.css"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link
	href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Admin/css/materialize.min.css"
	media="screen,projection" />
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/Admin/custom-styles.css"
	rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Admin/css/cssCharts.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/materialize.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/dataTables/jquery.dataTables.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/dataTables/dataTables.bootstrap.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/custom-scripts.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/moment-with-locales.min.js"></script>
<script>
	$(document).ready(function() {
		$('#dataTables-example').dataTable();
	});
</script>
<script type="text/javascript">
	function getRowValue(element) {
		//this做为参数传过来是方法中的element,parentNode就是获取父节点，获取了连个父节点，就相当于获取了tr
		var node = element.parentNode.parentNode;
		//给每一个input框赋值，node.children[0].innerHTML,node就是tr，tr的子类有多个【0】根据下标取值
		document.getElementById("teacherId").value = node.children[1].innerHTML;
		document.getElementById("teacherIdB").value = node.children[1].innerHTML;
		document.getElementById("teacherName").value = node.children[2].innerHTML;
		if (node.children[4].innerHTML == "男") {
			document.getElementById('select').options[0].selected = true;
		} else {
			document.getElementById('select').options[1].selected = true;
		}
	}
</script>
<script type="text/javascript">
	function check() {
		var uid = $("#file_excel").val();
		if (uid == null || uid == "") {
			alert("文件为空");
			return false;
		}
		return true;
	}
</script>
<script type="text/javascript">
	function checkTwo() {
		var teacherId = $("#teacherId").val();
		var teacherIdB = $("#teacherIdB").val();
		var judge = true;
		path = "${pageContext.request.contextPath}/admin/verificationTeacherId/"
				+ teacherId;
		if (teacherId != teacherIdB) {
			$.ajax({
				async : false,
				cache : false,
				url : path,
				scriptCharset : 'UTF-8',
				success : function(msg) {
					if (!isEmpty(msg)) {
						alert(msg);
						judge = false;
					}
				}
			});
		}
		return judge;
	}
</script>
<script type="text/javascript">
	//判断字符是否为空的方法
	function isEmpty(obj) {
		if (obj == null || obj == "null") {
			return true;
		} else {
			return false;
		}
	}
</script>
</head>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-default top-navbar" role="navigation">
			<div class="navbar-header col-md-3" style="padding: 0%">
				<a class="navbar-brand waves-effect waves-dark" href=""><strong>后台管理</strong></a>
				<div id="sideNav" href="">
					<i class="material-icons dp48"></i>
				</div>
			</div>
			<div class="col-md-6 text-center">
				<h2 style="padding-left: 40%; padding-top: 2%;">教师信息页</h2>
			</div>
			<div class="col-md-3">
				<ul class="nav navbar-top-links navbar-right"
					style="width: 50%; margin-top: 4%;">
					<li style="float: right; margin-right: 9%"><a
						class="dropdown-button waves-effect waves-dark" href="#!"
						data-activates="dropdown1">个人信息</a></li>
				</ul>
			</div>
		</nav>
		<!-- Dropdown Structure -->
		<ul id="dropdown1" class="dropdown-content">
			<li><a
				href="${pageContext.request.contextPath}/admin/toAdminInfo">用户：${sessionScope.admin.adminUsername}</a></li>
			<li><a
				href="${pageContext.request.contextPath}/admin/toAdminInfo">设置</a></li>
			<li><a href="#">登出</a></li>
		</ul>
		<!--/. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="text-left"><a
						href="${pageContext.request.contextPath}/admin/readTeacherInfo"
						class="waves-effect waves-dark" style="font-size: 20px">教师信息管理</a>
					</li>
					<li class="text-left"><a
						href="${pageContext.request.contextPath}/admin/readStudentInfo"
						class="waves-effect waves-dark" style="font-size: 20px">学生信息管理</a>
					</li>
					<li class="text-left"><a
						href="${pageContext.request.contextPath}/admin/readCategories"
						class="waves-effect waves-dark" style="font-size: 20px">分类信息管理</a>
					</li>
					<li class="text-left"><a
						href="${pageContext.request.contextPath}/admin/toAcademicManager"
						class="waves-effect waves-dark" style="font-size: 20px">学术委员会管理</a>
					</li>
					<li class="text-left"><a
						href="${pageContext.request.contextPath}/admin/toAchievementManager"
						class="waves-effect waves-dark" style="font-size: 20px">学生成果管理</a>
					</li>
					<li class="text-left"><a
						href="${pageContext.request.contextPath}/admin/readRealClass"
						class="waves-effect waves-dark" style="font-size: 20px">自然班管理</a>
					</li>
				</ul>
			</div>
		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="col-md-12">
					<!-- Advanced Tables -->
					<div class="card">
						<div class="card-action" style="padding-bottom: 0%">
							<h3>文件导入教师信息</h3>
							<form class="form-inline" id="form_excel" name="form_excel"
								role="form"
								action="${pageContext.request.contextPath}/admin/AddTeacher"
								method="post" enctype="multipart/form-data"
								onsubmit="return check()">
								<div class="form-group" style="padding-top: 2%">
									<label class="sr-only" for="file_excel">文件输入</label> <input
										type="file" id="file_excel" name="file_excel">
								</div>
								<button type="submit" class="btn btn-default"
									style="margin-top: 2%">提交</button>
							</form>
							<div>文件格式：工号、教师名、教师密码、教师性别、教育背景、教师职称、教师电话、电子邮箱</div>
						</div>
						<div class="card-content " style="padding-top: 0%">
							<div class="table-responsive" style="overflow-x: hidden;">
								<hr>





								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example" style="margin-top: -3%">
									<thead>
										<tr>
											<th class="text-center">编号</th>
											<th class="text-center">工号</th>
											<th class="text-center">姓名</th>
											<th class="text-center">昵称</th>
											<th class="text-center">性别</th>
											<th class="text-center">系部</th>
											<th class="text-center">状态</th>
											<th class="text-center">密码</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="asds">
										<c:forEach items="${teacherList }" var="teacher"
											varStatus="status">
											<tr>
												<td class="text-center">${requestScope.offset+status.index}</td>
												<td class="text-center">${teacher.employeeNum }</td>
												<td class="text-center">${teacher.teacherName }</td>
												<td class="text-center">${teacher.teacherNickName }</td>
												<td class="text-center">${teacher.teacherGender }</td>
												<td class="text-center">${teacher.teacherCategory }</td>
												<!--教师系部-->
												<td class="text-center">${teacher.status }</td>
												<!--教师状态-->
												<td class="text-center"><a
													href="${pageContext.request.contextPath}/admin/resetTeacherPassword/${teacher.employeeNum }"
													class="waves-effect waves-dark" style="font-size: 20px">
														<button type="button" class="btn btn-default btn-lg"
															style="padding-top: 4%;">
															<small>重置</small>
														</button>
												</a></td>
												<td class="text-center">
													<button id="edit" type="button"
														class="btn btn-default btn-lg" data-toggle="modal"
														data-target="#Edit" id="${teacher.employeeNum }"
														style="padding-top: 2%;" onclick="getRowValue(this)">
														<small>编辑</small>
													</button>
													<button type="button" class="btn btn-default btn-lg"
														data-toggle="modal" data-target="#"
														style="padding-top: 2%;">
														<small>详情</small>
													</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>






							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="Edit" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">编辑教师信息</h4>
				</div>
				<div class="modal-body">
					<div class="modal-body">
						<form role="form" id="updateInfo"
							action="${pageContext.request.contextPath}/admin/updateTeacher"
							onsubmit="return checkTwo()">
							<div class="form-group">
								<label for="teacherId" class="control-label">教师工号</label> <input
									type="text" class="form-control" id="teacherId"
									name="teacherId"> <input type="text"
									style="display: none" id="teacherIdB" name="teacherIdB" />
							</div>
							<div class="form-group">
								<label for="teacherName" class="control-label">教师姓名</label> <input
									type="text" class="form-control" id="teacherName"
									name="teacherName">
							</div>
							<div class="form-group">
								<label class="control-label">教师性别</label> <select
									class="form-control" id="select" name="select">
									<option>男</option>
									<option>女</option>
								</select>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal" style="margin-left: 2%">关闭</button>
								<button type="submit" class="btn btn-primary" id="submitButton">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</body>

</html>

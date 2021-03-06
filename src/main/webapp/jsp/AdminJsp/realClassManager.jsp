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
<title>自然班级管理</title>
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
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/Admin/custom-styles.css"
	rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Admin/css/cssCharts.css">
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/materialize.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/dataTables/jquery.dataTables.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/dataTables/dataTables.bootstrap.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js">
</script>
<script
	src="${pageContext.request.contextPath}/js/Admin/custom-scripts.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/moment-with-locales.min.js"></script>
<script>
	$(document).ready(function() {
		$('#dataTables-example').dataTable();
	});
</script>
<script>
	$(document).ready(function() {
		$('#dataTables-example').dataTable();
	});
</script>
</head>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-default top-navbar" role="navigation">
			<div class="navbar-header col-md-3" style="padding: 0%">
				<a class="navbar-brand waves-effect waves-dark"
					href=""><strong>后台管理</strong></a>
				<div id="sideNav" href="">
					<i class="material-icons dp48"></i>
				</div>
			</div>
			<div class="col-md-6 text-center">
				<h2 style="padding-left: 40%; padding-top: 2%;">自然班级信息页</h2>
			</div>
			<div class="col-md-3">
					<ul class="nav navbar-top-links navbar-right"  style="width:50%;margin-top:4%;">
					<li style="float: right; margin-right: 9%"><a
						class="dropdown-button waves-effect waves-dark" href="#!"
						data-activates="dropdown1">个人信息</a></li>
				</ul>
			</div>
		</nav>
		<!-- Dropdown Structure -->
		<ul id="dropdown1" class="dropdown-content">
			<li><a href="${pageContext.request.contextPath}/admin/toAdminInfo">用户：${sessionScope.admin.adminUsername}</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/toAdminInfo">设置</a></li>
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
						<button type="button" class="btn btn-primary btn-lg"
							data-toggle="modal" data-target="#myModal"
							style="margin-top: 2%; margin-bottom: -3%; margin-left: 2%; padding-bottom: 3%;">
							添加实体班级</button>
						<div class="card-content " style="padding-top: 3%">
							<div class="table-responsive" style="overflow-x: hidden;">
								<hr>
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example" style="margin-top:-3%">
									<thead>
										<tr>
											<th class="text-center">序号</th>
											<th class="text-center">班级号</th>
											<th class="text-center">班级人数</th>
											<th class="text-center">所属系部</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${realClassList }" var="realClass"
											varStatus="status">
											<tr>
												<td class="text-center">${requestScope.offset+status.index}</td>
												<td class="text-center">${realClass.realClassNum }</td>
												<td class="text-center">${realClass.realPersonNum }</td>
												<td class="text-center">${realClass.realClassCategory }</td>
												<td class="text-center">
													<button type="button" class="btn btn-default btn-lg"
														data-toggle="modal" data-target="#Edit"
														style="padding-top: 2%;">
														<small>编辑</small>
													</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--End Advanced Tables -->
				</div>
			</div>
			<!-- /. PAGE INNER  -->
		</div>
	</div>

	<div class="modal" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">添加实体班</h4>
				</div>
				<div class="modal-body">
					<div class="modal-body">
							<form id="commitCategory" name="commitCategory"
							action="${pageContext.request.contextPath}/admin/AddRealClass">
							<div class="form-group">
								<label for="realClassNum" class="control-label">班号</label> <input
									type="text" class="form-control" id="realClassNum" name="realClassNum">
							</div>
							<div class="form-group">
								<label for="realClassNum" class="control-label">班级人数</label> <input
									type="text" class="form-control" id="realClassPersonNum" name="realClassPersonNum" value="40">
							</div>
							<div class="form-group">
								<select class="selectpicker show-tick form-control"
									data-live-search="true" name="category" id="category">
									<c:forEach items="${categories }" var="category" varStatus="status">
										<option>${category.categoryName }</option>
										</c:forEach>
								</select>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal" style="margin-left: 2%">关闭</button>
								<button type="submit" class="btn btn-primary">提交</button>
							</div>
						</form>
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
					<h4 class="modal-title" id="myModalLabel">修改实体班</h4>
				</div>
				<div class="modal-body">
					<div class="modal-body">
							<form id="commitCategory" name="commitCategory"
							action="${pageContext.request.contextPath}/admin/AddRealClass">
							<div class="form-group">
								<label for="realClassNum" class="control-label">班号</label> <input
									type="text" class="form-control" id="realClassNum" name="realClassNum">
							</div>
							<div class="form-group">
								<label for="realClassNum" class="control-label">班级人数</label> <input
									type="text" class="form-control" id="realClassPersonNum" name="realClassPersonNum" value="40">
							</div>
							<div class="form-group">
								<select class="selectpicker show-tick form-control"
									data-live-search="true" name="category" id="category">
									<c:forEach items="${categories }" var="category" varStatus="status">
										<option>${category.categoryName }</option>
										</c:forEach>
								</select>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal" style="margin-left: 2%">关闭</button>
								<button type="submit" class="btn btn-primary">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

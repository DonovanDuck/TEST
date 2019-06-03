<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="${pageContext.request.contextPath}/css/backstagemanager/bootstrap.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/css/backstagemanager/customer.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/css/backstagemanager/bootstrap-table.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/js/backstagemanager/jquery-3.2.1.js"></script>
<script
	src="${pageContext.request.contextPath}/js/backstagemanager/bootstrap.js"></script>
<script
	src="${pageContext.request.contextPath}/js/backstagemanager/bootstrap-table.js"></script>
<script
	src="${pageContext.request.contextPath}/js/backstagemanager/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript">
	$(function() {
		var oTable = new TableInit();
		oTable.Init();
		var oButtonInit = new ButtonInit();
		oButtonInit.Init();
	});

	var TableInit = function() {
		var oTableInit = new Object();
		//初始化Table
		oTableInit.Init = function() {
			$('#tb_departments')
					.bootstrapTable(
							{
								url : '${pageContext.request.contextPath}/admin/getTeacherInfo', //请求后台的URL（*）
								method : 'get', //请求方式（*）
								striped : true, //是否显示行间隔色
								cache : true, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
								pagination : true, //是否显示分页（*）
								sortable : false, //是否启用排序
								sortOrder : "asc", //排序方式
								queryParams : oTableInit.queryParams,//传递参数（*）
								sidePagination : "client", //分页方式：client客户端分页，server服务端分页（*）
								pageNumber : 1, //初始化加载第一页，默认第一页
								pageSize : 20, //每页的记录行数（*）
								pageList : [ 10, 15, 20, 30, 50, 100 ], //可供选择的每页的行数（*）
								search : true, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
								strictSearch : true,
								showColumns : false, //是否显示所有的列
								showRefresh : false, //是否显示刷新按钮
								minimumCountColumns : 2, //最少允许的列数
								clickToSelect : true, //是否启用点击选中行
								strictSearch : true,
								height : 500, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
								uniqueId : "ID", //每一行的唯一标识，一般为主键列
								showToggle : false, //是否显示详细视图和列表视图的切换按钮
								cardView : false, //是否显示详细视图
								detailView : false, //是否显示父子表
								columns : [
										{
											field : 'index',
											title : '序号',
											align : 'center',
											formatter : function(value, row,
													index) {
												var pageSize = $(
														'#tb_departments')
														.bootstrapTable(
																'getOptions').pageSize; //通过table的#id 得到每页多少条
												var pageNumber = $(
														'#tb_departments')
														.bootstrapTable(
																'getOptions').pageNumber; //通过table的#id 得到当前第几页
												return pageSize
														* (pageNumber - 1)
														+ index + 1; // 返回每条的序号： 每页条数 *（当前页 - 1 ）+ 序号
											},
										},
										{
											field : 'number',
											align : 'center',
											title : '工号'
										},
										{
											field : 'name',
											align : 'center',
											title : '姓名'
										},
										{
											field : 'nickName',
											align : 'center',
											title : '昵称'
										},
										{
											field : 'gender',
											align : 'center',
											title : '性别'
										},
										{
											field : 'category',
											align : 'center',
											title : '系部'
										},
										{
											field : 'status',
											align : 'center',
											title : '状态'
										},
										{
											field : 'password',
											align : 'center',
											title : '密码',
											events : {
												'click #resetPas' : function(
														event, value, row,
														index) {
													var id = row.number;
													$
															.ajax({
																async : true,
																cache : false,
																url : "${pageContext.request.contextPath}/admin/resetTeacherPassword/"
																		+ id,
																type : "get",
																dataType : "text",
																success : function(
																		result) {
																	alert(result);
																},
																error : function(
																		result) {
																	alert("初试密码失败");
																},
															})
												}
											},
											formatter : addFunctionAlty,
										},
										{
											align : 'center',
											title : '操作',
											formatter : addoperate,
											events : {
												'click #edit' : function(event,
														value, row, index) {
													var id = row.number;
													var name = row.name;
													var gender = row.gender;
													document
															.getElementById("teacherId").value = id;
													document
															.getElementById("teacherIdB").value = id;
													document
															.getElementById("teacherName").value = name;
													if (gender == "男") {
														document
																.getElementById('select').options[0].selected = true;
													} else {
														document
																.getElementById('select').options[1].selected = true;
													}
													$('#Edit').modal('show');
												}
											}
										} ],
								onLoadSuccess : function(res) {//可不写
									//加载成功时
									console.log(res);
									$exportDate = res;
								},
								onLoadError : function(statusCode) {
									return "加载失败了";
								},
								formatLoadingMessage : function() {
									//正在加载
									return "拼命加载中...";
								},
								formatNoMatches : function() {
									//没有匹配的结果
									return '无符合条件的记录';
								}
							});
		};
		//得到查询的参数
		oTableInit.queryParams = function(params) {
			var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
				limit : params.limit, //页面大小
				offset : params.offset, //页码
				departmentname : $("#txt_search_departmentname").val(),
				statu : $("#txt_search_statu").val()
			};
			return temp;
		};
		return oTableInit;
	};
	var ButtonInit = function() {
		var oInit = new Object();
		var postdata = {};
		oInit.Init = function() {
			//初始化页面上面的按钮事件
		}
		return oInit;
	};
	function addFunctionAlty(value, row, index) {
		return [
				'<button id="resetPas" type="button" class="btn btn-default">重置</button>', ]
				.join('');
	}
	function addoperate(value, row, index) {
		return [
				'<button id="edit" type="button" class="btn btn-default">编辑</button>',
				'<button id="" type="button" class="btn btn-default">查看</button>', ]
				.join('');
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
	function addCheckInfo() {
		$.ajax({
			async : false,
			cache : false,
			url : ,
			scriptCharset : 'UTF-8',
			success : function(msg) {
				if (!isEmpty(msg)) {
					alert(msg);
					judge = false;
				}
			}
		});
	}
</script>
<title>后台管理</title>
</head>
<body style="background-color: #f8f8f8">
	<nav class="navbar navbar-default" role="navigation"
		style="margin: 0px; background-color: white;">
		<div class="container-fluid">
			<div class="navbar-header col-md-2 text-center">
				<h3>后台管理</h3>
			</div>
			<div class="navbar-header col-md-8"></div>
			<div class="col-md-2">
				<ul class="nav navbar-nav pull-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">管理员：${sessionScope.admin.adminUsername}<b
							class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a
								href="${pageContext.request.contextPath}/admin/toAdminInfo">设置</a></li>
							<li class="divider"></li>
							<li><a href="#">登出</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="content">
		<div class="leftList col-md-2"
			style="padding: 0px; margin-top: 1%; background-color: white;">
			<nav class="navbar-default navbar-side" role="navigation"
				style="background-color: white;">
				<ul class="nav" id="main-menu">
					<li><a
						href="${pageContext.request.contextPath}/admin/toTeacherManager"
						class="waves-effect waves-dark"
						style="font-size: 20px; background-color: #f8f8f8">教师信息管理</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/toStudentManager"
						class="waves-effect waves-dark" style="font-size: 20px">学生信息管理</a>
					</li>
					<li><a
						href="${pageContext.request.contextPath}/admin/toCategoryManager"
						class="waves-effect waves-dark" style="font-size: 20px">课程类型管理</a>
					</li>
					<li><a
						href="${pageContext.request.contextPath}/admin/toAchievementManager"
						class="waves-effect waves-dark" style="font-size: 20px">成果管理</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/toRealClassManager"
						class="waves-effect waves-dark" style="font-size: 20px;">自然班管理</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/toAcademicManager"
						class="waves-effect waves-dark" style="font-size: 20px">学术委员管理</a>
					</li>
					<li><a
						href="${pageContext.request.contextPath}/admin/toDepartmentManager"
						class="waves-effect waves-dark" style="font-size: 20px;">学术委员会管理</a></li>
				</ul>
			</nav>
		</div>
		<div class="RightContent col-md-10">
			<div class="panel"
				style="padding-bottom: 0%; margin-top: 1%; margin-bottom: 0px; background-color: white;">
				<h3>文件导入教师信息</h3>
				<form class="form-inline" id="form_excel" name="form_excel"
					role="form" style="margin: 0px"
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
				<br>
				<div>文件(EXCEL)格式：工号、教师名、教师密码、教师性别、教育背景、教师职称、教师电话、电子邮箱</div>
				<button type="button" class="btn btn-primary btn-lg"
					data-toggle="modal" data-target="#AddTeacher"
					style="margin-top: 1%; margin-left: 1%;">添加个体教师</button>
				<hr>
			</div>
			<div class="panel-body"
				style="padding-bottom: 0px; padding-top: 0px; background-color: white;">
				<table id="tb_departments"></table>
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
	</div>


	<div class="modal" id="AddTeacher" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">添加教师信息</h4>
				</div>
				<div class="modal-body">
					<div class="modal-body">
						<form role="form" id="updateInfo"
							action="${pageContext.request.contextPath}/admin/addOneTeacher">
							<div class="form-group">
								<label for="teacherId" class="control-label">教师工号</label> <input
									type="text" class="form-control" id="addTeacherNum"
									name="addTeacherNum">
							</div>
							<div class="form-group">
								<label for="teacherName" class="control-label">教师姓名</label> <input
									type="text" class="form-control" id="addTeacherName"
									name="addTeacherName">
							</div>
							<div class="form-group">
								<label class="control-label">教师性别</label> <select
									class="form-control" id="addSelect" name="addSelect">
									<option>男</option>
									<option>女</option>
								</select>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal" style="margin-left: 2%">关闭</button>
								<button class="btn btn-primary" onclick="addCheckInfo()">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
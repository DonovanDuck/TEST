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
								url : '${pageContext.request.contextPath}/admin/getAcademicInfo', //请求后台的URL（*）
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
								search : false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
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
											field : 'id',
											align : 'center',
											visible : false,
										},
										{
											field : 'department',
											align : 'center',
											title : '学术委员会'
										},
										{
											field : 'name',
											align : 'center',
											title : '姓名'
										},
										{
											field : 'professional',
											align : 'center',
											title : '职称'
										},
										{
											field : 'time',
											align : 'center',
											title : '认定时间',
											formatter : function(value, row,
													index) {
												return changeDateFormat(value)
											}
										},
										{
											align : 'center',
											title : '操作',
											formatter : addoperate,
											events : {
												'click #edit' : function(event,
														value, row, index) {
													document
															.getElementById("editName").value = row.name;
													document
															.getElementById("editId").value = row.id;
													document
															.getElementById("editPro").value = row.professional;
													$("#editSe")
															.find(
																	"option:contains("
																			+ row.department
																			+ ")")
															.attr("selected",
																	true);
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
	function addoperate(value, row, index) {
		return [
				'<button id="edit" type="button" class="btn btn-default">编辑</button>', ]
				.join('');
	}
    function changeDateFormat(cellval) {
        var dateVal = cellval + "";
        if (cellval != null) {
            var date = new Date(parseInt(dateVal.replace("/Date(", "").replace(")/", ""), 10));
            var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
            var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
            
            var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
            var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
            var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
            
            return date.getFullYear() + "-" + month + "-" + currentDate;
        }
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
							<li><a
								href="${pageContext.request.contextPath}/admin/logout">登出</a></li>
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
						class="waves-effect waves-dark" style="font-size: 20px">教师信息管理</a>
					</li>
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
					<li><a href="${pageContext.request.contextPath}/admin/toTerm"
						class="waves-effect waves-dark" style="font-size: 20px;">学期管理</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/toAcademicManager"
						class="waves-effect waves-dark"
						style="font-size: 20px; background-color: #f8f8f8">学术委员管理</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/toDepartmentManager"
						class="waves-effect waves-dark" style="font-size: 20px;">学术委员会管理</a></li>
				</ul>
			</nav>
		</div>
		<div class="RightContent col-md-10" style="margin-top: 1%;">
			<div class="panel-body"
				style="padding-bottom: 0px; padding-top: 0px; background-color: white;">
				<h2 class="text-center">学术委员管理</h2>
				<hr style="margin: 1%">
				<button type="button" class="btn btn-primary btn-lg"
					style="margin-top: 1%" data-toggle="modal" data-target="#add">添加学术委员</button>
				<table id="tb_departments" style="margin-top: 1%"></table>
			</div>
		</div>
	</div>

	<div class="modal" id="add" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">添加学术委员信息</h4>
				</div>
				<div class="modal-body">
					<div class="modal-body">
						<form id="commitCategory" name="commitCategory"
							action="${pageContext.request.contextPath}/admin/addAcademic"
							method="post">
							<div class="form-group">
								<label for="selectDe" class="control-label">学术委员会</label> <select
									class="selectpicker show-tick form-control"
									data-live-search="true" name=selectAdd id="selectAdd">
									<c:forEach items="${departmentList }" var="de"
										varStatus="status">
										<option value="${de.num }">${de.name }</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label for="categoryId" class="control-label">姓名</label> <input
									type="text" class="form-control" id="addnName" name="addName">
							</div>
							<div class="form-group">
								<label for="categoryName" class="control-label">职称</label> <input
									type="text" class="form-control" id="addPro" name="addPro">
							</div>
							<div class="form-group">
								<div class="row">
									<div class='col-sm-6'>
										<div class="form-group">
											<label>认定时间：</label> <input type="date" id="addTime"
												name="addTime" value="2015-09-04" />
										</div>
									</div>
								</div>
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
					<h4 class="modal-title" id="myModalLabel">编辑学术委员信息</h4>
				</div>
				<div class="modal-body">
					<div class="modal-body">
						<form
							action="${pageContext.request.contextPath}/admin/updateAcademic">
							<div class="form-group">
								<label for="editName" class="control-label">姓名</label> <input
									type="text" class="form-control" id="editName" name="editName">
								<input type="text" class="form-control" id="editId"
									name="editId" style="display: none">
							</div>
							<div class="form-group">
								<label for="editPro" class="control-label">职称</label> <input
									type="text" class="form-control" id="editPro" name="editPro">
							</div>
							<div class="form-group">
								<label for="selectDe" class="control-label">系部</label> <select
									class="selectpicker show-tick form-control"
									data-live-search="true" name="editSe" id="editSe">
									<c:forEach items="${departmentList }" var="de"
										varStatus="status">
										<option value="${de.num }">${de.name }</option>
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
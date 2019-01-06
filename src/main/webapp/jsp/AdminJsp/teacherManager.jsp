<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师信息管理</title>
<jsp:include page="Common.jsp"></jsp:include>
</head>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-default top-navbar" role="navigation">
			<div class="navbar-header col-md-3" style="padding: 0%">
				<a class="navbar-brand waves-effect waves-dark"
					href="teacherManager.html"><strong>后台管理</strong></a>
				<div id="sideNav" href="">
					<i class="material-icons dp48"></i>
				</div>
			</div>
			<div class="col-md-6 text-center">
				<h2 style="padding-left: 40%; padding-top: 2%;">教师信息页</h2>
			</div>
			<div class="col-md-3">
				<ul class="nav navbar-top-links navbar-right">
					<li style="float: right; margin-right: 9%"><a
						class="dropdown-button waves-effect waves-dark" href="#!"
						data-activates="dropdown1"> <i class="fa fa-user fa-fw"></i> <b>姓名</b>
							<i class="material-icons right">arrow_drop_down</i>
					</a></li>
				</ul>
			</div>
		</nav>
		<!-- Dropdown Structure -->
		<ul id="dropdown1" class="dropdown-content">
			<li><a href="#">${admin.adminUsername }</a></li>
			<li><a href="#">设置</a></li>
			<li><a href="#">登出</a></li>
		</ul>
		<!--/. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="text-left"><a href="teacherManager.html"
						class="waves-effect waves-dark" style="font-size: 20px">教师信息管理</a>
					</li>
					<li class="text-left"><a href="studentManager.html"
						class="waves-effect waves-dark" style="font-size: 20px">学生信息管理</a>
					</li>
					<li class="text-left"><a href="categoryManager.html"
						class="waves-effect waves-dark" style="font-size: 20px">分类信息管理</a>
					</li>
					<li class="text-left"><a href="academicManager.html"
						class="waves-effect waves-dark" style="font-size: 20px">学术委员会管理</a>
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
							<form class="form-inline" id="form_excel" name="form_excel" role="form" action="${pageContext.request.contextPath}/admin/AddTeacher" method="post" enctype="multipart/form-data">
								<div class="form-group" style="padding-top: 2%">
									<label class="sr-only" for="file_excel">文件输入</label> 
									<input type="file" id="file_excel" name="file_excel" >
								</div>
								<button type="submit" class="btn btn-default"
									style="margin-top: 2%">提交
								</button>
							</form>
						</div>
						<div class="card-content " style="padding-top: 0%">
							<div class="table-responsive" style="overflow-x: hidden;">
								<hr>
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th class="text-center">编号</th>
											<th class="text-center">教师工号</th>
											<th class="text-center">教师姓名</th>
											<th class="text-center">教师昵称</th>
											<th class="text-center">教师性别</th>
											<th class="text-center">所属系部</th>
											<th class="text-center">教师状态</th>
											<th class="text-center">教师密码</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${teacherList }" var="teacher"
											varStatus="status">
											<tr>
												<td>${requestScope.offset+status.index}</td>
												<td>${teacher.employeeNum }</td>
												<td>${teacher.teacherName }</td>
												<td>${teacher.teacherNickName }</td>
												<td>${teacher.teacherGender }</td>
												<td>${teacher.teacherCategory }</td>
												<!--教师系部-->
												<td>${teacher.teacherStatus }</td>
												<!--教师状态-->
												<td>${teacher.teacherPassword }</td>
												<td><input type="button" title="Edit" value="编辑" /> <input
													type="button" title="Edit" value="删除" /></td>
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
						<form>
							<div class="form-group">
								<label for="teacherId" class="control-label">教师工号</label> <input
									type="text" class="form-control" id="teacherId">
							</div>
							<div class="form-group">
								<label for="teacherName" class="control-label">教师姓名</label>
								<textarea class="form-control" id="teacherName"></textarea>
							</div>
							<div class="form-group">
								<label class="control-label">教师性别</label> <select
									class="form-control">
									<option>男</option>
									<option>女</option>
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
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</body>

</html>

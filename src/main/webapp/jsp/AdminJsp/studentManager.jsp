<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>管理员后台</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Admin/layout.css"
	type="text/css" media="screen" />
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.5.2.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/Admin/hideshow.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery.tablesorter.min.js"
	type="text/javascript"></script>
<script type="${pageContext.request.contextPath}text/javascript"
	src="${pageContext.request.contextPath}/js/Admin/jquery.equalHeight.js"></script>
</head>
<body>
	<header id="header">
		<hgroup>
			<h1 class="site_title">
				<a href="index.html">管理员界面</a>
			</h1>
		</hgroup>
	</header>
	<!-- end of header bar -->
	<aside id="sidebar" class="column">
		<hr />
		<h3>用户信息管理</h3>
		<ul class="toggle">
			<li class="icn_new_article"><a
				href="${pageContext.request.contextPath}/admin/readStudentInfo">管理学生信息</a></li>
			<li class="icn_edit_article"><a
				href="${pageContext.request.contextPath}/admin/readTeacherInfo">管理老师信息</a></li>
		</ul>
		<h3>分类信息管理</h3>
		<ul class="toggle">
			<li class="icn_add_user"><a
				href="${pageContext.request.contextPath}/admin/readCategories">管理分类信息</a></li>
		</ul>
		<h3>学术管理委员会管理</h3>
		<ul class="toggle">
			<li class="icn_folder"><a href="#">查看管理委员会信息</a></li>
			<li class="icn_photo"><a href="#">修改管理委员会信息</a></li>
		</ul>
	</aside>
	<section id="main" class="column">
		<article class="module width_3_quarter">
			<div class="tab_container">
				<h1>上传学生信息</h1>
				<form id="form_excel" name="form_excel"
					action="${pageContext.request.contextPath}/admin/AddStudent"
					method="post" enctype="multipart/form-data">
					<span class=""><input type="file" id="file_excel"
						name="file_excel" /> </span> <input type="submit" />
				</form>
				<hr>
				<div id="tab1" class="tab_content">
					<table class="tablesorter">
						<thead>
							<tr>
								<th>学生学号</th>
								<th>学生姓名</th>
								<th>学生性别</th>
								<th>学生班级</th>
								<th>学生专业</th>
								<th>学生电话</th>
								<th>学生邮件</th>
								<th>学生昵称</th>
								<th>学生密码</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${studentList }" var="student">
								<tr>
									<td align="center">${student.studentId }</td>
									<td align="center">${student.studentName }</td>
									<td align="center">${student.studentGender }</td>
									<td align="center">${student.classNum }</td>
									<td align="center">${student.professional }</td>
									<td align="center">${student.telephone }</td>
									<td align="center">${student.email }</td>
									<td align="center">${student.studentNickName }</td>
									<td align="center">${student.studentPassword }</td>
									<td><input type="button" title="Edit" value="编辑" />
										<form id="deleteStudent" name="deleteStudent"
											action="${pageContext.request.contextPath}/admin/deleteStudent/${student.studentId }"
											method="GET">
											<input type="submit" title="Edit" value="删除" />
										</form></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</article>
	</section>
</body>
</html>
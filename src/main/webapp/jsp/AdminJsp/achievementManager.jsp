<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>学生成果管理</title>
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
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/materialize.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/custom-scripts.js"></script>
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
<script type="text/javascript">
	function deleteAchievement(achievementId) {
		var button = $(this);
		$.ajax({
			async : false,
			cache : false,
			url : "${pageContext.request.contextPath}/admin/deleteAchievement/"
					+ achievementId,
			type : "POST",
			dataType : "json",
			success : function() {
				button.remove();
			},
			error : function() {
				button.remove();
				var arr = achievementId.split(',');
				var content = "";
				var divP = $(this).previousSibing;
				divP.append(content);
			}
		});
	}

	function restore(achievementId) {
		$
				.ajax({
					async : false,
					cache : false,
					url : "${pageContext.request.contextPath}/admin/restoreAchievement/"
							+ achievementId,
					type : "POST",
					dataType : "json",
					success : function(result) {
					}
				});
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
				<h2 style="padding-left: 40%; padding-top: 2%;">学生成果信息页</h2>
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
		<div id="page-wrapper" style="height: 1400px">
			<div id="page-inner">
				<div class="col-md-12">
					<!-- Advanced Tables -->
					<div class="card">
						<div class="card-content " style="padding-top: 3%">
							<div class="table-responsive" style="overflow-x: hidden;">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example" style="margin-top: -3%">
									<thead>
										<tr>
											<th class="text-center">成果首图</th>
											<th class="text-center">成果名字</th>
											<th class="text-center">成果类别</th>
											<th class="text-center">上传者</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<!-- <img alt=""
														style="width: 100%; height: 150px;"
														src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.firstPicture }" /> -->
										<c:if test="${!empty iURPList}">
											<c:forEach items="${iURPList }" var="item" varStatus="status">
												<tr>
													<td class="text-center"><div
															style="width: 110px; height: 90px; margin-left: 23%;">
															<img alt="" style="width: 100%; height: 100%;"
																src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.firstPicture }">
														</div></td>
													<td class="text-center" style="vertical-align: middle;">${item.projectName }</td>
													<td class="text-center" style="vertical-align: middle;">产学研</td>
													<td class="text-center" style="vertical-align: middle;">${item.uploadAuthorId }</td>
													<td class="text-center" style="vertical-align: middle;"><a
														href="${pageContext.request.contextPath}/achievement/toDetailIURP?achievementId=${item.projectId }">
															<button type="button" class="btn btn-info"
																style="padding-top: 2%;">
																<small>查看</small>
															</button>
													</a> <c:if test="${item.deleteFlag == 1 }">
															<input type="button" class="btn"
																onclick="deleteAchievement('${item.projectId },产学研')"
																style="padding-top: 2%;" value="删除">
														</c:if> <c:if test="${item.deleteFlag == 0 }">
															<input type="button" class="btn"
																onclick="restore('${item.projectId },产学研')"
																style="padding-top: 2%;" value="恢复">
														</c:if></td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${!empty courseExpandList}">
											<c:forEach items="${courseExpandList }" var="item"
												varStatus="status">
												<tr>
													<td class="text-center"><div
															style="width: 110px; height: 90px; margin-left: 23%;">
															<img alt="" style="width: 100%; height: 100%;"
																src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.firstPicture }">
														</div></td>
													<td class="text-center" style="vertical-align: middle;">${item.achievementName }</td>
													<td class="text-center" style="vertical-align: middle;">课程拓展</td>
													<td class="text-center" style="vertical-align: middle;">${item.uploadAuthorId }</td>
													<td class="text-center" style="vertical-align: middle;"><a
														href="${pageContext.request.contextPath}/achievement/toDetailCourseExpand?achievementId=${item.achievementId }"><button
																type="button" class="btn btn-info"
																style="padding-top: 2%;">
																<small>查看</small>
															</button></a> <c:if test="${item.deleteFlag == 1 }">
															<input type="button" class="btn"
																onclick="deleteAchievement('${item.achievementId },课程拓展')"
																style="padding-top: 2%;" value="删除">
														</c:if> <c:if test="${item.deleteFlag == 0 }">
															<input type="button" class="btn"
																onclick="restore('${item.achievementId },课程拓展')"
																style="padding-top: 2%;" value="恢复">
														</c:if></td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${!empty gdfcsList}">
											<c:forEach items="${gdfcsList }" var="item"
												varStatus="status">
												<tr>
													<td class="text-center"><div
															style="width: 110px; height: 90px; margin-left: 23%;">
															<img alt="" style="width: 100%; height: 100%;"
																src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.firstPicture }">
														</div></td>
													<td class="text-center" style="vertical-align: middle;">${item.achievementName }</td>
													<td class="text-center" style="vertical-align: middle;">毕业设计</td>
													<td class="text-center" style="vertical-align: middle;">${item.uploadAuthorId }</td>
													<td class="text-center" style="vertical-align: middle;"><a
														href="${pageContext.request.contextPath}/achievement/toDetailGDFCS?achievementId=${item.achievementId }"><button
																type="button" class="btn btn-info"
																style="padding-top: 2%;">
																<small>查看</small>
															</button></a> <c:if test="${item.deleteFlag == 1 }">
															<input type="button" class="btn"
																onclick="deleteAchievement('${item.achievementId },毕业设计')"
																style="padding-top: 2%;" value="删除">
														</c:if> <c:if test="${item.deleteFlag == 0 }">
															<input type="button" class="btn"
																onclick="restore('${item.achievementId },毕业设计')"
																style="padding-top: 2%;" value="恢复">
														</c:if></td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${!empty siaeList}">
											<c:forEach items="${siaeList }" var="item" varStatus="status">
												<tr>
													<td class="text-center"><div
															style="width: 110px; height: 90px; margin-left: 23%;">
															<img alt="" style="width: 100%; height: 100%;"
																src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.firstPicture }">
														</div></td>
													<td class="text-center" style="vertical-align: middle;">${item.achievementName }</td>
													<td class="text-center" style="vertical-align: middle;">大学生创新创业</td>
													<td class="text-center" style="vertical-align: middle;">${item.uploadAuthorId }</td>
													<td class="text-center" style="vertical-align: middle;"><a
														href="${pageContext.request.contextPath}/achievement/toDetailSIAE?achievementId=${item.achievementId }"><button
																type="button" class="btn btn-info"
																style="padding-top: 2%;">
																<small>查看</small>
															</button></a> <c:if test="${item.deleteFlag == 1 }">
															<input type="button" class="btn"
																onclick="deleteAchievement('${item.achievementId },大学生创新创业')"
																style="padding-top: 2%;" value="删除">
														</c:if> <c:if test="${item.deleteFlag == 0 }">
															<input type="button" class="btn"
																onclick="restore('${item.achievementId },大学生创新创业')"
																style="padding-top: 2%;" value="恢复">
														</c:if></td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${!empty aocscList}">
											<c:forEach items="${aocscList }" var="item"
												varStatus="status">
												<tr>
													<td class="text-center">
														<div style="width: 110px; height: 90px; margin-left: 23%;">
															<img alt="" style="width: 100%; height: 100%;"
																src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.firstPicture }">
														</div>
													</td>
													<td class="text-center" style="vertical-align: middle;">${item.achievementName }</td>
													<td class="text-center" style="vertical-align: middle;">大学生竞赛作品</td>
													<td class="text-center" style="vertical-align: middle;">${item.uploadAuthorId }</td>
													<td class="text-center" style="vertical-align: middle;"><a
														href="${pageContext.request.contextPath}/achievement/toDetailAOCSC?achievementId=${item.achievementId }"><button
																type="button" class="btn btn-info"
																style="padding-top: 2%;">
																<small>查看</small>
															</button></a> <c:if test="${item.deleteFlag == 1 }">
															<input type="button" class="btn"
																onclick="deleteAchievement('${item.achievementId },大学生竞赛作品')"
																style="padding-top: 2%;" value="删除">
														</c:if> <c:if test="${item.deleteFlag == 0 }">
															<input type="button" class="btn"
																onclick="restore('${item.achievementId },大学生竞赛作品')"
																style="padding-top: 2%;" value="恢复">
														</c:if></td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

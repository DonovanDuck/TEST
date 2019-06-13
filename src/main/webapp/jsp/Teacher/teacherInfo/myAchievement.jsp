<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/own.css" />
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
<link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/student/achievement.css" />
<link
	href="${pageContext.request.contextPath}/css/achievement/achievementMain.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/student/table.css" />
</head>
<body>
	<div class="content">
		<div class="topRow" style="height: 58px">
			<div class="word1" id="w1">
				<p>
					<a target="myclass"
						href="${pageContext.request.contextPath}/teacher/.." id="p1">成果参与</a>
				</p>
			</div>


			<div class="word2" id="w4" style="margin-left: -2%">
				<p>
					<a target="_parent"
						href="${pageContext.request.contextPath}/teacher/.." id="p4">我的成果</a>
				</p>
			</div>

			<div class="word2" style="margin-left: -2%">
				<p>
					<a target="_parent"
						href="${pageContext.request.contextPath}/achievement/toUploadAchievement"
						id="p4">发布成果</a>
				</p>
			</div>
		</div>
		<div class="hr"></div>
		<div class="bottomContent">
		<div class=""></div>
			<div class="myAchievement">
				<div class="main_b_r_b" id="k1">
					<div class="iurpContent" id="iurpContent" style="display: none">
						<c:if test="${!empty iURPList}">
							<c:forEach items="${iURPList }" var="item" varStatus="status">
								<a
									href="${pageContext.request.contextPath}/achievement/toDetailIURP?achievementId=${item.projectId }">
									<div class="chengguo-out col-md-4"
										style="padding: 8px; height: 340px; margin-top: 1%;">
										<div class="doorPlank"
											style="padding: 2.5rem; background-color: white; height: 100%">
											<div class="rel-img">
												<img src="${pageContext.request.contextPath}/img/fire.png"
													style="position: absolute; margin-left: 0; margin-top: 0;">
												<img alt="" style="width: 100%; height: 150px;"
													src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.firstPicture }" />
											</div>
											<div class="info" style="width: 100%; height: 80px;">
												<div class="infoContent">
													<h3 class="achievementTitle">
														<b>${item.projectName }</b>
													</h3>
													<p class="description">${item.introduction }</p>
													<p class="description">
														<b>产学研</b>推荐&nbsp&nbsp<span class="publishTime">发布于：${item.endTime }</span>
													</p>
													<p class="publishTime" style="float: right; color: gray">浏览量:${item.browseVolume }</p>
												</div>
											</div>
										</div>
									</div>
								</a>
							</c:forEach>
						</c:if>
					</div>
					<div class="courseExpandContent" id="courseExpandContent"
						style="display: block;">
						<c:if test="${!empty courseExpandList}">
							<c:forEach items="${courseExpandList }" var="item"
								varStatus="status">
								<a
									href="${pageContext.request.contextPath}/achievement/toDetailCourseExpand?achievementId=${item.achievementId }">
									<div class="chengguo-out col-md-4"
										style="padding: 8px; height: 340px; margin-top: 1%;">
										<div class="doorPlank"
											style="padding: 2.5rem; background-color: white; height: 100%">
											<div class="rel-img">
												<img src="${pageContext.request.contextPath}/img/fire.png"
													style="position: absolute; margin-left: 0; margin-top: 0;">
												<img alt="" style="width: 100%; height: 150px;"
													src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.firstPicture }" />
											</div>
											<div class="info" style="width: 100%; height: 80px;">
												<div class="infoContent">
													<h3 class="achievementTitle">
														<b>${item.achievementName }</b>
													</h3>
													<p class="description">${item.introduction }</p>
													<p class="description">
														<b>${item.achievementCategory }</b>推荐&nbsp&nbsp<span
															class="publishTime">发布于：${item.finishTime }</span>
													</p>
													<p class="publishTime" style="float: right; color: gray">浏览量:${item.browseVolume }</p>
												</div>
											</div>
										</div>
									</div>
								</a>
							</c:forEach>
						</c:if>
					</div>
					<div class="gdfcsContent" id="gdfcsContent" style="display: none">
						<c:if test="${!empty gdfcsList}">
							<c:forEach items="${gdfcsList }" var="item" varStatus="status">
								<a
									href="${pageContext.request.contextPath}/achievement/toDetailGDFCS?achievementId=${item.achievementId }">
									<div class="chengguo-out col-md-4"
										style="padding: 8px; height: 340px; margin-top: 1%;">
										<div class="doorPlank"
											style="padding: 2.5rem; background-color: white; height: 100%">
											<div class="rel-img">
												<img src="${pageContext.request.contextPath}/img/fire.png"
													style="position: absolute; margin-left: 0; margin-top: 0;">
												<img alt="" style="width: 100%; height: 150px;"
													src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.firstPicture }" />
											</div>
											<div class="info" style="width: 100%; height: 80px;">
												<div class="infoContent">
													<h3 class="achievementTitle">
														<b>${item.achievementName }</b>
													</h3>
													<p class="description">${item.introduction }</p>
													<p class="description">
														<b>${item.achievementCategory }</b>推荐&nbsp&nbsp<span
															class="publishTime">发布于：${item.finishTime }</span>
													</p>
													<p class="publishTime" style="float: right; color: gray">浏览量:${item.browseVolume }</p>
												</div>
											</div>
										</div>
									</div>
								</a>
							</c:forEach>
						</c:if>
					</div>
					<div class="siaeContent" id="siaeContent" style="display: none">
						<c:if test="${!empty siaeList}">
							<c:forEach items="${siaeList }" var="item" varStatus="status">
								<a
									href="${pageContext.request.contextPath}/achievement/toDetailSIAE?achievementId=${item.achievementId }">
									<div class="chengguo-out col-md-4"
										style="padding: 8px; height: 340px; margin-top: 1%;">
										<div class="doorPlank"
											style="padding: 2.5rem; background-color: white; height: 100%">
											<div class="rel-img">
												<img src="${pageContext.request.contextPath}/img/fire.png"
													style="position: absolute; margin-left: 0; margin-top: 0;">
												<img alt="" style="width: 100%; height: 150px;"
													src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.firstPicture }" />
											</div>
											<div class="info" style="width: 100%; height: 80px;">
												<div class="infoContent">
													<h3 class="achievementTitle">
														<b>${item.achievementName }</b>
													</h3>
													<p class="description">${item.introduction }</p>
													<p class="description">
														<b>${item.achievementCategory }</b>推荐&nbsp&nbsp<span
															class="publishTime">发布于：${item.finishTime }</span>
													</p>
													<p class="publishTime" style="float: right; color: gray">浏览量:${item.browseVolume }</p>
												</div>
											</div>
										</div>
									</div>
								</a>
							</c:forEach>
						</c:if>
					</div>
					<div class="aocscContent" id="aocscContent" style="display: none">
						<c:if test="${!empty aocscList}">
							<c:forEach items="${aocscList }" var="item" varStatus="status">
								<a
									href="${pageContext.request.contextPath}/achievement/toDetailAOCSC?achievementId=${item.achievementId }">
									<div class="chengguo-out col-md-4"
										style="padding: 8px; height: 340px; margin-top: 1%;">
										<div class="doorPlank"
											style="padding: 2.5rem; background-color: white; height: 100%">
											<div class="rel-img">
												<img src="${pageContext.request.contextPath}/img/fire.png"
													style="position: absolute; margin-left: 0; margin-top: 0;">
												<img alt="" style="width: 100%; height: 150px;"
													src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.firstPicture }" />
											</div>
											<div class="info" style="width: 100%; height: 80px;">
												<div class="infoContent">
													<h3 class="achievementTitle">
														<b>${item.achievementName }</b>
													</h3>
													<p class="description">${item.introduction }</p>
													<p class="description">
														<b>${item.achievementCategory }</b>推荐&nbsp&nbsp<span
															class="publishTime">发布于：${item.finishTime }</span>
													</p>
													<p class="publishTime" style="float: right; color: gray">浏览量:${item.browseVolume }</p>
												</div>
											</div>
										</div>
									</div>
								</a>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
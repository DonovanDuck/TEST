<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>信息页</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/css/achievement/achievementMain.css"
	rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body class="body">
	<div class="main">
		<div class="top">
			<jsp:include page="/jsp/top.jsp" flush="true" />
		</div>
		<div class="content">
			<div class="col-md-12 topColumn">
				<div class="col-md-8 leftSelect">
					<a class="btn btn-default"
						href="${pageContext.request.contextPath}/achievement/toAchievementMainPage"
						role="button">全部</a> <a class="btn btn-default"
						href="${pageContext.request.contextPath}/achievement/selectCategory?category=CourseExpand"
						role="button">课程拓展</a> <a class="btn btn-default"
						href="${pageContext.request.contextPath}/achievement/selectCategory?category=SIAE"
						role="button">大学生创新创业</a> <a class="btn btn-default"
						href="${pageContext.request.contextPath}/achievement/selectCategory?category=AOCSC"
						role="button">大学生竞赛</a> <a class="btn btn-default"
						href="${pageContext.request.contextPath}/achievement/selectCategory?category=GDFCS"
						role="button">毕业设计</a> <a class="btn btn-default"
						href="${pageContext.request.contextPath}/achievement/selectCategory?category=IURP"
						role="button">产学研</a>
				</div>
				<div class="col-md-4 rightSearch">
					<form
						action="${pageContext.request.contextPath}/achievement/toSearch">
						<input id="search" name="search" type="text" class="form-control"
							placeholder="请输入关键词" style="float: left; width: 60%">
						<button type="submit" class="btn btn-default" id="searchButton"
							style="float: left">搜索</button>
					</form>
				</div>
			</div>
			<div class="col-md-12 bottomColumn" style="min-height: 400px">
				<c:if test="${!empty iURPList}">
					<c:forEach items="${iURPList }" var="item" varStatus="status">
						<a
							href="${pageContext.request.contextPath}/achievement/toDetailIURP?achievementId=${item.projectId }">
							<div class="chengguo-out col-md-4"
								style="padding: 8px; height: 350px;margin-top: 1%;">
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
												产学研推荐&nbsp&nbsp<span class="publishTime">发布于：${item.endTime }</span>
											</p>
											<p class="publishTime" style="float: right; color: gray">浏览量:${item.browseVolume }</p>
										</div>
									</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</c:if>
				<c:if test="${!empty courseExpandList}">
					<c:forEach items="${courseExpandList }" var="item"
						varStatus="status">
						<a
							href="${pageContext.request.contextPath}/achievement/toDetailCourseExpand?achievementId=${item.achievementId }">
							<div class="chengguo-out col-md-4"
								style="padding: 8px; height: 350px;margin-top: 1%;">
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
												${item.achievementCategory }推荐&nbsp&nbsp<span
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
				<c:if test="${!empty gdfcsList}">
					<c:forEach items="${gdfcsList }" var="item" varStatus="status">
						<a
							href="${pageContext.request.contextPath}/achievement/toDetailGDFCS?achievementId=${item.achievementId }">
							<div class="chengguo-out col-md-4"
								style="padding: 8px; height: 350px;margin-top: 1%;">
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
												${item.achievementCategory }推荐&nbsp&nbsp<span
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
				<c:if test="${!empty siaeList}">
					<c:forEach items="${siaeList }" var="item" varStatus="status">
						<a
							href="${pageContext.request.contextPath}/achievement/toDetailSIAE?achievementId=${item.achievementId }">
							<div class="chengguo-out col-md-4"
								style="padding: 8px; height: 350px; margin-top: 1%;">
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
												${item.achievementCategory }推荐&nbsp&nbsp<span
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
				<c:if test="${!empty aocscList}">
					<c:forEach items="${aocscList }" var="item" varStatus="status">
						<a
							href="${pageContext.request.contextPath}/achievement/toDetailAOCSC?achievementId=${item.achievementId }">
							<div class="chengguo-out col-md-4"
								style="padding: 8px; height: 350px;margin-top: 1%;">
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
												${item.achievementCategory }推荐&nbsp&nbsp<span
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
	<a class="btn btn-primary"
		href="${pageContext.request.contextPath}/achievement/toUploadAchievement"
		role="button">上传新作品</a>
	<div class="footer"></div>
</body>
<%-- 备份代码
<div class="chengguo-out col-md-2">
	<div class="rel-img">
		<img src="${pageContext.request.contextPath}/img/fire.png"
			style="position: absolute; margin-left: 0; margin-top: 0;"> <img
			src="${pageContext.request.contextPath}/images/chengguo_01.jpg"
			alt="" style="width: 100%; height: 100%;">
	</div>
	<div class="info">
		<div class="title" style="font-size: 10px">
			<p> 名称：细胞分析</p>
			<p>分&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp类：产学研</p>
			<p>团队名称：生物学实验组</p>
			<p>完成时间：2006-12-22</p>
		</div>
	</div>
</div> --%>
</html>
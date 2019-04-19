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
<title>成果信息页</title>
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
						href="${pageContext.request.contextPath}/achievement/selectCategory?category=1"
						role="button">课程拓展</a> <a class="btn btn-default"
						href="${pageContext.request.contextPath}/achievement/selectCategory?category=2"
						role="button">大学生创新创业</a> <a class="btn btn-default"
						href="${pageContext.request.contextPath}/achievement/selectCategory?category=3"
						role="button">大学生竞赛</a> <a class="btn btn-default"
						href="${pageContext.request.contextPath}/achievement/selectCategory?category=4"
						role="button">毕业设计</a> <a class="btn btn-default"
						href="${pageContext.request.contextPath}/achievement/selectCategory?category=5"
						role="button">产学研</a>
						<a class="btn btn-default"
						href="${pageContext.request.contextPath}/achievement/toAchievementMainPage"
						role="button">全部</a>
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
				<c:if test="${!empty achievementList}">
					<c:forEach items="${achievementList }" var="item"
						varStatus="status">
						<a href="${pageContext.request.contextPath}/achievement/..">
							<div class="chengguo-out col-md-2" style="padding: 2px">
								<div class="rel-img">
									<img src="${pageContext.request.contextPath}/img/fire.png"
										style="position: absolute; margin-left: 0; margin-top: 0;">
									<img alt="" style="width: 100%; height: 100%"
										src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.achievementPhoto }" />
								</div>
								<div class="info">
									<div class="infoContent">
										<p>成果名称：${item.achievementName }</p>
										<p>类&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别：${item.achievementCategory
											}</p>
										<p>团队名称：${item.teamName }</p>
										<p>完成时间：${item.finishTime }</p>
									</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</c:if>
				<c:if test="${!empty iURPList}">
					<c:forEach items="${iURPList }" var="item" varStatus="status">
						<a href="${pageContext.request.contextPath}/achievement/..">
							<div class="chengguo-out col-md-2" style="padding: 2px">
								<div class="rel-img">
									<img src="${pageContext.request.contextPath}/img/fire.png"
										style="position: absolute; margin-left: 0; margin-top: 0;">
									<img alt="" style="width: 100%; height: 100%"
										src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.projectPhoto }" />
								</div>
								<div class="info">
									<div class="infoContent">
										<p>成果名称：${item.projectName }</p>
										<p>类&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别：产学研</p>
										<p>团队名称：${item.member }</p>
										<p>完成时间：${item.endTime }</p>
									</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	<div class="footer"></div>
	</div>
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
			<p>成果名称：细胞分析</p>
			<p>分&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp类：产学研</p>
			<p>团队名称：生物学实验组</p>
			<p>完成时间：2006-12-22</p>
		</div>
	</div>
</div> --%>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<div class="content" style="margin-top: 1%">
			<div class="col-md-12 topColumn">
				<div class="col-md-8 leftSelect"></div>
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
			<div class="col-md-12 bottomColumn" style="min-height: 400px;margin:0px">
				<c:if test="${!empty iURPList}">
					<c:forEach items="${iURPList }" var="item" varStatus="status">
						<a
							href="${pageContext.request.contextPath}/achievement/toDetailIURP?achievementId=${item.projectId }">
							<div class="chengguo-out col-md-4"
								style="padding: 8px; height: 330px; margin-top: 1%;">
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
											<h4 class="achievementTitle titleStyle">
												<b>${item.projectName }</b>
											</h4>
											<p class="description">
												<b>产学研</b>
											</p>
											<p class="description" style="height: 40px">${item.introduction }</p>
											<hr style="margin: 4px">
											<div>
												<p class="publishTime" style="float: left; color: gray">
													发布于：
													<fmt:formatDate value="${item.uploadTime }"
														pattern="yyyy-MM-dd" />
												</p>
												<p class="publishTime" style="float: right; color: gray">浏览量:${item.browseVolume }</p>
											</div>
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
	<div class="footer"></div>
</body>
</html>
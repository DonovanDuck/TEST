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
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/css/achievement/achievementDetail.css"
	rel="stylesheet" />
<link
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript">
	function submitButton() {
		$("#contentForm").submit();
	}
</script>
<script>
	    function chan(i) {
		var objUrl = getObjectURL(i.files[0]);
		if (objUrl) {
			$("#photos").attr("src", objUrl);
		}
	};
	function getObjectURL(file) {
		var url = null;
		if (window.createObjectURL != undefined) {
			url = window.createObjectURL(file);
		} else if (window.URL != undefined) {
			url = window.URL.createObjectURL(file);
		} else if (window.webkitURL != undefined) {
			url = window.webkitURL.createObjectURL(file);
		}
		return url;
	}
	function commentButton() {
		var g1 = document.getElementById('detailContent');
		var g2 = document.getElementById('commentContent');
		g1.style.display = "block";
		g2.style.display = "none";
	}
	function detailButton() {
		var g1 = document.getElementById('detailContent');
		var g2 = document.getElementById('commentContent');
		g1.style.display = "none";
		g2.style.display = "block";
	}
</script>
</head>
<body class="body">
	<div class="main">
		<div class="top">
			<jsp:include page="/jsp/top.jsp" flush="true" />
		</div>
		<div class="content">
			<div class="col-md-12 topColumn panel panel-default"
				style="margin-bottom: 0%; padding: 1%">
				<div class="col-md-8 picture">
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<c:forEach items="${pictureList }" var="item" varStatus="status">
								<li data-target="#carousel-example-generic"
									data-slide-to="${requestScope.offset+status.index+1}"></li>
							</c:forEach>
						</ol>
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img alt="" style="width: 100%; height: 400px;"
									src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${IURP.firstPicture }" />
							</div>
							<c:forEach items="${pictureList }" var="item">
								<div class="item">
									<img alt="" style="width: 100%; height: 400px;"
										src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.accessoryPath }" />
								</div>
							</c:forEach>
						</div>
						<a class="left carousel-control" href="#carousel-example-generic"
							role="button" data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">向前</span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"
							aria-hidden="true"></span> <span class="sr-only">向后</span>
						</a>
					</div>
				</div>
				<div class="col-md-4 introduceContent" style="padding: 0px">
					<div class="col-md-12">
						<div class="col-md-12" style="padding: 0px">
							<h3 style="margin-top: 10px">
								<b>${IURP.projectName }</b>
							</h3>
							<span style="float: right; font-size: 10px">浏览量:${IURP.browseVolume }</span>
						</div>
						<div class="col-md-12" style="padding: 3%">
							<span style="margin-left: 4%; color: #999">${IURP.introduction }</span>
						</div>
						<div class="col-md-12" style="padding: 0%; color: #999">
							<h5>
								负责人：${IURP.compere }&nbsp&nbsp&nbsp&nbsp团队成员：
								<c:forEach items="${memberList }" var="li">${li }
								</c:forEach>
							</h5>
						</div>
						<div class="col-md-12" style="padding: 0%">
							<span style="color: #999">价格：￥</span><span
								style="color: #f60; font-size: 40px">${IURP.price }</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-9 bottomColumn panel panel-default"
				style="padding: 0%; width: 74%; margin-top: 1%">
				<div class="panel-heading">
					<h3 class="panel-title">
						<button type="button" class="btn btn-default"
							onclick="commentButton()">项目详情</button>
						<button type="button" class="btn btn-default"
							onclick="detailButton()">评论</button>
					</h3>
				</div>
				<div class="panel-body">
					<div class="col-md-12 detailContent" id="detailContent"
						style="display: block; padding: 0%">
						<div class="col-md-12 startTimeAndEndTime">
							<h3>项目开始时间-项目截止时间</h3>
							<div class="col-md-12">${IURP.startTime }——${IURP.endTime }</div>
						</div>
						<div class="col-md-12">
							<h3>项目详情</h3>
							<div class="col-md-12">${IURP.projectDetail }</div>
						</div>
					</div>
					<div class="col-md-12 commentContent" id="commentContent"
						style="display: none; padding: 0%">
						<c:forEach items="${comment }" var="item" varStatus="states">
							<div class="col-md-12 panel panel-default" style="padding: 2%">
								<div class="col-md-3 text-center" style="">
									<img style="width: 80px; height: 80px;"
										src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.authorPicture }"
										alt="..." class="img-circle"> <br>
									<div class="col-md-12 " style="color: #B9B9B9; margin-top: 5%">${item.authorName }</div>
								</div>
								<div class="col-md-9"
									style="font-size: 12px; letter-spacing: 1px; line-height: 23px;">
									<div style="width: 105%; height: 100%">
										<span
											style="word-wrap: break-word; word-break: break-all; overflow: hidden;">${item.commentContent }</span>
									</div>
								</div>
								<p
									style="margin: 0px; margin-top: 10%; font-size: 10px; color: #B9B9B9;"
									class="text-right">${item.uploadTime }</p>
							</div>
						</c:forEach>
						<form
							action="${pageContext.request.contextPath}/achievement/insertAchievementComment?achievementId=${IURP.projectId }&category=产学研"
							method="post">
							<h4>我的评论</h4>
							<div class="publishComment col-md-12 "
								style="padding: 0px; margin: 0px;">
								<div class="col-md-12"
									style="font-size: 12px; letter-spacing: 1px; padding: 0px; margin: 0px; line-height: 23px;">
									<textarea onfocus="commentFocus()" class="form-control"
										id="commentContent" rows="5" name="commentContent"
										style="resize: none; height: 30%" placeholder="添加评论"></textarea>
									<button type="submit"
										class="btn btn-default btn-sm active pull-right"
										style="position: relative; left: -20px; top: -40px;">发表</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="relative col-md-3 panel panel-default"
				style="margin-top: 1%; margin-left: 1%; padding: 1%">
				<c:forEach items="${listIURP }" var="item" begin="0" end="2"
					varStatus="states">
					<a
						href="${pageContext.request.contextPath}/achievement/toDetailIURP?achievementId=${item.projectId }">
						<div class="col-md-12 " style="padding: 0px; margin-top: 2%">
							<div class="relativeImg col-md-8" style="padding: 0px">
								<img alt=""
									src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.firstPicture }"
									style="width: 100%; height: 100%">
							</div>
							<div class="relativeContent col-md-4" style="padding: 3px">
								<p>${item.projectName }</p>
								<p
									style="display: -webkit-box; -webkit-box-orient: vertical; overflow: hidden; overflow-x: hidden; overflow-y: hidden; word-break: break-all; text-overflow: ellipsis; -webkit-line-clamp: 1; color: gray;">${item.introduction }</p>
								<p>${item.compere }</p>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
		<div class="footer"></div>
	</div>
	<script>
		$(function() {
			$(".carousel").carousel({
				interval : 200
			});
		})
	</script>
</body>
</html>
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
		var g3 = document.getElementById('commentContentForTeacher');
		g1.style.display = "block";
		g2.style.display = "none";
		g3.style.display = "none";
	}
	function detailButton() {
		var g1 = document.getElementById('detailContent');
		var g2 = document.getElementById('commentContent');
		var g3 = document.getElementById('commentContentForTeacher');
		g1.style.display = "none";
		g2.style.display = "block";
		g3.style.display = "none";
	}
	function teacherCommentButton() {
		var g1 = document.getElementById('detailContent');
		var g2 = document.getElementById('commentContent');
		var g3 = document.getElementById('commentContentForTeacher');
		g1.style.display = "none";
		g2.style.display = "none";
		g3.style.display = "block";
	}

	function submitCommentButStu() {
		var judge = true;
		$.ajax({
			async : false,
			cache : false,
			url : "${pageContext.request.contextPath}/achievement/loginJudge",
			type : "get",
			dataType : "text",
			success : function(result) {
				if (result.length != 0 && result != "null") {
					judge = false;
					alert(result);
				}
			}
		});
		if (judge) {
			var id = $("#IURPID").val();
			var content = $("#addCommentContentStu").val();
			var path = "${pageContext.request.contextPath}/achievement/insertAchievementComment?achievementId="
					+ id + "&category=产学研" + "&addCommentContent=" + content;
			$
					.ajax({
						async : false,
						cache : false,
						url : path,
						contentType : 'application/json;charset=UTF-8',
						traditional : true,
						dataType : "text",
						success : function(result) {
							var arr = eval(result);
							$("#stuCommentContentList").empty();
							for (var i = 0; i < arr.length; i++) {
								var msg = "<div class='col-md-12 panel panel-default' style='padding: 2%'><div class='col-md-3 text-center'><img style='width: 80px; height: 80px;' src='${pageContext.request.contextPath}/jsp/showImg.jsp?path="
										+ arr[i].authorPicture
										+ "'class='img-circle'><br><div class='col-md-12' style='color: #B9B9B9; margin-top: 5%'>"
										+ arr[i].authorName
										+ "</div></div><div class='col-md-9' style='font-size: 12px; letter-spacing: 1px; line-height: 23px;'><div style='width: 105%; height: 100%'><span style='word-wrap: break-word; word-break: break-all; overflow: hidden;'>"
										+ arr[i].commentContent
										+ "</span></div></div><p style='margin: 0px; margin-top: 12%; font-size: 10px; color: #B9B9B9;' class='text-right'>"
										+ arr[i].uploadTime + "</p></div>";
								$("#stuCommentContentList").append(msg);
							}
							$("#addCommentContentStu").val("");
						},
						error : function() {
						}
					});
		}
	}

	function submitTeaCommentBut() {
		var judge = true;
		$.ajax({
			async : false,
			cache : false,
			url : "${pageContext.request.contextPath}/achievement/loginJudge",
			type : "get",
			dataType : "text",
			success : function(result) {
				if (result.length != 0 && result != "null") {
					judge = false;
					alert(result);
				}
			}
		});
		if (judge) {
			var id = $("#IURPID").val();
			var content = $("#addTeaCommentContent").val();
			var score = $("#achievementScore").val();
			var path = "${pageContext.request.contextPath}/achievement/insertTeaAchievementComment?achievementId="
					+ id
					+ "&category=产学研"
					+ "&addCommentContent="
					+ content
					+ "&score=" + score;
			$
					.ajax({
						async : false,
						cache : false,
						url : path,
						contentType : 'application/json;charset=UTF-8',
						traditional : true,
						dataType : "text",
						success : function(result) {
							var arr = eval(result);
							$("#teaCommentContentList").empty();
							for (var i = 0; i < arr.length; i++) {
								var msg = "<div class='col-md-12 panel panel-default' style='padding: 2%'><div class='col-md-3 text-center'><img style='width: 80px; height: 80px;' src='${pageContext.request.contextPath}/jsp/showImg.jsp?path="
										+ arr[i].authorPicture
										+ "'class='img-circle'><br><div class='col-md-12' style='color: #B9B9B9; margin-top: 5%'>"
										+ arr[i].authorName
										+ "</div></div><div class='col-md-9' style='font-size: 12px; letter-spacing: 1px; line-height: 23px;'><div style='width: 105%; height: 100%'><span style='word-wrap: break-word; word-break: break-all; overflow: hidden;'>"
										+ arr[i].commentContent
										+ "</span></div></div><p style='margin: 0px; margin-top: 12%; font-size: 10px; color: #B9B9B9;' class='text-right'>"
										+ arr[i].uploadTime + "</p></div>";
								$("#teaCommentContentList").append(msg);
							}
							$("#addTeaCommentContent").val("");
							$("#achievementScore").val("");
						},
						error : function() {
						}
					});
		}
	}
</script>
<script type="text/javascript">
	function focousCommentContent() {
		$.ajax({
			async : true,
			cache : false,
			url : "${pageContext.request.contextPath}/achievement/loginJudge",
			type : "get",
			dataType : "text",
			success : function(result) {
				if (result.length != 0 && result != "null") {
					alert(result);
				}
			}
		})
	};
	function checkScore() {
		var score = $("#achievementScore").val();
		if (parseInt(score)<=0||parseInt(score)>100) {
			$("#achievementScore").val("");
			alert("输入合法成绩");
		}
	}
</script>
</head>
<body class="body">
	<div class="main">
		<div class="top">
			<jsp:include page="/jsp/top.jsp" flush="true" />
		</div>
		<div class="content" style="margin-top: 1%">
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
								<b>${IURP.projectName }</b> <span class="pull-right"
									style="font-size: 10px; margin-top: 3%">浏览量:${IURP.browseVolume }</span>
							</h3>
						</div>
						<div class="col-md-12" style="padding: 3%">
							<span style="margin-left: 4%; color: #999">${IURP.introduction }</span>
						</div>
						<div class="col-md-12" style="padding: 0%; color: #999">
							<h5>
								负&nbsp&nbsp责&nbsp&nbsp人：${IURP.compere }&nbsp&nbsp&nbsp&nbsp <br>
								<br>
								<c:if test="${not empty memberList}">团队成员：<c:forEach
										items="${memberList }" var="li">${li }&nbsp&nbsp&nbsp</c:forEach>
									<br>
									<br>
								</c:if>
								作品类别：产学研作品
							</h5>
						</div>
						<c:if test="${IURP.isshare == '是'}">
							<div class="col-md-12" style="padding: 0%">
								<span style="color: #999">价格：￥</span><span
									style="color: #f60; font-size: 40px">${IURP.price }</span>
							</div>
						</c:if>
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
							onclick="teacherCommentButton()">教师评价</button>
						<button type="button" class="btn btn-default"
							onclick="detailButton()">评论</button>
					</h3>
				</div>
				<div class="panel-body">
					<div class="col-md-12 detailContent" id="detailContent"
						style="display: block; padding: 0%">
						<div class="col-md-12 startTimeAndEndTime">
							<h3>项目完成时间</h3>
							<div class="col-md-12">${IURP.endTime }</div>
						</div>
						<div class="col-md-12">
							<h3>项目详情</h3>
							<div class="col-md-12">${IURP.projectDetail }</div>
						</div>
					</div>
					<div class="col-md-12 commentContentForTeacher"
						id="commentContentForTeacher" style="display: none; padding: 0%">
						<div id="teaCommentContentList">
							<c:if test="${not empty commentListTea }">
								<c:forEach items="${commentListTea }" var="item"
									varStatus="states">
									<div class="col-md-12 panel panel-default" style="padding: 2%">
										<div class="col-md-3 text-center" style="">
											<img style="width: 80px; height: 80px;"
												src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.authorPicture }"
												alt="..." class="img-circle"> <br>
											<div class="col-md-12 "
												style="color: #B9B9B9; margin-top: 5%">${item.authorName }</div>
										</div>
										<div class="col-md-9"
											style="font-size: 12px; letter-spacing: 1px; line-height: 23px;">
											<div style="width: 105%; height: 100%">
												<span
													style="word-wrap: break-word; word-break: break-all; overflow: hidden;">${item.commentContent }</span>
											</div>
										</div>
										<p
											style="margin: 0px; margin-top: 12%; font-size: 10px; color: #B9B9B9;"
											class="text-right">${item.uploadTime }</p>
									</div>
								</c:forEach>
							</c:if>
						</div>
						<h4>我的评论</h4>
						<div class="publishComment col-md-12 "
							style="padding: 0px; margin: 0px;">
							<div class="col-md-12"
								style="font-size: 12px; letter-spacing: 1px; padding: 0px; margin: 0px; line-height: 23px;">
								<textarea class="form-control" id="addTeaCommentContent"
									rows="5" name="addTeaCommentContent"
									style="resize: none; height: 30%" placeholder="添加评论"
									onclick="focousCommentContent();"></textarea>
								<input type="text" style="display: none" id="TeaIURPID"
									name="TeaIURPID" value="${IURP.projectId }"><input
									onblur="checkScore()" type="number" id="achievementScore"
									name="achievementScore" placeholder="成果得分"
									style="position: relative; width: 15%" min="0" max="100">
								<button class="btn btn-default btn-sm active pull-right"
									type="button" onclick="submitTeaCommentBut();"
									style="position: relative;">发表</button>
							</div>
						</div>
					</div>
					<div class="col-md-12 commentContent" id="commentContent"
						style="display: none; padding: 0%">
						<div id="stuCommentContentList">
							<c:if test="${not empty commentListStu }">
								<c:forEach items="${commentListStu }" var="item"
									varStatus="states">
									<div class="col-md-12 panel panel-default" style="padding: 2%">
										<div class="col-md-3 text-center" style="">
											<img style="width: 80px; height: 80px;"
												src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.authorPicture }"
												alt="..." class="img-circle"> <br>
											<div class="col-md-12 "
												style="color: #B9B9B9; margin-top: 5%">${item.authorName }</div>
										</div>
										<div class="col-md-9"
											style="font-size: 12px; letter-spacing: 1px; line-height: 23px;">
											<div style="width: 105%; height: 100%">
												<span
													style="word-wrap: break-word; word-break: break-all; overflow: hidden;">${item.commentContent }</span>
											</div>
										</div>
										<p
											style="margin: 0px; margin-top: 12%; font-size: 10px; color: #B9B9B9;"
											class="text-right">${item.uploadTime }</p>
									</div>
								</c:forEach>
							</c:if>
						</div>
						<h4>我的评论</h4>
						<div class="publishComment col-md-12 "
							style="padding: 0px; margin: 0px;">
							<div class="col-md-12"
								style="font-size: 12px; letter-spacing: 1px; padding: 0px; margin: 0px; line-height: 23px;">
								<textarea class="form-control" id="addCommentContentStu"
									rows="5" name="addCommentContentStu"
									style="resize: none; height: 30%" placeholder="添加评论"
									onclick="focousCommentContent();"></textarea>
								<input type="text" style="display: none" id="IURPID"
									name="IURPID" value="${IURP.projectId }">
								<button class="btn btn-default btn-sm active pull-right"
									type="button" onclick="submitCommentButStu();"
									style="position: relative; left: -20px; top: -40px;">发表</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="relative col-md-3 panel panel-default"
				style="margin-top: 1%; margin-left: 1%; padding: 6px">
				<h4 style="margin: 0px; margin-top: 1%;">优秀作品</h4>
				<hr style="margin: 0px; margin-top: 1%; margin-bottom: 2%">
				<c:forEach items="${listIURP }" var="item" begin="0" end="2"
					varStatus="states">
					<a
						href="${pageContext.request.contextPath}/achievement/toDetailIURP?achievementId=${item.projectId }">
						<div class="col-md-12 panel panel-default"
							style="padding: 4px; margin: 0%; height: 180px; margin-top: 2%">
							<div class="outer">
								<div class="img" style="width: 100%">

									<img
										src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.firstPicture }"
										alt="" style="width: 100%; height: 130px; min-width: 100%;" />
									<div class="zhezhao">
										<p class="p1">${item.introduction }</p>
									</div>
								</div>
								<div class="text">
									<p>
										项目名：${item.projectName }<br />负责人：${item.compere }
									</p>
								</div>
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
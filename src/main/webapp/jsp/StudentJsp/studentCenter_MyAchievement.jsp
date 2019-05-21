<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title></title>
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
<script type="text/javascript">
	function courseExpand() {
		var courseExpand = document.getElementById("courseExpandContent");
		var siae = document.getElementById("siaeContent");
		var iurp = document.getElementById("iurpContent");
		var gdfcs = document.getElementById("gdfcsContent");
		var aocsc = document.getElementById("aocscContent");
		courseExpand.style.display = "block";
		siae.style.display = "none";
		iurp.style.display = "none";
		gdfcs.style.display = "none";
		aocsc.style.display = "none";
		document.getElementById("courseExpand").style.background = "#00bc9b";
		document.getElementById("SIAE").style.background = "white";
		document.getElementById("IURP").style.background = "white";
		document.getElementById("GDFCS").style.background = "white";
		document.getElementById("AOCSC").style.background = "white";
	}
	function SIAE() {
		var courseExpand = document.getElementById("courseExpandContent");
		var siae = document.getElementById("siaeContent");
		var iurp = document.getElementById("iurpContent");
		var gdfcs = document.getElementById("gdfcsContent");
		var aocsc = document.getElementById("aocscContent");
		courseExpand.style.display = "none";
		siae.style.display = "block";
		iurp.style.display = "none";
		gdfcs.style.display = "none";
		aocsc.style.display = "none";
		document.getElementById("courseExpand").style.background = "white";
		document.getElementById("SIAE").style.background = "#00bc9b";
		document.getElementById("IURP").style.background = "white";
		document.getElementById("GDFCS").style.background = "white";
		document.getElementById("AOCSC").style.background = "white";
	}
	function IURP() {
		var courseExpand = document.getElementById("courseExpandContent");
		var siae = document.getElementById("siaeContent");
		var iurp = document.getElementById("iurpContent");
		var gdfcs = document.getElementById("gdfcsContent");
		var aocsc = document.getElementById("aocscContent");
		courseExpand.style.display = "none";
		siae.style.display = "none";
		iurp.style.display = "block";
		gdfcs.style.display = "none";
		aocsc.style.display = "none";
		document.getElementById("courseExpand").style.background = "white";
		document.getElementById("SIAE").style.background = "white";
		document.getElementById("IURP").style.background = "#00bc9b";
		document.getElementById("GDFCS").style.background = "white";
		document.getElementById("AOCSC").style.background = "white";
	}
	function GDFCS() {
		var courseExpand = document.getElementById("courseExpandContent");
		var siae = document.getElementById("siaeContent");
		var iurp = document.getElementById("iurpContent");
		var gdfcs = document.getElementById("gdfcsContent");
		var aocsc = document.getElementById("aocscContent");
		courseExpand.style.display = "none";
		siae.style.display = "none";
		iurp.style.display = "none";
		gdfcs.style.display = "block";
		aocsc.style.display = "none";
		document.getElementById("courseExpand").style.background = "white";
		document.getElementById("SIAE").style.background = "white";
		document.getElementById("IURP").style.background = "white";
		document.getElementById("GDFCS").style.background = "#00bc9b";
		document.getElementById("AOCSC").style.background = "white";
	}
	function AOCSC() {
		var courseExpand = document.getElementById("courseExpandContent");
		var siae = document.getElementById("siaeContent");
		var iurp = document.getElementById("iurpContent");
		var gdfcs = document.getElementById("gdfcsContent");
		var aocsc = document.getElementById("aocscContent");
		courseExpand.style.display = "none";
		siae.style.display = "none";
		iurp.style.display = "none";
		gdfcs.style.display = "none";
		aocsc.style.display = "block";
		document.getElementById("courseExpand").style.background = "white";
		document.getElementById("SIAE").style.background = "white";
		document.getElementById("IURP").style.background = "white";
		document.getElementById("GDFCS").style.background = "white";
		document.getElementById("AOCSC").style.background = "#00bc9b";
	}
</script>
</head>
<body>
	<jsp:include page="/jsp/top.jsp" flush="true" />
	<main>
	<div class="main_t">
		<div class="images">
			<img
				src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${student.faceImg }"
				style="width: 100%; height: 100%;" />
		</div>
		<div class="message">
			&nbsp;&nbsp;
			<h2>&nbsp;&nbsp;&nbsp;${student.studentNickName }</h2>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;${student.studentId }</p>
		</div>
	</div>
	<div class="main_b">
		<div class="main_b_l">
			<a
				href="${pageContext.request.contextPath}/student/toStudentCenter_MyCourse">
				<div class="nav1">
					<p>
						<img
							src="${pageContext.request.contextPath}/images/studentCenterImg/k1.png"
							alt="" />我的课程
					</p>
				</div>
			</a> <a
				href="${pageContext.request.contextPath}/student/toStudentCenter_MyClass">
				<div class="nav1">
					<p>
						<img
							src="${pageContext.request.contextPath}/images/studentCenterImg/b1.png"
							alt="" />我的班级
					</p>
				</div>
			</a> <a
				href="${pageContext.request.contextPath}/student/toStudentCenter_MyAchievement">
				<div class="nav1">
					<p>
						<img
							src="${pageContext.request.contextPath}/images/studentCenterImg/t1.png"
							alt="" />我的成果
					</p>
				</div>
			</a> <a
				href="${pageContext.request.contextPath}/student/toStudentCenter_MyDiscuss">
				<div class="nav1">
					<p>
						<img
							src="${pageContext.request.contextPath}/images/studentCenterImg/t1.png"
							alt="" />我的讨论
					</p>
				</div>
			</a> <a
				href="${pageContext.request.contextPath}/student/toStudentCenter_MyInfo">
				<div class="nav1">
					<p>
						<img
							src="${pageContext.request.contextPath}/images/studentCenterImg/g1.png"
							alt="" />个人信息
					</p>
				</div>
			</a>
		</div>
		<div class="main_b_r" id="r1">
			<div class="main_b_r_t">
				<div class="courseExpand" id="courseExpand" onclick="courseExpand()"
					style="background-color: #00bc9b; cursor: pointer">
					<p>课程拓展</p>
				</div>
				<div class="SIAE" id="SIAE" onclick="SIAE()"
					style="background-color: white; cursor: pointer">
					<p>大学生创新创业</p>
				</div>
				<div class="IURP" id="IURP" onclick="IURP()"
					style="background-color: white; cursor: pointer">
					<p>产学研</p>
				</div>
				<div class="GDFCS" id="GDFCS" onclick="GDFCS()"
					style="background-color: white; cursor: pointer">
					<p>大学生毕业设计</p>
				</div>
				<div class="AOCSC" id="AOCSC" onclick="AOCSC()"
					style="background-color: white; cursor: pointer">
					<p>大学生竞赛</p>
				</div>
				<div class="AOCSC">
					<p>
						<a
							href="${pageContext.request.contextPath}/achievement/toUploadAchievement"
							id="p2">上传作品</a>
					</p>
				</div>
			</div>
			<div class="hr"></div>
			<div id="barcon" name="barcon">
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
	</main>
	<jsp:include page="/jsp/footer.jsp" flush="true" />
</body>
</html>
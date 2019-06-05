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
<title></title>
<style type="text/css">
a:link {
	color: black;
}

a:visited {
	color: black;
}

a:hover {
	color: black;
}

a:active {
	color: black;
}
</style>
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/own.css" /> --%>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- <script>
	function termSelect() {
		if ($('#select option:selected').val() == '') {
			var newUrl = '${pageContext.request.contextPath}/teacher/teacherLogin'; //设置新提交地址
			$("#myform").attr('action', newUrl); //通过jquery为action属性赋值
		}
		if ($('#select option:selected').val() == 'student') {
			var newUrl = '${pageContext.request.contextPath}/student/LoginStudent'; //设置新提交地址
			$("#myform").attr('action', newUrl); //通过jquery为action属性赋值
		}
		if ($('#select option:selected').val() == 'manager') {
			var newUrl = '${pageContext.request.contextPath}/admin/LoginAdmin'; //设置新提交地址
			$("#myform").attr('action', newUrl); //通过jquery为action属性赋值

		}
	}
</script> -->

<script type="text/javascript">
	$(function() {
		$("#selectTerm")
				.on(
						"change",
						function() {
							var id = $(this).children('option:selected').val();
							if (id == 0) {
								path = "${pageContext.request.contextPath}/teacher/toMyClassList";
							} else {
								path = "${pageContext.request.contextPath}/teacher/selectVirtualClassByTerm/"
										+ id;
							}
							$("#selectButtonA").attr("href", path);
							;
							$("#selectButton").click();
						})
	})
</script>
<style type="text/css">
.b1_r p {
	margin: 0px;;
	margin-top: 1%;
}
</style>
</head>
<body>

	<div class="main_b_r" id="r1">
		<div class="sx" style="margin-top: 1%">
			<div class="sx_r">
				<p>
					<span>开课学期:</span><select
						style="width: 70%; height: 24px; float: right;" id="selectTerm"
						name="selectTerm">
						<option>选择学期</option>
						<option value="0">全部班级</option>
						<c:forEach items="${termList }" var="listTerm">
							<option value="${listTerm.termId }">
									${listTerm.startYear }-${listTerm.endYear }&nbsp&nbsp${listTerm.term}
								</option>
						</c:forEach>
					</select>
				</p>
			</div>
		</div>
		<div class="table">
			<c:forEach items="${virtualClassList }" var="item" varStatus="status">
				<a target="_top"
					href="${pageContext.request.contextPath}/teacher/toClassDetail?virtualClassNum=${item.virtualClassNum }&virtualClassName=${item.virtualClassName }&courseName=${item.virtualCourseName }">
					<div class="b1" style="height: 150px; margin-top: 1%">
						<div class="b1_l" style="width: 27%; float: left; height: 90%">
							<c:if test="${empty item.faceImg }">
								<img
									src="${pageContext.request.contextPath}/img/workType/classDefault.jpg"
									alt="" style="width: 100%; height: 100%;" />
							</c:if>
							<c:if test="${not empty item.faceImg }">
								<img
									src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.faceImg }"
									alt="" style="width: 100%; height: 90%;" />
							</c:if>
						</div>
						<div class="b1_r"
							style="width: 55%; float: left; height: 100%; padding: 2%">
							<p class="h">${item.virtualClassName }</p>
							<p class="p1">
								授课班级：
								<c:forEach items="${item.realClassList }" var="realClass">${realClass.realClassNum }班<span>&nbsp;&nbsp;&nbsp;</span>
								</c:forEach>
							</p>
							<p class="p1">课程名称：${item.virtualCourseName }</p>
							<p class="p2">开课学期：${item.term }</p>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
	<a id="selectButtonA" name="selectButtonA" href="">
		<button id="selectButton" name="selectButton" style="display: none">
		</button>
	</a>
</body>
</html>
<%-- <div id="r2">
		<div class="sx">
			<div class="sx_r">
				<p>
					<span>开课学期:</span> <select placeholder=""
						tyle="width: 70%; height: 24px; float: right;"
						onchange="termSelect()">
						<c:forEach items="${termList }" var="term">
							<option value="term.termId"
								<c:if test="${term.startYear=='2019'}&&${term.term=='第一学期' }"> selected="selected" </c:if>${term.startYear }-${term.endYear }${term.term }</option></c:forEach></select>
				</p>
			</div>
		</div>
		<!--放筛选学期-->
		<div class="table">
			<c:forEach items="${virtualClassList }" var="virtualClass"
				varStatus="status">
				<a target="_top"
					href="${pageContext.request.contextPath}/teacher/toClassDetail?virtualClassNum=${virtualClass.virtualClassNum }&virtualClassName=${virtualClass.virtualClassName }">

					<div class="b1">
						<div class="b1_l">
							<img
								src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${virtualClass.faceImg }"
								alt="" />
						</div>
						<div class="b1_r">
							<p class="h">${virtualClass.virtualClassName }</p>
							<p class="p1">
								授课班级：
								<c:forEach items="${virtualClass.realClassList }"
									var="realClass">
	            	${realClass.realClassNum }<span>&nbsp;&nbsp;&nbsp;</span>
								</c:forEach>
							</p>
							<p class="p1">课程名称：${virtualClass.virtualCourseName }</p>

							<p class="p2" id="term">开课学期：&nbsp;${virtualClass.term }</p>
						</div>
					</div>
					<hr />
				</a>
			</c:forEach>
		</div>
	</div>
	</div> --%>
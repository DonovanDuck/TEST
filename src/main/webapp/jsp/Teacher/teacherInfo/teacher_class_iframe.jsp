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
<<<<<<< HEAD
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/own.css" />
</html>
<body>
	<div id="r2">
		<table border="1" style="margin-left: 20px; margin-top: 20px;">
			<tr>
				<th>序号</th>
				<th>课程图片</th>
				<th>课程名称</th>
				<th>班级名称</th>
				<th>授课班级</th>
				<th>开课学期</th>
			</tr>
			<c:forEach items="${virtualClassList }" var="virtualClass"
				varStatus="status">
				<a target="_parent"
					href="${pageContext.request.contextPath}/teacher/toClassDetail?virtualClassNum=${virtualClass.virtualClassNum }&virtualClassName=${virtualClass.virtualClassName }">
					<tr>
						<td>${ status.index + 1}</td>
						<td><img src="../../teacher/images/tu6.jpg" alt="" /></td>
						<td>${virtualClass.virtualCourseName }</td>
						<td>${virtualClass.virtualClassName }</td>
						<td><c:forEach items="${virtualClass.realClassList }"
								var="realClass">
	            	${realClass.realClassNum }<br />
							</c:forEach></td>
						<td>${virtualClass.term }</td>
					</tr>
				</a>
			</c:forEach>

		</table>
	</div>
</body>
=======
<script type="text/javascript">
	function openRes(element) {
		virtualClassNum = element.children[6].innerHTML;
	}
</script>
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/own.css" />
<body>
	<div id="r2">
		<table border="1"
			style="margin-left: 20px; margin-top: 20px; width: 100%;">
			<tbody>
				<tr>
					<th>序号</th>
					<th>课程图片</th>
					<th>课程名称</th>
					<th>班级名称</th>
					<th>授课班级</th>
					<th>开课学期</th>
				</tr>
			</tbody>
			<c:forEach items="${virtualClassList }" var="virtualClass"
				varStatus="status">
				<tr onClick="openRes(this)">
					<td>${ status.index + 1}</td>
					<td><img
						src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${virtualClass.faceImg }"
						alt="" /></td>
					<td>${virtualClass.virtualCourseName }</td>
					<td>${virtualClass.virtualClassName }</td>
					<td><c:forEach items="${virtualClass.realClassList }"
							var="realClass">
            	${realClass.realClassNum }<br />
						</c:forEach></td>
					<td>${virtualClass.term }</td>
					<td style="display: none">${virtualClass.virtualClassNum }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
>>>>>>> 3d2425fbb7282633924d53aab23cc4268f1a7cb2

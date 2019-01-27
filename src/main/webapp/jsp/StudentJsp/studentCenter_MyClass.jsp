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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/student/s-own.css" />
</head>
<body>
	<header> </header>
	<main>
	<div class="main_t">
		<div class="images">
			<img src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${student.faceImg }" style="width:100%;height:100%;" alt="" />
		</div>
		    <div class="message">
            &nbsp;&nbsp;<h2>&nbsp;&nbsp;&nbsp;${student.studentNickName }</h2>
            <p> &nbsp;&nbsp;&nbsp;&nbsp;${student.studentId }</p>
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
			<table border="1"
				style="margin-left: 20px; margin-top: 20px; width: 96%;">
				<tr>
					<th>序号</th>
					<th>课程图片</th>
					<th>课程名称</th>
					<th>班级名称</th>
					<th>开课学期</th>
				</tr>
				<c:forEach items="${virtualClassList }" var="virtualClass"
					varStatus="status">
					<tr>
						<td>${ status.index + 1}</td>
						<td><img src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${virtualClass.faceImg }" style="width:100%;height:100%;" alt="" /></td>
						<td>${virtualClass.virtualCourseName }</td>
						<td>${virtualClass.virtualClassName }</td>
						<td>${virtualClass.term }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</main>
	<footer></footer>
</body>
</html>
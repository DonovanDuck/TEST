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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/student/s-own.css" />
<script>
	function f() {
		var w1 = document.getElementById("w1");
		var w2 = document.getElementById("w2");
		var p1 = document.getElementById("p1");
		var p2 = document.getElementById("p2");
		var k1 = document.getElementById("k1");
		var k2 = document.getElementById("k2");
		w1.style.background = "#00bc9b";
		w2.style.background = "white";
		p1.style.color = "white";
		p2.style.color = "black";
		k1.style.display = "block";
		k2.style.display = "none";
	}
	function g() {
		var w1 = document.getElementById("w1");
		var w2 = document.getElementById("w2");
		var p1 = document.getElementById("p1");
		var p2 = document.getElementById("p2");
		var k1 = document.getElementById("k1");
		var k2 = document.getElementById("k2");
		w2.style.background = "#00bc9b";
		w1.style.background = "white";
		p2.style.color = "white";
		p1.style.color = "black";
		k2.style.display = "block";
		k1.style.display = "none";
	}
</script>
</head>
<body>
	<header> </header>
	<main>
	<div class="main_t">
		<div class="images">
			<img
				src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${student.faceImg }"
				style="width: 100%; height: 100%;" alt="" />
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
				<div class="word1" id="w1" onclick="f()">
					<p>
						<a href="#" id="p1">我学习的课程</a>
					</p>
				</div>
				<div class="word2" id="w2" onclick="g()">
					<p>
						<a href="#" id="p2">我关注的课程</a>
					</p>
				</div>
			</div>
			<div class="hr"></div>
			<div class="main_b_r_b" id="k1">
				<c:forEach items="${listCourse_MyCourse }" var="course"
					varStatus="loop">
					<a
						href="${pageContext.request.contextPath}/teacher/toCourseDetail/${course.courseId }"
						target="_top">
						<div class="lesson">
							<div class="lesson_l">
								<img
									src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${course.faceImg }"
									alt="" />
							</div>
							<div class="lesson_r">
								<h3>${course.courseName }</h3>
								<p>创课老师：${listCourseId_MyCourse_publishName[loop.count-1]}</p>
								<p>开课老师：王五</p>
								<p>开课时间：2018-2019年 第二学期</p>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
			<div class="main_b_r_b" id="k2">
				<c:forEach items="${listCourse_Myattention }" var="course"
					varStatus="loop">
					<a
						href="${pageContext.request.contextPath}/teacher/toCourseDetail/${course.courseId }"
						target="_top">
						<div class="lesson">
							<div class="lesson_l">
								<img
									src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${course.faceImg }"
									alt="" />
							</div>
							<div class="lesson_r">
								<h3>${course.courseName }</h3>
								<p>创课老师：${listCourseId_Myattention_publishName[loop.count-1]}</p>
								<p>开课老师：王五</p>
								<p>开课时间：2018-2019年 第二学期</p>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
	</div>
	</main>
	<footer></footer>
</body>
</html>
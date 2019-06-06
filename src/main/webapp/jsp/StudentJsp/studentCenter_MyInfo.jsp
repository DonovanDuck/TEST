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
	function bj() {
		var top = document.getElementById('top');
		var g1 = document.getElementById('g1');
		var g2 = document.getElementById('g2');
		top.style.display = "none";
		g1.style.display = "none";
		g2.style.display = "block";
	}
	function commitButton() {
		var form = document.getElementById('infoForm');
		form.submit();
	}
	function cancelButton() {
		window.history.go(-1);//返回上一页
	}
</script>
<script type="text/javascript">
	  $(function() {
		$("#passwordAgain").blur(function() {
			var a = $('#password').val();
			//alert(a);
			var b = $('#passwordAgain').val();
			//alert(b);
			if (a != b) {
				alert("两次输入密码不一致");
			}
		})
	})
</script>
</head>
<body>
	<jsp:include page="/jsp/top.jsp" flush="true"/>
	<main>
	<div class="main_t" style="background: #fff;">
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
				href="${pageContext.request.contextPath}/student/toStudentCenter_MyClass">
				<div class="nav1">
					<p>
						<img
							src="${pageContext.request.contextPath}/images/studentCenterImg/b1.png"
							alt="" />我的任务
					</p>
				</div>
			</a>
			<a
				href="${pageContext.request.contextPath}/student/toStudentCenter_MyCourse">
				<div class="nav1">
					<p>
						<img
							src="${pageContext.request.contextPath}/images/studentCenterImg/k1.png"
							alt="" />我的课程
					</p>
				</div>
			</a>
			 <a
				href="${pageContext.request.contextPath}/student/toStudentCenter_MyAchievement">
				<div class="nav1">
					<p>
						<img
							src="${pageContext.request.contextPath}/images/studentCenterImg/t1.png"
							alt="" />我的成果
					</p>
				</div>
			</a> 
			<a
				href="#">
				<div class="nav1">
					<p>
						<img
							src="${pageContext.request.contextPath}/images/studentCenterImg/t1.png"
							alt="" />我的挑战
					</p>
				</div>
			</a>
			<a
				href="#">
				<div class="nav1">
					<p>
						<img
							src="${pageContext.request.contextPath}/images/studentCenterImg/t1.png"
							alt="" />我的翻转
					</p>
				</div>
			</a>  
			<a
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
							alt="" />修改信息
					</p>
				</div>
			</a>
		</div>
		<div class="main_b_r">
			<div class="r5_t" id="top">
				<div class="h3">
					<p>我的信息</p>
				</div>
				<div class="bj" onclick="bj()">
					<p>编辑个人信息</p>
				</div>
			</div>
			<div class="r5_b" id="g1">
			<hr><div class="r5_b_body">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号：${student.studentId }</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;昵称：${student.studentNickName }</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：${student.studentName }</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别：${student.studentGender }</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;出生年月：${student.studentId }</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;政治面貌：${student.studentId }</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系别：${student.studentCategory }</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专业：${category.categoryName }</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;学习成果：${student.studentId }</p>
				<p>产学研项目：${student.studentId }</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;获奖情况：${student.studentId }</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其它：${student.studentId }</p>
			</div>
			</div>
			<div id="g2">
				<div class="r5_t">
					<div class="h3">
						<p>我的信息</p>
					</div>
				</div>
				<hr>
				<form
					action="${pageContext.request.contextPath}/student/updateStudent"
					id="infoForm" style="margin-left: 10%;">
					昵称：<br /> <input type="text" placeholder="请输入昵称：" id="nickName"
						name="nickName" value="${student.studentNickName }" /><br /> 密码：<br />
					<input type="password" placeholder="请输入密码：" id="password"
						name="password" /><br /> 确认密码：<br /> <input type="password"
						placeholder="请输入密码：" id="passwordAgain" name="passwordAgain" /><br />
					出生年月日：<br /> <input type="text" placeholder="请输入年月日：" id="date"
						name="date" value="${student.studentId }" /><br /> 政治面貌：<br />
					<input type="text" placeholder="请输入政治面貌：" id="part" name="part"
						value="${student.studentId }" /><br /> 学习成果：<br />
					<textarea name="" id="1" cols="30" rows="4" id="studyResult"
						name="studyResult" placeholder="${student.studentId }"></textarea>
					<br /> 产学研项目：<br />
					<textarea name="" id="2" cols="30" rows="4" id="" name=""
						placeholder="${student.studentId }"></textarea>
					<br /> 获奖情况：<br />
					<textarea name="" id="3" cols="30" rows="4" id="prize" name="prize"
						placeholder="${student.studentId }"></textarea>
					<br /> 其它：<br />
					<textarea name="" id="4" cols="30" rows="4" id="others"
						name="others" placeholder="${student.studentId }"></textarea>
					<br />
					<div class="outer">
						<div class="qr" onclick="commitButton()">确认</div>
						<div class="qx" onclick="cancelButton()">取消</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	</main>
	<jsp:include page="/jsp/footer.jsp" flush="true" />
</body>
</html>
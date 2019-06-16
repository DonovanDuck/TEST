<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jsp/teacher_personal_center/css/myclass.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jsp/teacher_personal_center/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/js/jquery.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"
	type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
	        function a(){
            var r1=document.getElementById("tab1");
            var r2=document.getElementById("tab2");
            r1.style.display="block";
            r2.style.display="none";
        }
	        function b(){
            var r1=document.getElementById("tab1");
            var r2=document.getElementById("tab2");
            r1.style.display="none";
            r2.style.display="block";
        }

</script>
</head>
<body class="row">
	<jsp:include page="/jsp/top.jsp" flush="true" />
	<div class="main_left col-md-3">
		<div class="head_sculpture col-md-10">
			<div class="head_sculpture_inner">
				<c:if test="${empty item.faceImg }">
								<img data-src="holder.js/140x140" class="img-circle" alt="140x140" 
									src="${pageContext.request.contextPath}/img/facedownload.jpg" data-holder-rendered="true" style="width: 140px; height: 140px;">
						
							</c:if>
							<c:if test="${not empty item.faceImg }">
								<img data-src="holder.js/140x140" class="img-circle" alt="140x140" 
									src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${teacher.faceImg }" data-holder-rendered="true" style="width: 140px; height: 140px;">
						
							</c:if>
				<p class="petname">${teacher.teacherName }</p>
				<p class="title">${teacher.professionalTitles }</p>
			</div>
		</div>
		<div class="head_sculpture_bottom col-md-10">
			<a href="#"><div class="modify_T col-md-12">修改头像</div> </a> <a
				href="#">
				<div class="modify_B col-md-12 ">修改个人信息</div>
			</a>
		</div>
	</div>
	<div class="main_right col-md-9">
		<div class="nav row">
			<div class="nav_petname col-md-2">
				<a href="index.html"> 
				<img src="img/logo.svg" alt="" />
				 <span>${teacher.teacherName }</span>
				</a>

			</div>
			<div class="nav_list col-md-10">
				<nav>
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/teacher/toTeacherMyCourse">我的课程</a></li>
						<li><a
							href="${pageContext.request.contextPath}/teacher/toTeacherMyClass">我的班级</a></li>
						<li><a href="myachievement.html">我的成果</a></li>
						<li><a href="myappraise.html">我的评价</a></li>
						<li><a href="mydiscussion.html">我的讨论</a></li>
						<li><a href="myteam.html">我的团队</a></li>
						<li><a
							href="${pageContext.request.contextPath}/teacher/toTeacherMyInfo">我的信息</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<div class="text">
			<h2>我的班级</h2>
			<ul id="tabs">
				<li><a href="#" class="active">我创建的班级</a></li>
				<li><a href="#">创建班级</a></li>
			</ul>
			<div id="content">
				<div id="tab1">
					<c:forEach items="${virtualClassList }" var="item" varStatus="status">
						<div class="course ">
							<div class="img">
								<a href="${pageContext.request.contextPath}/teacher/toClassDetail?virtualClassNum=${item.virtualClassNum }&virtualClassName=${item.virtualClassName }&courseName=${item.virtualCourseName }"> 
									
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
								</a>
							</div>
							<div class="coursemessage col-md-8">
								<h3>
									<a href="${pageContext.request.contextPath}/teacher/toClassDetail?virtualClassNum=${item.virtualClassNum }&virtualClassName=${item.virtualClassName }&courseName=${item.virtualCourseName }"> 
										${item.virtualClassName }
									</a>
								</h3>
								<p>课程名称：${item.virtualCourseName }</p>
								<p>教授班级：
									<c:forEach items="${item.realClassList }" var="realClass">
										${realClass.realClassNum }班<span>&nbsp;&nbsp;&nbsp;</span>
									</c:forEach>
								</p>
								<p>开课学期：${item.term }</p>
							</div>
							<div class="modify_message col-md-1">
								<a>编辑</a>
							</div>
						</div>
						<hr />
					</c:forEach>
				</div>
				<div id="tab2"></div>

			</div>
</body>
</html>



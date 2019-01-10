<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>courseCreate</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/create_lesson.css"
	type="text/css">
<link href="http://www.tit.edu.cn/images/logo.ico" rel="Shortcut Icon">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link
	href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet" />
	
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/bootstrap.min.js"></script>

<%-- <jsp:include page="${pageContext.request.contextPath}/jsp/AdminJsp/Common.jsp" ></jsp:include> --%>
<script>
$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('New message to ' + recipient)
	  modal.find('.modal-body input').val(recipient)
	})
</script>

<script type="text/javascript">
	$(function(){
		$("#pull").click(function(){
			$.ajax({
				async:false,
				cache:false,
				url:"${pageContext.request.contextPath}/teacher/ajaxGetTeachers/${employeeNum}",
				type:"POST",
				dataType:"json",
				success:function(result) {
					//alert(result);
					 var arr = eval(result);
					for(var i = 0; i < arr.length; i++){
						//alert(arr[i].employeeNum);//通过ajax动态加载教师列表后，动态在拟态框里添加列表
						$("#teacher").append("<input type='checkbox' value='"+arr[i].employeeNum+"' name='teacher'/>"+arr[i].teacherName);
					} 
				}
			});
		});
	});
</script>

<script type="text/javascript">
	$(function(){
		$("#close").click(function(){
			//拟态框每次关闭要清除之前信息，否则会叠加
			$("#teacher").remove();
			//清除后要留一空li,以保证下次成功动态加载
			$("#teacherUl").append(" <li id="+"teacher"+">"+"</li>");
		});
	});
</script>
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<div class="logo-nav-box">
				<div class="container">
					<div class="logo-box">
						<img src="${pageContext.request.contextPath}/images/head-logo.png"
							width="292" height="59" border="0">
					</div>
					<div class="nav-box">
						<ul id="nav" class="nav clearfix">
					</div>
				</div>
			</div>
		</div>
		<div class="main">
			<form action="${pageContext.request.contextPath}/teacher/createCourse"  method="post"  enctype="multipart/form-data">
				<input type="hidden" name="publisherId" value="${employeeNum }">
				<div class="input1">
					<span>课程名称：</span> <input name="courseName" type="text"
						placeholder="请输入课程名称："
						style="width: 60%; height: 30px; float: left; margin-left: 2%;">
				</div>
				<div class="input1">
					<span>课程图片：</span> <label for="faceImg" style="cursor: pointer"><img
						src="${pageContext.request.contextPath}/images/add.png" alt=""></label>
					<input type="file" id="faceImg" style="display: none;"
						name="faceImg">
				</div>
				<div class="input3">
					<span>课程分类：</span> <select name="courseCategory" id="category">
						<c:forEach items="${categoryList }" var="category">
							<option value="${category.categoryId }">${category.categoryName }</option>
						</c:forEach>
					</select>
				</div>


				<hr>
				<div class="input1">
					<span>课程介绍：</span> <br>
					<br> <input name="courseDetail" type="text" placeholder=""
						style="width: 77%; height: 100px; float: left; margin-left: 9%;">
				</div>

				<hr>
				
				<!-- 拟态框star -->
					<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
					<div class="modal-content">
						<ul id="teacherUl" style="list-style-type:none;">
							<li id="teacher"></li>
						</ul>
						<div class="modal-footer">
							<button id="close" type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
						</div>
					</div>
				</div>
</div>
				<!-- 拟态框end -->
				
				<div class="teacher-friend">
					<h3>教师圈：</h3>
					<div class="friend">
						<div class="friend1">
							<img src="../images/head.png" alt="">
							<p>张XX</p>
						</div>
						<div class="friend1">
							<img src="../images/head.png" alt="">
							<p>张XX</p>
						</div>
						<div class="friend1">
							<img src="../images/head.png" alt="">
							<p>张XX</p>
						</div>
						<div class="friend1">
							<img src="../images/head.png" alt="">
							<p>张XX</p>
						</div>
						<div class="friend1">
							<img src="../images/head.png" alt="">
							<p>张XX</p>
						</div>
						<div class="friend1">
							<img src="../images/head.png" alt="">
							<p>张XX</p>
						</div>
						<div class="friend1">
							<img src="../images/head.png" alt="">
							<p>张XX</p>
						</div>
						<div class="add">
							<button type="button" id="pull" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">拉入教师</button>
						</div>
						
					</div>
				</div>
				<hr>
				<div class="button">
					<div class="create">
							<span style="color: white;"><input type="submit" value="创建课程"></span>
						</div> <a href="#"><div class="delete">
							<span style="color: white;">取消</span>
						</div></a>
				</div>
			</form>
		</div>
		<div class="footer">
			<div class="container">

				<!--row End-->
				<div class="foot-bq">
					<!-- 版权内容请在本组件"内容配置-版权"处填写 -->
					<div
						style="width: 900px; text-align: center; float: left; position: relative; left: 135px; top: 8px;">
						<p>地址：山西省太原市尖草坪区新兰路31号&nbsp;&nbsp;&nbsp;&nbsp;邮编：030008</p>
						<p>
							版权所有：太原工业学院&nbsp;&nbsp;&nbsp;&nbsp;ICP备案号：晋ICP备14003279号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;晋公网安备号：140110430070001
						</p>
					</div>
				</div>
			</div>
			<!--container End-->
		</div>
		
		<!-- bootstrup -->
		
</body>

</html>
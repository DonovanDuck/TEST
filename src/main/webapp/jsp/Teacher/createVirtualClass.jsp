<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>courseCreate</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Course/create_lesson.css"
	type="text/css">
<link href="http://www.tit.edu.cn/images/logo.ico" rel="Shortcut Icon">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/Course/common.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link
	href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet" />
	
	<style type="text/css">
	.phoneUl li{
		list-style-type: none;
		float:left;
		width: 67px;
	}
	.confirm_close{
		  width: 48%;
    height: 50px;
    position: absolute;
    left: 322px;
    top: 834px;
	}
	.confirm_close ul li{
		list-style-type: none;
		float:left;
		margin-left: 170px;
	}
</style>

<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/bootstrap.min.js"></script>

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
	$(function() {
		$("#pull")
				.click(

						function() {
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
										$("#teacher").append("<input id='teacher' type='checkbox' value='"+arr[i].employeeNum+"' name='teacher'/>"+arr[i].teacherName);
									} 
								}
							});
						});
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#close").click(
				function() {
					//拟态框每次关闭要清除之前信息，否则会叠加
					$("#realClass").remove();
					//清除后要留一空li,以保证下次成功动态加载
					$("#realClassUl").append(
							" <li id="+"realClass"+">"
									+ "<input type='hidden' name='test'/>"
									+ "</li>");
				});
	});
</script>
<script type="text/javascript">
	$(function() {
		//定义两个全局变量
		var checked = [];//点击确认后获取的多选框的值
		var new_arr = []; //经过筛选后的多选框的值，无重复值
		$("#modalConfirm")
				.click(
						function() {
							$('input:checkbox:checked')
									.each(
											function() {
												checked.push($(this).val()); //获取到多选框的一个值
												for (var i = 0; i < checked.length; i++) {
													var items = checked[i];
													if ($.inArray(items,
															new_arr) == -1) {
														new_arr.push(items);//判断元素是否已在new_arr
														$("#selectedRealClass")
																.append(
																		"<li id='selectedRealClass' name='selectedRealClass' style='float: left;margin-left:2%;'>"
																				+ "<input value='"+items+"' name='selectedRealClassContent' id='selectedRealClassContent'/></li>");
													}
												}

											});
						});
	});
</script>
<script type="text/javascript">
$(function() {
	$("#adsf").click(
            function() {
                var check=",";
                $("input[name='realClass']:checked").each(function(i){
                      check =check+$(this).val()+",";
                });
                $("#realClassContent").val(check);
            });
})
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
					<ul class="phoneUl">
					<span style="float: left;" >课程图片：</span> 
					<label for="faceImg" style="cursor: pointer">
						<li>
							<input type="file" id="faceImg" style="display: none;" onchange="chan(this)"
								name="faceImg">
						</li>
						<li><img id="photos" src="" width="100" height="100" /></li>
					</label>
					</ul>
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
								<ul id="teacherul" style="list-style-type:none;">
									<li id="teacher"></li>
								</ul>
								<div class="modal-footer">
									<button id="close" type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="button" id="confirm" class="btn btn-primary" data-dismiss="modal">确定</button>
								</div>
							</div>
						</div>
					</div>
				<!-- 拟态框end -->
				
				<div class="teacher-friend">
					<h3>教师圈：</h3>
					<div class="friend">
						<ul id="selectedRealClassUI" style="list-style-type: none;">
							<li id="selectedTeachers" name=selectedTeachers
								style="float: left; margin-left: 2%;">
									<li id="selectedTeachers" name="selectedTeachers" style="float: left;margin-left:2%;">
									<input value="${employeeNum }" name="selectedTeacherContent" id="selectedTeacherContent"/>
									</li>
								</li>
						</ul>
						<div class="add">
							<button type="button" id="pull" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">拉入教师</button>
						</div>
						<input value="" name="teacherContent" id="teacherContent"
							type="hidden" />
					</div>
				</div>
				<hr>
				<div class="confirm_close">
					<ul>
						<li><input id="create" class="btn btn-default" style="width: 84px;" type="submit" value="创建" /></li>
						<li><input class="btn btn-default" style="width: 84px;" value="取消" /></li>
					</ul>
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
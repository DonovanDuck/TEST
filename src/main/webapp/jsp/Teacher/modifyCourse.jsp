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
    top: 599px;
	}
	.confirm_close ul li{
		list-style-type: none;
		float:left;
		margin-left: 170px;
	}
</style>
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
						$("#teacher").append("<input id='teacher' type='checkbox' value='"+arr[i].employeeNum+"' name='teacher'/>"+arr[i].teacherName);
					} 
				}
			});
		});
	});
</script>

<!-- <script type="text/javascript">
	$(function(){
		$("#confirm").click(function(){
			var checked=$("input:checkbox[name=teacher]:checked").val();
			for(var i = 0; i < checked.length; i++){
				alert(check[i].val());
			}
			/* $.ajax({
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
			}); */
		});
	});
</script> -->

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

<!-- 图片预加载 -->
<script>
//浏览图片
    function chan(i) {
        var objUrl = getObjectURL(i.files[0]);
        if (objUrl) {
            $("#photos").attr("src", objUrl);  //这里的id是要显示图片位置的Id
        }
    };
    //建立一個可存取到該file的url
    function getObjectURL(file) {
        var url = null;
        // 下面函数执行的效果是一样的，只是需要针对不同的浏览器执行不同的 js 函数而已
        if (window.createObjectURL != undefined) { // basic
            url = window.createObjectURL(file);
        } else if (window.URL != undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    } 
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/jsp/top.jsp" flush="true"/>
		<div class="main" style="height: 578px">
			<form action="${pageContext.request.contextPath}/teacher/modifyCourse/${course.courseId}"  method="post"  enctype="multipart/form-data">
				<input type="hidden" name="publisherId" value="${employeeNum }">
				<div class="input1">
					<span>课程名称：</span> <input name="courseName" type="text"
						placeholder="" value=${course.courseName }
						style="width: 60%; height: 30px; float: left; margin-left: 2%;">
				</div>
				<div class="input1">
					<ul class="phoneUl">
					<span style="float: left;" >课程图片：</span> 
					<label for="faceImg" style="cursor: pointer">
						<li>
							<input type="file" id="faceImg" style="display: none;" onchange="chan(this)"
								name="faceImg" value=${course.faceImg }>
						</li>
						<li><img id="photos" src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${course.faceImg }" width="100" height="100" /></li>
					</label>
					</ul>
				</div>
				<div class="input3">
					<span>课程分类：</span> <select name="courseCategory" id="category" value=${course.courseCategory }>
						<c:forEach items="${categoryList }" var="category">
							<option value="${category.categoryId }" <c:if test="${category.categoryId eq course.courseCategory}">selected</c:if> >${category.categoryName }</option>
						</c:forEach>
					</select>
				</div>


				<hr>
				<div class="input1">
					<span>课程介绍：</span> <br>
					<br> <input name="courseDetail" type="text" placeholder=""
						style="width: 77%; height: 100px; float: left; margin-left: 9%;" value=${course.courseDetail }>
				</div>
				<div class="confirm_close">
					<ul>
						<li><input class="btn btn-default" style="width: 84px;" type="submit" value="修改" /></li>
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
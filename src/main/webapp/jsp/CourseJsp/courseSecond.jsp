<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="categoryId" value="${categoryId}"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>全部课程</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" type="text/css">
<link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<style>
	small{
		color: #000;
	}
	.banner {
	width: 76%;
	margin-left: 13%;
	margin-top: 1%;
	border: 1px solid #ccc;
	padding: 1%;
}

.banner span {
	font-size: 20px;
	float: left;
}
.iframe{
	height:100%;
	width:100%;
}

.banner_t {
	    width: 70%;
    margin-left: 16%;
	    height: 205px;
	margin-top: 14px;
	    padding-left: 77px;
	        margin-bottom: 29px;
}

.banner_t li {
	width: 16%;
	height: 30px;
	float: left;
	margin-top: 3%;
}

.banner li .div1 {
	height: 30px;
	font-size: 20px;
	color: #2b2b2b;
	float: left;
	border: 0;
	border-radius: 10%;
	line-height: 30px;
	margin-top: 2%;}
	
    	
    	.xiangmu-out .rel-img img{
    		width: 100%;
    		height: 100%;
    		overflow: hidden;
    		transition:all 0.5s;
    	}
   .xiangmu-out:hover{
    box-shadow: 0 0 15px grey;
    transform: translate(0,-10px);
}

.xiangmu-out .rel-img{
	overflow: hidden;
}

.xiangmu-out:hover .rel-img img{
    transform: scale(1.10);
    
}
.daohang{
	font-size: 17px;
    border: 0;
    background: #f0f0f0;
}
    	
</style>
<script>
$(document).ready(function() { 
	var cid = "${categoryId}";
	
	if(cid != null && cid != "null" && cid != ""){
		$("#"+cid).css("background","#55b929");
		$("#"+cid).css("color","#fff");
	}
	else{
		$("#allSelect").css("background","#55b929");
		$("#allSelect").css("color","#fff");
	} 
	});
	
</script>
</head>
<body class="body">
	<jsp:include page="/jsp/top.jsp" flush="true" />
	<%-- <div style="height: 96px;width: 350px;float: left;padding: 11px;background: #f3f3f3;border-radius: 6px;">
						<img style="height: 74px; width: 74px;margin-right: 10px;border-radius: 6px;float: left;" src="${pageContext.request.contextPath}/images/tu9.jpg">
						<label class="re_name" style="    position: relative;
    top: -2px;">c++基础知识应用</label>
     <div><span>c++基础知识应用,利用c++基础语法知识与算法原理完成关卡中所给题目。</span></div>
     <div>15题</div><div>2010.1.1</div>
					</div> --%>
					
	
	<%-- <a href="${pageContext.request.contextPath}/teacher/toCreateCourse" style="position: relative;top: -26px;left:269px"><button class="btn btn-default" >创建课程</button></a> --%>

		<div class="banner_t">
			<ul>
			<li>
						<div class="div1">
							<a href="${pageContext.request.contextPath}/teacher/courseList"
								class="div1" style="font-size: 20px" target="">
								<button id="allSelect" style="font-size: 16px;width: 136px;background:#fff; border-color: #fff;text-align: left;" type="button" class="btn btn-default">全部</button>
								</a>
						</div>
					</li>
				<c:forEach items="${categories }" var="category" varStatus="status">
					<li>
						<div class="div1">
							<a href="${pageContext.request.contextPath}/teacher/readCourseInfoByCategory/${category.categoryId }"
								class="div1" style="font-size: 20px" target="">
								<button id="${category.categoryId }" style="width: 136px;font-size: 16px; border-color: #fff;text-align: left;" type="button" class="btn btn-default">${category.categoryName }</button>
								</a>
						</div>
					</li>
				</c:forEach>
				
			</ul>
		</div>
		<div style="height: 0px;width: 87%;border-bottom: 1px solid #ccc;margin-bottom: 2%;margin-top: -1%;"></div>
		<form action="${pageContext.request.contextPath}/teacher/toCourseSecondSearch">
		<div class="form-group" style="margin-top: -6px;">
    <input style="width: 23%;float: left;margin-right: 13px;margin-left: 65.5%;margin-bottom: 1%;"  
    class="form-control"  name="search" placeholder="请输入关键词">
  </div>
  <button type="submit" class="btn btn-default" style=" ">搜索</button>
		<!-- <div class="searchAndButton" style="margin-right: 4%">
			<input class="search" id="search" name="search" placeholder="请输入关键词">
			<button class="search-button" id="searchButton" type="submit">搜索</button>
		</div> -->
	</form>
	<div class="courses" style="padding-left: 84px;padding-right: 84px;margin-bottom: 43px;">
	<div class="row">
		<c:forEach items="${courseList }" var="course"
			varStatus="status">
			<div class="col-xs-3 col-md-3 " style="height: 394px;">
                  	<a href="<c:url value='/teacher/toCourseDetail/${course.courseId }'/>">
                          <div  class="jidixiangmu-li xiangmu-out" style="width: 100%;min-height: 345px;">
                              <div class="rel-img"  style="width: 100%;height: 200px;"><img src="${course.faceImg }" alt="" style="height: 200px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p style="font-family: 微软雅黑;margin-top:10px; font-size: 20px; font-weight: 20px;opacity: 1;">${course.courseName }</p>
                                      <p style="margin-bottom: -1%;"><span style="font-size: 13px;font-weight: 600;">教师团队：</span>
                                      	<c:forEach items="${course.teacherList }" var="teacher">
                							${teacher.teacherName }
                						</c:forEach>
                                      </p>
                                      <p style="margin-bottom: -1%;"><span style="font-size: 13px;font-weight: 600;">创建时间：</span>${publishTime[status.index] }</p>
                                      <p style="margin-bottom: -1%;"><span style="font-size: 13px;font-weight: 600;">课程人数：</span>${course.courseStudentNum }</p>
                                  </div>
                              </div>
                          </div>
                       </a>
                      </div>
		</c:forEach>
		</div>
	</div>
	<jsp:include page="/jsp/footer.jsp" flush="true"/>
</body>
</html>
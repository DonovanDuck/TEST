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
	width: 96%;
	margin-left: 40px;
	    height: 205px;
	margin-top: -12px;
	    padding-left: 77px;
	        margin-bottom: 46px;
}

.banner_t li {
	width: 20%;
	height: 30px;
	float: left;
	margin-top: 2%;
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
    	
</style>
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
					
	<form action="${pageContext.request.contextPath}/teacher/toCourseSecondSearch">
		<div class="form-group">
    <input style="width: 23%;float: left;margin-right: 13px;margin-left: 63%;"  
    class="form-control"  name="search" placeholder="请输入关键词">
  </div>
  <button type="submit" class="btn btn-default" >搜索</button>
		<!-- <div class="searchAndButton" style="margin-right: 4%">
			<input class="search" id="search" name="search" placeholder="请输入关键词">
			<button class="search-button" id="searchButton" type="submit">搜索</button>
		</div> -->
	</form>
	<%-- <a href="${pageContext.request.contextPath}/teacher/toCreateCourse" style="position: relative;top: -26px;left:269px"><button class="btn btn-default" >创建课程</button></a> --%>

		<div class="banner_t">
			<ul>
				<c:forEach items="${categories }" var="category" varStatus="status">
					<li>
						<div class="div1">
							<a href="${pageContext.request.contextPath}/teacher/readCourseInfoByCategory/${category.categoryId }"
								class="div1" style="font-size: 20px" target="">
								<button style="width: 136px;" type="button" class="btn btn-default">${category.categoryName }</button>
								</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	<div class="courses" style="padding-left: 84px;padding-right: 84px;margin-bottom: 43px;">
	<div class="row">
		<c:forEach items="${courseList }" var="course"
			varStatus="status">
			<div class="col-xs-3 col-md-3" style="height: 394px;">
			<a
				href="${pageContext.request.contextPath}/teacher/toCourseDetail/${course.courseId }">
				<div  class="jidixiangmu-li xiangmu-out">
                              <div class="rel-img"  style="width: 100%;height: 200px;"><img src="${pageContext.request.contextPath}/images/tu3.png" alt="" style="width: 300px;height: 200px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p style="font-family: 微软雅黑; font-size: 20px; font-weight: 20px;opacity: 1;">${course.courseName }</p>
                                      <p><span style="font-size: 13px;font-weight: 600;">教师团队：</span>
                                      	<c:forEach items="${course.teacherList }" var="teacher">
                							${teacher.teacherName }
                						</c:forEach>
                                      </p>
                                      <p><span style="font-size: 13px;font-weight: 600;">创建时间：</span>${publishTime[status.index] }</p>
                                      <p><span style="font-size: 13px;font-weight: 600;">课程人数：</span>${course.courseStudentNum }</p>
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
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>课程三级页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lesson3.css"/>
    <!--head-->
    <link href="http://www.tit.edu.cn/images/logo.ico" rel="Shortcut Icon">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
<link
	href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet" />
	
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/bootstrap.min.js"></script>



</head>
<body>
    <div class="wrapper"> 
  <div class="header"> 
    <div class="logo-nav-box">
      <div class="container">
        <div class="logo-box">
					<img src="${pageContext.request.contextPath}/images/head-logo.png" width="292" height="59" border="0" ></div>
        <div class="nav-box"><ul id="nav" class="nav clearfix">
      </div>
      </div>
    </div>
  </div>
  <!-- header End -->
<main>
    <div class="main_t">
        <div class="img">
            <img src="${pageContext.request.contextPath}/images/tu3.png" alt="" style="width:100%;height:100%;"/>
        </div>
        <div class="word">
            <h1>${course. courseName}</h1> <span style="color : red;">${course.fine }</span>
            <div class="summery">
                <p>
                    <li>创建时间：${course.publishTime }</li>
                	<li>课程人数：${course.courseStudentNum }</li>
                </p>
            </div>
            	<c:if test="${teacher != null && (manager == 0 || manager == 1)  }"> 
                <button style="float:left" type="button" class="btn btn-warning"><a href="${pageContext.request.contextPath}/teacher/toCreateVirtualClass/${course.courseId }">创建班级</a></button>
                 </c:if>   
               
                <div>
                <c:if test="${teacher != null && manager == 1 }"> 
                	<a href="${pageContext.request.contextPath}/teacher/toModifyCourse/${course.courseId}"><button class="btn btn-default" type="submit" style="margin-left: 43px;">编辑课程</button></a>
                 </c:if>
                <c:if test="${student != null }"> 
                	<button class="btn btn-default" type="submit" style="margin-left: 43px;">进入班级</button>
                </c:if> 
                <button class="btn btn-default" type="submit">关注课程</button>
                
                <button class="btn btn-default" type="submit">相关论坛</button>
                </div>
                
        </div>
    </div>
    <div class="main_b">
        <div class="main_b_t">
            <nav>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/teacher/toCourseIntroduce/${course.courseId}" target="target">课程介绍</a></li>
                    <li><a href="${pageContext.request.contextPath}/resource/toTeacherResource/${course.courseId}" target="target">资源</a></li>
                    <li><a href="#" >拓展任务</a>
                    <li style="width: 160px"><a href="${pageContext.request.contextPath}/teacher/teacherClassList/${course.courseId }" target="target">暂时的开课班级列表</a></li>
                </ul>
            </nav>
        </div>
        <div class="main_b_b">
            <iframe src="${pageContext.request.contextPath}/teacher/toCourseIntroduce/${course.courseId}" name="target" frameborder="0" width="65%" height="100%" scrolling="auto"></iframe>
            <div class="friend">
                <div class="h3"><h2>教师圈</h2></div>
                
                <c:forEach items="${teacherList }" var="teacher">
                	<div class="teacher">
                    <div class="img"><img src="${pageContext.request.contextPath}/images/t1.png" alt=""/></div>
                    <div class="word">
                        <p>${teacher.teacherName }</p>
                        <p>${teacher.professionalTitles }</p>
                    </div>
                </div>
                </c:forEach>
                
                
                <div class="teacher">
                    <div class="img"><img src="${pageContext.request.contextPath}/images/t2.png" alt=""/></div>
                    <div class="word">
                        <p>陈良育</p>
                        <p>副教授</p>
                    </div>
                </div>
                <div class="teacher">
                    <div class="img"><img src="${pageContext.request.contextPath}/images/t3.png" alt=""/></div>
                    <div class="word">
                        <p>李春艳</p>
                        <p>副教授</p>
                    </div>
                </div>
                <div class="teacher">
                    <div class="img"><img src="${pageContext.request.contextPath}/images/t4.png" alt=""/></div>
                    <div class="word">
                        <p>李茵</p>
                        <p>讲师</p>
                    </div>
                </div>
                <div class="teacher">
                    <div class="img"><img src="${pageContext.request.contextPath}/images/t5.png" alt=""/></div>
                    <div class="word">
                        <p>张晶</p>
                        <p>教师</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<div class="footer">
    <div class="container">
      
      <!--row End-->
      <div class="foot-bq"><!-- 版权内容请在本组件"内容配置-版权"处填写 -->
<div style="width: 900px; text-align: center; float: left; position: relative; left: 135px;top:17px;">
    <p>
        地址：山西省太原市尖草坪区新兰路31号&nbsp;&nbsp;&nbsp;&nbsp;邮编：030008
    </p>
    <p>
        版权所有：太原工业学院&nbsp;&nbsp;&nbsp;&nbsp;ICP备案号：晋ICP备14003279号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;晋公网安备号：140110430070001
    </p>
</div>
</div>
    </div>
    <!--container End--> 
  </div>
</body>
</html>
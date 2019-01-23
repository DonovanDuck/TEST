<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>教师发布任务页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Course/teacher-release-task.css" type="text/css">
</head>
<body>
<header></header>
<main>
    <div class="main_t">
        <div class="class">
            <h2>1720561</h2>
        </div>
    </div>
    <div class="main_m">
        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath}/teacher/toPublishTask">作业</a></li>
                <li><a href="${pageContext.request.contextPath}/jsp/Teacher/teacher-experiment.jsp">实验</a></li>
                <li><a href="#">课设</a></li>
                <li><a href="#">翻转</a></li>
                <li><a href="#">授课计划</a></li>
                <li><a href="#">论坛</a></li>
                <li><a href="#">开放</a></li>
            </ul>
        </nav>
    </div>
    <div class="main_b">
        <div class="text">
        <form action="${pageContext.request.contextPath}/teacher/publishTask"  enctype="multipart/form-data" method="post">
            <span><strong>题&nbsp;&nbsp;&nbsp;&nbsp;目：</strong></span>
            <input type="text" name="taskTitle"  placeholder="请输入题目：" style="width: 60%;height: 30px;float: left;">
         
            <div style="width:10%;height:30px;">
	            <select id ="taskCategory" name="taskCategory">
	            	<c:forEach items="${taskCategoryList }" var="taskCategory">
								<option>${taskCategory }</option>
							</c:forEach>
	            </select>
            </div>
            <br> <br>
            <span><strong>任务详情：</strong></span>
            <input name="taskDetail" type="text" placeholder="请输入任务详情：" style="width: 80%;height: 200px;float: left;">
            <div class="button">
                <span>发布时间:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  type="datetime-local" placeholder=""> </span>
                <span>截止时间:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="taskEndTime" type="datetime" placeholder=""></span>
                <br><br>
                
                <input name="file" type="file"  multiple="multiple"  />
                上传附件
                
                <button style="padding-left: 1%;padding-right: 1%;font-size: 16px;float: right; margin-right: 20%;">上传并发布</button>
                <button style="padding-left: 1%;padding-right: 1%;font-size: 16px;float: right;margin-right: -30%;">定时发布</button>
            </div>
            </form>
        </div>
    </div>
</main>
<footer></footer>
</body>
</html>
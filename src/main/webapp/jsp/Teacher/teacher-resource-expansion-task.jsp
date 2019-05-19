<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/teacher-resource.css"/>
</head>
<body>
<div class="main_b_b">
    <div class="inner">
        <div class="button"><!-- <a href="#">编辑资源</a> --></div>
        
        <c:forEach items="${taskList }" var="task" varStatus="status">
        	<div class="word">
            <div class="images">
                <img src="${pageContext.request.contextPath}/images/word1.png" alt="" style="width:80px;height:80px;"/>
            </div>
            <div class="word_r">
                <p>&nbsp;&nbsp;&nbsp;名称：${task.taskTitle }</p>
                <p>&nbsp;&nbsp;&nbsp;相关知识点：${task.taskDetail }</p>
                <p>&nbsp;&nbsp;&nbsp;发布人：${teacherNames[status.index] }</p>
                <p>&nbsp;&nbsp;&nbsp;发布时间：${task.publishTime }</p>
                <p>&nbsp;&nbsp;&nbsp;使用次数：3</p>
            </div>
        </div>
        </c:forEach>
        
        
        <div class="word">
            <div class="images">
                <img src="${pageContext.request.contextPath}/images/word1.png" alt="" style="width:80px;height:80px;"/>
            </div>
            <div class="word_r">
               <p>&nbsp;&nbsp;&nbsp;名称：java</p>
                <p>&nbsp;&nbsp;&nbsp;描述：collection</p>
                <p>&nbsp;&nbsp;&nbsp;设计人：dono</p>
                <p>&nbsp;&nbsp;&nbsp;提交时间：2019-01-07 15:55:49.0</p>
            </div>
        </div>
        <div class="word">
            <div class="images">
                <img src="${pageContext.request.contextPath}/images/word1.png" alt="" style="width:80px;height:80px;"/>
            </div>
            <div class="word_r">
                <p>&nbsp;&nbsp;&nbsp;名称：java</p>
                <p>&nbsp;&nbsp;&nbsp;描述：collection</p>
                <p>&nbsp;&nbsp;&nbsp;设计人：dono</p>
                <p>&nbsp;&nbsp;&nbsp;提交时间：2019-01-07 15:55:49.0</p>
            </div>
        </div>
        <div class="word">
            <div class="images">
                <img src="${pageContext.request.contextPath}/images/word1.png" alt="" style="width:80px;height:80px;"/>
            </div>
            <div class="word_r">
               <p>&nbsp;&nbsp;&nbsp;名称：java</p>
                <p>&nbsp;&nbsp;&nbsp;描述：collection</p>
                <p>&nbsp;&nbsp;&nbsp;设计人：dono</p>
                <p>&nbsp;&nbsp;&nbsp;提交时间：2019-01-07 15:55:49.0</p>
            </div>
        </div>
        <div class="word">
            <div class="images">
                <img src="${pageContext.request.contextPath}/images/word1.png" alt="" style="width:80px;height:80px;"/>
            </div>
            <div class="word_r">
                <p>&nbsp;&nbsp;&nbsp;名称：java</p>
                <p>&nbsp;&nbsp;&nbsp;描述：collection</p>
                <p>&nbsp;&nbsp;&nbsp;设计人：dono</p>
                <p>&nbsp;&nbsp;&nbsp;提交时间：2019-01-07 15:55:49.0</p>
            </div>
        </div>
        <div class="word">
            <div class="images">
                <img src="${pageContext.request.contextPath}/images/word1.png" alt="" style="width:80px;height:80px;"/>
            </div>
            <div class="word_r">
                <p>&nbsp;&nbsp;&nbsp;名称：java</p>
                <p>&nbsp;&nbsp;&nbsp;描述：collection</p>
                <p>&nbsp;&nbsp;&nbsp;设计人：dono</p>
                <p>&nbsp;&nbsp;&nbsp;提交时间：2019-01-07 15:55:49.0</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
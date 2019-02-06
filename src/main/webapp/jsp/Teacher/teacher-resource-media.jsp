<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/course/teacher-resource.css"/>
</head>
<body>
<div class="main_b_b">
<div class="inner1">
    <div class="button"><a href="#">编辑资源</a></div>
    
    <!-- 音频 -->
    <c:forEach items="${audioresourceList }" var="resource" varStatus="status">
        	<div class="word">
            <div class="images">
                <img src="${pageContext.request.contextPath}/images/audio.png" alt="" style="width:80px;height:80px;"/>
            </div>
            <div class="word_r">
                <p>&nbsp;&nbsp;&nbsp;名称：${resource.resourceName }</p>
                <p>&nbsp;&nbsp;&nbsp;相关知识点：${resource.resourceDetail }</p>
                <p>&nbsp;&nbsp;&nbsp;发布人：${audioteacherNames[status.index] }</p>
                <p>&nbsp;&nbsp;&nbsp;发布时间：${resource.publishTime }</p>
                <p>&nbsp;&nbsp;&nbsp;使用次数：${resource.useNum }&nbsp;&nbsp;&nbsp;资源大小：${resource.size }</p>
            </div>
        </div>
        </c:forEach>
        
        <!-- 视频 -->
    <c:forEach items="${videoresourceList }" var="resource" varStatus="status">
        	<div class="word">
            <div class="images">
                <img src="${pageContext.request.contextPath}/images/video1.png" alt="" style="width:80px;height:80px;"/>
            </div>
            <div class="word_r">
                <p>&nbsp;&nbsp;&nbsp;名称：${resource.resourceName }</p>
                <p>&nbsp;&nbsp;&nbsp;相关知识点：${resource.resourceDetail }</p>
                <p>&nbsp;&nbsp;&nbsp;发布人：${videoteacherNames[status.index] }</p>
                <p>&nbsp;&nbsp;&nbsp;发布时间：${resource.publishTime }</p>
                <p>&nbsp;&nbsp;&nbsp;使用次数：${resource.useNum }&nbsp;&nbsp;&nbsp;资源大小：${resource.size }</p>
            </div>
        </div>
        </c:forEach>
        <!-- 图片 -->
    <c:forEach items="${imgresourceList }" var="resource" varStatus="status">
        	<div class="word">
            <div class="images">
                <img src="${pageContext.request.contextPath}/images/video1.png" alt="" style="width:80px;height:80px;"/>
            </div>
            <div class="word_r">
                <p>&nbsp;&nbsp;&nbsp;名称：${resource.resourceName }</p>
                <p>&nbsp;&nbsp;&nbsp;相关知识点：${resource.resourceDetail }</p>
                <p>&nbsp;&nbsp;&nbsp;发布人：${imgteacherNames[status.index] }</p>
                <p>&nbsp;&nbsp;&nbsp;发布时间：${resource.publishTime }</p>
                <p>&nbsp;&nbsp;&nbsp;使用次数：${resource.useNum }&nbsp;&nbsp;&nbsp;资源大小：${resource.size }</p>
            </div>
        </div>
        </c:forEach>
    
    <div class="word">
        <div class="images">
            <img src="${pageContext.request.contextPath}/images/audio.png" alt="" style="width:80px;height:80px;"/>
        </div>
        <div class="word_r">
            <p>&nbsp;&nbsp;&nbsp;名称：java</p>
                <p>&nbsp;&nbsp;&nbsp;相关知识点：collection</p>
                <p>&nbsp;&nbsp;&nbsp;发布人：dono</p>
                <p>&nbsp;&nbsp;&nbsp;发布时间：2019-01-07 15:55:49.0</p>
                <p>&nbsp;&nbsp;&nbsp;使用次数：3</p>
        </div>
    </div>
    <div class="word">
        <div class="images">
            <img src="${pageContext.request.contextPath}/images/video1.png" alt="" style="width:80px;height:80px;"/>
        </div>
        <div class="word_r">
            <p>&nbsp;&nbsp;&nbsp;名称：java</p>
                <p>&nbsp;&nbsp;&nbsp;相关知识点：collection</p>
                <p>&nbsp;&nbsp;&nbsp;发布人：dono</p>
                <p>&nbsp;&nbsp;&nbsp;发布时间：2019-01-07 15:55:49.0</p>
                <p>&nbsp;&nbsp;&nbsp;使用次数：3</p>
        </div>
    </div>
    <div class="word">
        <div class="images">
            <img src="${pageContext.request.contextPath}/images/audio.png" alt="" style="width:80px;height:80px;"/>
        </div>
        <div class="word_r">
            <p>&nbsp;&nbsp;&nbsp;名称：java</p>
                <p>&nbsp;&nbsp;&nbsp;相关知识点：collection</p>
                <p>&nbsp;&nbsp;&nbsp;发布人：dono</p>
                <p>&nbsp;&nbsp;&nbsp;发布时间：2019-01-07 15:55:49.0</p>
                <p>&nbsp;&nbsp;&nbsp;使用次数：3</p>
        </div>
    </div>
    <div class="word">
        <div class="images">
            <img src="${pageContext.request.contextPath}/images/video1.png" alt="" style="width:80px;height:80px;"/>
        </div>
        <div class="word_r">
            <p>&nbsp;&nbsp;&nbsp;发布人：张XX</p>
            <p>&nbsp;&nbsp;&nbsp;大致内容：drills</p>
            <p>&nbsp;&nbsp;&nbsp;发布时间：2018年12月27日</p>
            <p>&nbsp;&nbsp;&nbsp;被下载：XX</p>
        </div>
    </div>
    <div class="word">
        <div class="images">
            <img src="../images/audio.png" alt="" style="width:80px;height:80px;"/>
        </div>
        <div class="word_r">
            <p>&nbsp;&nbsp;&nbsp;发布人：张XX</p>
            <p>&nbsp;&nbsp;&nbsp;大致内容：指针的使用</p>
            <p>&nbsp;&nbsp;&nbsp;发布时间：2018年12月27日</p>
            <p>&nbsp;&nbsp;&nbsp;被下载：XX</p>
        </div>
    </div>
    <div class="word">
        <div class="images">
            <img src="../images/audio.png" alt="" style="width:80px;height:80px;"/>
        </div>
        <div class="word_r">
            <p>&nbsp;&nbsp;&nbsp;发布人：张XX</p>
            <p>&nbsp;&nbsp;&nbsp;大致内容：drills</p>
            <p>&nbsp;&nbsp;&nbsp;发布时间：2018年12月27日</p>
            <p>&nbsp;&nbsp;&nbsp;被下载：XX</p>
        </div>
    </div>
</div>
</div>
</body>
</html>
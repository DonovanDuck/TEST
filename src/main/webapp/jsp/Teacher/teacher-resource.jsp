<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/course/teacher-resource.css" type="text/css"/>
<body>
<main>
    <div class="main_t"></div>
    <div class="main_b">
    <div class="main_b_t">
       <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/resource/toTaskResource/${courseId }/work" target="arise" > 作业资源</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/Teacher/teacher-resource-word.jsp" target="arise" > 实验资源</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/Teacher/teacher-resource-audio.jsp" target="arise">音频资源</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/Teacher/teacher-resource-video.jsp" target="arise">视频资源</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/Teacher/teacher-resource-video.jsp" target="arise">图片资源</a></li>
            <li class="first"><a href="#">发布资源</a>
             <div class="second">
                 <ul>
                     <li><a href="${pageContext.request.contextPath}/jsp/Teacher/teacher-release-task.jsp" target="_blank">发布自己的</a></li>
                     <li><a href="#">从资源库选择</a></li>
                 </ul>
             </div>
            </li>
        </ul>
       </nav>
    </div>
    <div class="outer"><iframe  scrolling="no" src="${pageContext.request.contextPath}/resource/toTaskResource/${courseId }/work" name="arise" frameborder="0" style="width:100%;height:800px;"></iframe></div>
    </div>
</main>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/teacher-resource.css" type="text/css"/>
<body>
<main>
    <div class="main_t"></div>
    <div class="main_b">
    <div class="main_b_t">
       <nav>
        <ul>
        <li><a href="${pageContext.request.contextPath}/resource/toTaskResource/${courseId }/work" target="arise" > 教案库</a></li>
        <li><a href="${pageContext.request.contextPath}/resource/toTaskResource/${courseId }/work" target="arise" > 教学资源库</a></li>
        <li><a href="${pageContext.request.contextPath}/resource/toTeachResource/${courseId }" target="arise" > 多媒体资源</a></li>
            <li><a href="${pageContext.request.contextPath}/resource/toTaskResource/${courseId }/work" target="arise" > 作业库</a></li>
            <li><a href="${pageContext.request.contextPath}/resource/toTaskResource/${courseId }/trial" target="arise" > 实验库</a></li>
            <li><a href="${pageContext.request.contextPath}/resource/toTaskResource/${courseId }/work" target="arise" > 课程设计库</a></li>
            <%-- <li class="first"><a href="#">发布资源</a>
             <div class="second">
                 <ul>
                     <li><a href="${pageContext.request.contextPath}/jsp/Teacher/teacher-release-task.jsp" target="_blank">上传资源</a></li>
                 </ul>
             </div>
            </li> --%>
        </ul>
       </nav>
    </div>
    <div class="outer"><iframe  scrolling="no" src="${pageContext.request.contextPath}/resource/toTaskResource/${courseId }/work" name="arise" frameborder="0" style="width:100%;height:800px;"></iframe></div>
    </div>
</main>
</body>
</html>
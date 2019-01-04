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
    <title>Title</title>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"/>
    <script type="text/javascript">
    
    </script>
</head>
<body>
<p> ${teacher.teacherName }</p>
<p>${readResult }</p>

<p>我的班级</p>
    <c:forEach items="${virtualClassList }" var="virtualClass">
    <div style="width: 300px;height: 200px;float: left" >
		<tr  >
			<td>${virtualClass.virtualClassNum }</td>
			<td>${virtualClass.virtualClassName }</td>
			<td>${virtualClass.creatorId }</td>
			<td>${virtualClass.virtualClassDetail }</td>
			<td>${virtualClass.courseId }</td>
		</tr>
	</div>
	</c:forEach>
	


    


</body>
</html>
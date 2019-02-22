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
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/teacher/own.css"/>
</head>
<body>
<div id="t5">
                <p>工号：${teacher.employeeNum }</p>
                <span>密码：${teacher.password }</span>     <span class="span">修改</span> <br/>
                <span>头像：</span>  <img src="../images/add.png" alt=""/> <br/>
            </div>

</body>
</html>
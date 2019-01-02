<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_login.css" type="text/css">
</head>
<body>
    <div class="div1">
    	<form action="${pageContext.request.contextPath}/student/LoginStudent" method="post">
        <strong>学号：  </strong>
        <input type="text" id="studentId" name="studentId" style="width: 70%;line-height: 30px;background: white;margin-bottom: 4%;" placeholder="请输入学号" autofocus> <br>
        <strong>密码： </strong>
        <input type="password" id="studentPassword" name="studentPassword" style="width: 70%;line-height: 30px;background: white;margin-bottom: 4%;" placeholder="请输入密码" > <br>
        <input type="radio"> 
        <span>记住密码</span> 
         <a href="">忘记密码？</a> 
         <br>
        <input type="submit" style="width: 86%;height: 30px;border:0;background: deepskyblue;margin-top: 6%;color: white;font-weight: bold;" value="登录" >
        </form>
    </div>
</body>
</html>

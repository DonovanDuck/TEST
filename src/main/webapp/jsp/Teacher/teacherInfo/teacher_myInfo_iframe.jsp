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
  <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/teacher/own.css"/>
    <script type="text/javascript">
    
    function g(){
        
        var g2=document.getElementById('g2');
        var g3=document.getElementById('g3');
        g2.style.display='none';
        g3.style.display='block';
    }
    </script>
    
</html>
<body>
<div id="r5">
<div class="main_b_r_t">
		<div class="main_b_r_t">
			<div class="word1" id="w1">
				<p>
					<a target="mycourse"
						href="${pageContext.request.contextPath}/teacher/toMyCreateCourse"
						id="p1">基本信息</a>
				</p>
			</div>
			<div class="word2" id="w2">
				<p>
					<a target="mycourse"
						href="${pageContext.request.contextPath}/teacher/toMyJoinCourse"
						id="p2">详细信息</a>
				</p>
			</div>
			<div class="word3" id="w3">
				<p>
					<a target="mycourse"
						href="${pageContext.request.contextPath}/teacher/toMyJoinCourse"
						id="p2">个人成果</a>
				</p>
			</div>
		</div>
		<div class="hr"></div>
		<div class="main_b_r_b">
			<iframe id="myinfo" name="myinfo"
				style="width: 100%; height: 100%" frameborder="no" border="0"
				src="${pageContext.request.contextPath}/teacher/toMyCreateCourse"></iframe>
		</div>
    <div class="r5_t" id="g1">
        <div class="h3">
            <p>我的信息</p>
        </div>
        <div class="bj">
            <p onclick="g()">编辑个人信息</p>
        </div>
    </div>
    <div class="r5_b" id="g2">
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工号：${teacher.employeeNum }</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;昵称：${teacher.teacherNickName }</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：${teacher.teacherName }</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别：${teacher.teacherGender }</p>
        <p>出生年月：1980年12月1日
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职称：${teacher.professionalTitles }</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电子邮件：${teacher.email }</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教师系部：${teacher.teacherCategory }</p>
    </div>
    <div id="g3">
        <form action="">
            昵称：<input type="text" placeholder="请输入昵称："/><br/>
            密码：<input type="text" placeholder="请输入密码："/>忘记密码？<br/>
            出生年月日：<input type="text" placeholder="请输入出生年月日"/><br/>
            <div class="outer">
                <div id="qr" onclick="k()">确认</div>
                <div id="qx" onclick="k()">取消</div>
            </div>
        </form>
    </div>
</div>
</body>
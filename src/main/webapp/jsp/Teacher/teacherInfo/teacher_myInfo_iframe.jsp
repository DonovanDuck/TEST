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
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 8b686c47d14ac368571e08f4b308c03cc9fa9818
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/zh-cn.js"></script>
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
    <div class="r5_t" id="g1">
        <div class="h3">
            <p>我的信息</p>
        </div>
        <div class="bj" style="cursor:pointer;">
            <p onclick="g()">编辑个人信息</p>
        </div>
    </div>
    <div class="r5_b" id="g2">
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工号：${teacher.employeeNum }</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;昵称：${teacher.teacherNickName }</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：${teacher.teacherName }</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别：${teacher.teacherGender }</p>
        <p>出生年月：1980年12月1日
        <p>政治面貌：党员</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职称：${teacher.professionalTitles }</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职务：</p>
        <p>研究方向：计算机图形学</p>
        <p>发表论文：《C++面向对象程序设计》</p>
        <p>教学改革:</p>
        <p>获奖情况：国家级一等奖</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其它：</p>
    </div>
    <div id="g3">
        <form action="">
            昵称：<input type="text" placeholder="请输入昵称："/><br/>
            密码：<input type="text" placeholder="请输入密码："/>忘记密码？<br/>
            出生年月日：<input type="text" placeholder="请输入出生年月日"/><br/>
            政治面貌：<input type="text" placeholder="请输入政治面貌："/><br/>
            职称：<input type="text" placeholder="请输入职称："/><br/>
            职务：<input type="text" placeholder="请输入职务："/><br/>
            研究方向：<br/><input name="" id="1" cols="30" rows="4" placeholder="" /><br/>
            发表论文：<br/><textarea name="" id="2" cols="30" rows="4" placeholder=""></textarea><br/>
            教学改革：<br/><textarea name="" id="3" cols="30" rows="4" placeholder=""></textarea><br/>
            获奖情况：<br/><textarea name="" id="4" cols="30" rows="4" placeholder=""></textarea><br/>
            其它：<br/><textarea name="" id="5" cols="30" rows="4" placeholder=""></textarea><br/>
            <div class="outer">
                <div id="qr" onclick="k()">确认</div>
                <div id="qx" onclick="k()">取消</div>
            </div>
        </form>
    </div>
</div>
</body>
<script type="text/javascript" charset="utf-8">
	UE.getEditor('2');
	UE.getEditor('3');
	UE.getEditor('4');
	
</script>
<<<<<<< HEAD
=======

    
</head>
<body>
<div id="r5">
<div class="main_b_r_t">
		<div class="main_b_r_t">
			<div class="word1" id="w1">
				<p>
					<a target="myinfo"
						href="${pageContext.request.contextPath}/teacher/toMyInfoBase"
						id="p1">基本信息</a>
				</p>
			</div>
			<div class="word2" id="w2">
				<p>
					<a target="myinfo"
						href="${pageContext.request.contextPath}/teacher/toMyInfoAll"
						id="p2">详细信息</a>
				</p>
			</div>
			<div class="word3" id="w3">
				<p>
					<a target="myinfo"
						href="${pageContext.request.contextPath}/teacher/toMyInfoFruit"
						id="p3">个人成果</a>
				</p>
			</div>
		</div>
		<div class="hr"></div>
		<div class="main_b_r_b">
			<iframe id="myinfo" name="myinfo"
				style="width: 100%; height: 100%" frameborder="no" border="0"
				src="${pageContext.request.contextPath}/teacher/toMyInfoBase"></iframe>
		</div>
   
    
    
</div>
</body>
</html>
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
=======
>>>>>>> 8b686c47d14ac368571e08f4b308c03cc9fa9818

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/classInfo.css"/>
		
<link rel="stylesheet" href="./c/ui.css">
<link rel="stylesheet" href="./c/base.css">
<link rel="stylesheet" href="./c/exercise.css">
<script charset="utf-8" async="" src="./c/dangxuan.js.下载"></script><script charset="utf-8" async="" src="./c/questionUtil.js.下载"></script>
<script charset="utf-8" async="" src="./c/highlighter.js.下载"></script>
<link charset="utf-8" rel="stylesheet" href="./c/shCoreDefault.css">
		
		<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body style="background-color:#F8F8F8; ">
	<div style="height: 54px;width: 100%;background: #fff;margin: 10px" >
		<div style="height: 30px;width: 10px; background: #337ab7;float: left;    margin:12px;"></div>
		<div style="margin-top: 14px;float: left;">挑战</div>
	</div>
	
	<div class="subject-progress"
		style="padding: 10px 270px 10px 30px; background: #232c31; border-radius: 4px 4px 0 0; position: relative; white-space: nowrap; height: 50px;margin-left: 10px">
		<div class="progress"
			style="margin: 0; width: 90%; margin-right: 10px; display: inline-block;  background: #ebedef; border-radius: 32px; height: 12px;">
			<div
				style="width: 10%; float: left; height: 100%; font-size: 12px; line-height: 20px; color: #fff; text-align: center; background-color: #25bb9b;"
				class="progress-bar"></div>
		</div>
		<span class="progress-nums" style="color: #fff; font-size: 20px;">1/10</span>
		<a href="javascript:void(0);" class="progress-time" title="暂停"> <i
			class="ico-time-control"></i><span data-left="2592000" data-time="0"
			class="time-text"></span>
		</a>
	</div>
	
		<div class="contentlist" style="padding-top: 10px;padding-bottom: 10px;padding-left: 20px;margin: 10px;">
			<div class="subject-title">[单选题]</div>
<div class="subject-main">
<div class="subject-content">
<div class="subject-question">
<p align="justify" style="text-align: justify;">
  <span>按照标识符的要求，（ ）符号不能组成标识符。</span>
</p>
<p>
  <br>
</p>
</div>
<a href="javascript:void(0);" class="subject-options" data-id="110565">
<label class="radio" id="jsCpn_2_checkbox_0">
<span class="icons"></span>
<input type="radio" data-toggle="radio" value="110565">
连接符
</label>
</a>
<a href="javascript:void(0);" class="subject-options" data-id="110566">
<label class="radio" id="jsCpn_3_checkbox_1">
<span class="icons"></span>
<input type="radio" data-toggle="radio" value="110566">
下划线
</label>
</a>
<a href="javascript:void(0);" class="subject-options" data-id="110567">
<label class="radio" id="jsCpn_4_checkbox_2">
<span class="icons"></span>
<input type="radio" data-toggle="radio" value="110567">
大小写字母
</label>
</a>
<a href="javascript:void(0);" class="subject-options" data-id="110568">
<label class="radio" id="jsCpn_5_checkbox_3">
<span class="icons"></span>
<input type="radio" data-toggle="radio" value="110568">
数字字符
</label>
</a>
</div>
<div class="subject-action clearfix">
<div class="subject-opr">
<span class="subject-opr-item"><i class="ico-collect"></i><a href="javascript:void(0);" class="js-follow nc-req-auth" data-id="69267">收藏本题</a></span>
<span class="subject-opr-item"><i class="ico-mark"></i><a href="javascript:void(0);" class="js-mark nc-req-auth" data-id="69267" data-tid="23710921" data-title="标记该题，着重查看。" data-tips-index="2">标记一下</a></span>
<span class="subject-opr-item"><i class="ico-shield"></i><a href="javascript:void(0);" class="js-shield nc-req-auth" data-id="69267" data-title="屏蔽该题，该题将不会出现在以后的组卷中。" data-tips-index="1">屏蔽本题</a></span>
</div>
<div class="subject-next">
<form id="submitForm" method="post" action="https://www.nowcoder.com/question/next?pid=16493923&amp;qid=69267&amp;tid=23710921">
<input type="hidden" name="content" id="answer">
<input id="aheadFinish" type="submit" name="button" class="btn warning-btn" value="提前交卷">
<input id="next" type="submit" name="button" class="btn btn-primary" value="下一题">
</form>
</div>
</div>
</div>

		</div>
		
		
		
	</body>
</html>

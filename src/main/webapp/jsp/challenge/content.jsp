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
		<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body style="background-color:#F8F8F8; ">
	<div style="height: 54px;width: 100%;background: #fff;margin: 10px" >
		<div style="height: 30px;width: 10px; background: #337ab7;float: left;    margin:12px;"></div>
		<div style="margin-top: 14px;float: left;">挑战</div>
	</div>
		<div class="contentlist" style="padding-top: 10px;padding-bottom: 10px;padding-left: 20px;margin: 10px;">
			<div class="row  col-lg-24">
			  <div class=" col-lg-3" style="float: left;width: 16%">
				<a target="_top"  href="${pageContext.request.contextPath}/teacher/toTaskDetail?taskId=${task.taskId }" class="thumbnail">
				
				    <img src="${pageContext.request.contextPath}/images/challenge.ico" alt=""style="height: 100px; width: 100px; display: block;">
				  
				</a>
			  </div>
			  <div class="col-lg-21" style="float: left; height: 100px;margin-top: 3px;width: 70%">
				  <div class="listtitle" style="font-size: 20px;margin-top: 15px;margin-left: 10px;font-weight: bold;" >
				  		<a target="_top" href="${pageContext.request.contextPath}/teacher/toTaskDetail?taskId=${task.taskId }" >c++基础英语</a>
				  			<lable style="font-size: 15px;margin-left: 20px;margin-right: 10px;">15题</lable>
				  			<label style="font-size: 15px;">经验值：1000</label>
				  			<button type="button" class="btn btn-success" style="float:right;">我要挑战</button>
				  </div>
				  <div style="width: 477px;height: 53px;font-size: 10px;margin-top: 10px;margin-left: 12px;">
				  	 c++基础知识应用,利用c++基础语法知识与算法原理完成关卡中所给题目。
				  </div>
				  <div class="listmessage" style="margin-left: 10px;font-size: 10px;color: #999999;">
					  发布时间：2010.1.1&nbsp;&nbsp;&nbsp;&nbsp;
					  
				  	<button class="proplenum" style="background-color: #FFFFFF;margin-left: 20px;padding: 0;   border: 1px solid #00FFFF;  -moz-border-radius: 15px;-webkit-border-radius: 15px;border-radius:15px;">
						&nbsp;&nbsp;通过人数/总人数：101/101&nbsp;&nbsp;
					</button>
				  </div>
			  </div>
			</div>
			<hr>
		</div>
		
		<div class="contentlist" style="padding-top: 10px;padding-bottom: 10px;padding-left: 20px;margin: 10px;">
			<div class="row  col-lg-24">
			  <div class=" col-lg-3" style="float: left;width: 16%">
				<a target="_top"  href="${pageContext.request.contextPath}/teacher/toTaskDetail?taskId=${task.taskId }" class="thumbnail">
				
				    <img src="${pageContext.request.contextPath}/images/challenge.ico" alt=""style="height: 100px; width: 100px; display: block;">
				  
				</a>
			  </div>
			  <div class="col-lg-21" style="float: left; height: 100px;margin-top: 3px;width: 70%">
				  <div class="listtitle" style="font-size: 20px;margin-top: 15px;margin-left: 10px;font-weight: bold;" >
				  		<a target="_top" href="${pageContext.request.contextPath}/teacher/toTaskDetail?taskId=${task.taskId }" >c++基础英语</a>
				  			<lable style="font-size: 15px;margin-left: 20px;margin-right: 10px;">15题</lable>
				  			<label style="font-size: 15px;">经验值：1000</label>
				  			<a  target="lcontent"  id="als" href="${pageContext.request.contextPath}/jsp/challenge/challenge_second.jsp">
				  				<button type="button" class="btn btn-success" style="float:right;">我要挑战</button>
				  			</a>
				  </div>
				  <div style="width: 477px;height: 53px;font-size: 10px;margin-top: 10px;margin-left: 12px;">
				  	 c++基础知识应用,利用c++基础语法知识与算法原理完成关卡中所给题目。
				  </div>
				  <div class="listmessage" style="margin-left: 10px;font-size: 10px;color: #999999;">
					  发布时间：2010.1.1&nbsp;&nbsp;&nbsp;&nbsp;
					  
				  	<button class="proplenum" style="background-color: #FFFFFF;margin-left: 20px;padding: 0;   border: 1px solid #00FFFF;  -moz-border-radius: 15px;-webkit-border-radius: 15px;border-radius:15px;">
						&nbsp;&nbsp;通过人数/总人数：101/101&nbsp;&nbsp;
					</button>
				  </div>
			  </div>
			</div>
			<hr>
		</div>
		
		<div class="contentlist" style="padding-top: 10px;padding-bottom: 10px;padding-left: 20px;margin: 10px;">
			<div class="row  col-lg-24">
			  <div class=" col-lg-3" style="float: left;width: 16%">
				<a target="_top"  href="${pageContext.request.contextPath}/teacher/toTaskDetail?taskId=${task.taskId }" class="thumbnail">
				
				    <img src="${pageContext.request.contextPath}/images/challenge.ico" alt=""style="height: 100px; width: 100px; display: block;">
				  
				</a>
			  </div>
			  <div class="col-lg-21" style="float: left; height: 100px;margin-top: 3px;width: 70%">
				  <div class="listtitle" style="font-size: 20px;margin-top: 15px;margin-left: 10px;font-weight: bold;" >
				  		<a target="_top" href="${pageContext.request.contextPath}/teacher/toTaskDetail?taskId=${task.taskId }" >c++基础英语</a>
				  			<lable style="font-size: 15px;margin-left: 20px;margin-right: 10px;">15题</lable>
				  			<label style="font-size: 15px;">经验值：1000</label>
				  			<button type="button" class="btn btn-success" style="float:right;">我要挑战</button>
				  </div>
				  <div style="width: 477px;height: 53px;font-size: 10px;margin-top: 10px;margin-left: 12px;">
				  	 c++基础知识应用,利用c++基础语法知识与算法原理完成关卡中所给题目。
				  </div>
				  <div class="listmessage" style="margin-left: 10px;font-size: 10px;color: #999999;">
					  发布时间：2010.1.1&nbsp;&nbsp;&nbsp;&nbsp;
					  
				  	<button class="proplenum" style="background-color: #FFFFFF;margin-left: 20px;padding: 0;   border: 1px solid #00FFFF;  -moz-border-radius: 15px;-webkit-border-radius: 15px;border-radius:15px;">
						&nbsp;&nbsp;通过人数/总人数：101/101&nbsp;&nbsp;
					</button>
				  </div>
			  </div>
			</div>
			<hr>
		</div>
		
	</body>
</html>

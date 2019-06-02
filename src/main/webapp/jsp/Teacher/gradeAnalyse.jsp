<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-table.min.css">
		<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap-table.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/js/JSONToExcelConvertor.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			var $table;
	var $tasktype;
	$(document).ready(function() {
		var $exportDate;
		$("#exportJSONGrade").click(function(){
			 //自定义标题栏
            var title=['排名','学号','姓名','考勤（得分/参与次数）','作业（得分/参与次数）','实验（得分/参与次数）','课设（得分/参与次数）','翻转（得分/参与次数）',]  
            //自定义导出
            JSONToExcelConvertor($exportDate,"report",title,filter);
		});
		$table = $('#gradeListTable').bootstrapTable({
			method : 'get',
			url : "${pageContext.request.contextPath}/teacher/ajaxGetStudentGradeList",//请求路径
			dataType : "json",
			striped : true, //是否显示行间隔色
			pageNumber : 1, //初始化加载第一页
			pagination : true,//是否分页
			striped: true,  //是否显示行间隔色
			fixedScroll:true,
			sidePagination : 'client',//server:服务器端分页|client：前端分页
			pageSize : 20,//单页记录数
			pageList : [ 5, 10, 20, 30 ],//可选择单页记录数
			showRefresh : false,//刷新按钮
			clickToSelect: true,                //是否启用点击选中行
			singleSelect  : true,
			queryParams : function(params) {//上传服务器的参数
				var temp = {//如果是在服务器端实现分页，limit、offset这两个参数是必须的
					limit : params.limit, // 每页显示数量
					offset : params.offset // SQL语句起始索引
					//page : (params.offset / params.limit) + 1, //当前页码 
					/* Name : $('#search_name').val(),
					Tel : $('#search_tel').val() */
				};
				return temp;
			},
			columns : [{
				field : 'studentRank',
				title : '排名',
				width:50
			}, {
				field : 'studentName',
				title : '姓名',
				width:100
			}, {
				field : 'studentId',
				title : '学号',
				width:100
			}, {
				field : 'attenceGrade',
				title : '考勤（得分</br>/参与次数）',
				width:100
			}, {
				field : 'workGrade',
				title : '作业（得分</br>/参与次数）',
				width:100
			}, {
				field : 'trialGrade',
				title : '实验（得分</br>/参与次数）',
				width:100
			}, {
				field : 'courseDesignGrade',
				title : '课设（得分</br>/参与次数）',
				width:100
			}, {
				field : 'turnClassGrade',
				title : '翻转（得分</br>/参与次数）',
				width:100
			}, {
				field : 'sumGrade',
				title : '总分',
				
				width:100
			}],
			onLoadSuccess: function (res) {//可不写
	            //加载成功时
	        	console.log(res);
	        	$exportDate=res;
	        }, onLoadError: function (statusCode) {
	            return "加载失败了";
	        }, formatLoadingMessage: function () {
	            //正在加载
	            return "拼命加载中...";
	        }, formatNoMatches: function () {
	            //没有匹配的结果
	            return '无符合条件的记录';
	        }

		});
	});
		</script>
	</head>
	<body style="background-color: #F1F3F4;">
		<div style="width: 100%; height: 50px; margin: 0 auto; background-color: #fff;">
			<div style="width: 20px; height: 50px; background: #015293;float: left;"></div>
			<span style="line-height: 55px;font-size: 18px;margin-left: 20px;font-weight: bold;">成绩分析</span>
			<button id="exportJSONGrade" type="button" class="btn btn-primary" style="float: right;margin-top: 10px;margin-right: 20px;">导出总成绩表</button>
		</div>
		<div style="width: 100%;height: 100%;overflow: hidden;margin: 10px 0;">
			<div class="btn-group btn-group-justified" role="group" aria-label="...">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default">作业（总分/总次数）<span>${workPublishNum*10 }/${workPublishNum }</span></button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default">实验（总分/总次数）<span>${trialPublishNum*10 }/${trialPublishNum }</span></button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default">课设（总分/总次数）<span>${courseDesignPublishNum*100 }/${courseDesignPublishNum }</span></button>
				</div>
			</div>
			<div class="btn-group btn-group-justified" role="group" aria-label="...">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default">翻转（总分/总次数）<span>${turnClassPublishNum*20 }/${turnClassPublishNum }</span></button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default">考勤（总分/总次数）<span>${attencePublishNum*5 }/${attencePublishNum }</span></button>
				</div>
				<div class="btn-group" role="group" style="display: none;outline: none;">
					<button type="button" class="btn btn-default"> </button>
				</div>
			</div>
		</div>
		<div style="height: 100%;width: 100%;overflow: hidden;background-color: #fff;">
			<table id="gradeListTable" style="table-layout: fixed;"></table>
		</div>
	</body>
</html>

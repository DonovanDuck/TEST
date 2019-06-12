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
		
			function TableInit(tableid){
				$table = $('#'+tableid).bootstrapTable({
					method : 'get',
					url : "${pageContext.request.contextPath}/student/ajaxGetStudentTaskListPage?taskCategory=work",//请求路径
					dataType : "json",
					striped : true, //是否显示行间隔色
					pageNumber : 1, //初始化加载第一页
					pagination : true,//是否分页
					striped: true,  //是否显示行间隔色
					sidePagination : 'client',//server:服务器端分页|client：前端分页
					pageSize : 5,//单页记录数
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
						field : 'taskId',
						title : '序号',
						formatter: function (value, row, index) {
				            var pageSize = $('#'+tableid).bootstrapTable('getOptions').pageSize;     //通过table的#id 得到每页多少条
				            var pageNumber = $('#'+tableid).bootstrapTable('getOptions').pageNumber; //通过table的#id 得到当前第几页
				            return pageSize * (pageNumber - 1) + index + 1;    // 返回每条的序号： 每页条数 *（当前页 - 1 ）+ 序号
				        }
					
					}, {
						field : 'taskTitle',
						title : '作业名称',
						
					}, {
						field : 'mygrade',
						title : '个人得分',
						
					}, {
						field : 'minGrade',
						title : '班级最低分',
						
					}, {
						field : 'maxGrade',
						title : '班级最高分',
						
					}]
						
				});
			};
			

		function showWorkAnalyse() {
			var stats=$("#workTaskList").css("display");
			if(stats=="block"){
				$("#workTaskList").css("display","none");
			}else if(stats=="none"){
				$("#workTaskList").css("display","block");
			}
			TableInit("workTaskListTable");
			$('#workTaskListTable').bootstrapTable(
					'refresh', 
					{url : "${pageContext.request.contextPath}/student/ajaxGetStudentTaskListPage?taskCategory=work"
					});
		};
		function showTrialAnalyse() {
			var stats=$("#trialTaskList").css("display");
			if(stats=="block"){
				$("#trialTaskList").css("display","none");
			}else if(stats=="none"){
				$("#trialTaskList").css("display","block");
			}
			TableInit("trialTaskListTable");
			$('#trialTaskListTable').bootstrapTable(
					'refresh', 
					{url : "${pageContext.request.contextPath}/student/ajaxGetStudentTaskListPage?taskCategory=trial"
					});
		};
		function showTurnClassAnalyse() {
			var stats=$("#turnClassTaskList").css("display");
			if(stats=="block"){
				$("#turnClassTaskList").css("display","none");
			}else if(stats=="none"){
				$("#turnClassTaskList").css("display","block");
			}
			TableInit("turnClassTaskListTable");
			$('#turnClassTaskListTable').bootstrapTable(
					'refresh', 
					{url : "${pageContext.request.contextPath}/student/ajaxGetStudentTaskListPage?taskCategory=turn_class"
					});
		};
		function showCourseDesignAnalyse() {
			var stats=$("#courseDesignTaskList").css("display");
			if(stats=="block"){
				$("#courseDesignTaskList").css("display","none");
			}else if(stats=="none"){
				$("#courseDesignTaskList").css("display","block");
			}
			TableInit("courseDesignTaskListTable");
			$('#courseDesignTaskListTable').bootstrapTable(
					'refresh', 
					{url : "${pageContext.request.contextPath}/student/ajaxGetStudentTaskListPage?taskCategory=course_design"
					});
			
		};
			</script>
	</head>
	<body style="background-color: #F1F3F4;">
		<div style="width: 100%; height: 50px; margin: 0 auto; background-color: #fff;">
			<div style="width: 20px; height: 50px; background: #015293;float: left;"></div>
			<span style="line-height: 55px;font-size: 18px;margin-left: 20px;font-weight: bold;">个人成就</span>
		</div>
		<!-- 作业分析 -->
		<div class="workAnalyse" style="width: 100%;height: 100%;overflow: hidden;background-color: #fff;margin-top: 15px;padding-left: 40px;padding-right: 40px">
			<div class="analyse" style="width: 100%;height: 100%;overflow: hidden;">
				<div style="font-size: 18px;font-weight: bold;margin-bottom: 20px;margin-top: 20px;">作业</div>
				<div style="margin-bottom: 20px;">
					<div style="float: left;margin-right: 30px;">总得分：${gradeWork }</div>
					<div style="float: left;">共提交次数：${upNumWork }</div>
					<div style="float: right;margin-right: 100px;margin-bottom: 10px;"><button class="btn btn-default" type="submit" onclick="showWorkAnalyse()">详情</button></div>
					
				</div>
				<div class="div1 clearfloat" style="clear: both;"></div>
				
			</div>
			<hr>
			<div id="workTaskList" style="height: 100%;width: 100%;overflow: hidden;background-color: #fff;margin-top: 30px;display: none;margin-bottom: 30px">
				<table id="workTaskListTable"></table>
			</div>
		</div>
		<!-- 实验分析 -->
		<div class="workAnalyse" style="width: 100%;height: 100%;overflow: hidden;background-color: #fff;margin-top: 15px;padding-left: 40px;padding-right: 40px">
			<div class="analyse" style="width: 100%;height: 100%;overflow: hidden;">
				<div style="font-size: 18px;font-weight: bold;margin-bottom: 20px;margin-top: 20px;">实验</div>
				<div style="margin-bottom: 20px;">
					<div style="float: left;margin-right: 30px;">总得分：${gradeTrial }</div>
					<div style="float: left;">共提交次数：${upNumTrial }</div>
					<div style="float: right;margin-right: 100px;margin-bottom: 10px;"><button class="btn btn-default" type="submit" onclick="showTrialAnalyse()">详情</button></div>
					
				</div>
				<div class="div1 clearfloat" style="clear: both;"></div>
				
			</div>
			<hr>
			<div id="trialTaskList" style="height: 100%;width: 100%;overflow: hidden;background-color: #fff;margin-top: 30px;display: none;margin-bottom: 30px">
				<table id="trialTaskListTable"></table>
			</div>
		</div>
		<!-- 翻转分析 -->
		<div class="workAnalyse" style="width: 100%;height: 100%;overflow: hidden;background-color: #fff;margin-top: 15px;padding-left: 40px;padding-right: 40px">
			<div class="analyse" style="width: 100%;height: 100%;overflow: hidden;">
				<div style="font-size: 18px;font-weight: bold;margin-bottom: 20px;margin-top: 20px;">翻转</div>
				<div style="margin-bottom: 20px;">
					<div style="float: left;margin-right: 30px;">总得分：${gradeTurnClass }</div>
					<div style="float: left;">共提交次数：${upNumTurnClass }</div>
					<div style="float: right;margin-right: 100px;margin-bottom: 10px;"><button class="btn btn-default" type="submit" onclick="showTurnClassAnalyse()">详情</button></div>

				</div>
				<div class="div1 clearfloat" style="clear: both;"></div>
				
			</div>
			<hr>
			<div id="turnClassTaskList" style="height: 100%;width: 100%;overflow: hidden;background-color: #fff;margin-top: 30px;display: none;margin-bottom: 30px">
				<table id="turnClassTaskListTable"></table>
			</div>
		</div>
		<!-- 课设分析 -->
		<div class="workAnalyse" style="width: 100%;height: 100%;overflow: hidden;background-color: #fff;margin-top: 15px;padding-left: 40px;padding-right: 40px">
			<div class="analyse" style="width: 100%;height: 100%;overflow: hidden;">
				<div style="font-size: 18px;font-weight: bold;margin-bottom: 20px;margin-top: 20px;">课设</div>
				<div style="margin-bottom: 20px;">
					<div style="float: left;margin-right: 30px;">总得分：${gradeCourseDesign }</div>
					<div style="float: left;">共提交次数：${upNumCourseDesign }</div>
					<div style="float: right;margin-right: 100px;margin-bottom: 10px;"><button class="btn btn-default" type="submit" onclick="showCourseDesignAnalyse()">详情</button></div>

				</div>
				<div class="div1 clearfloat" style="clear: both;"></div>
				
			</div>
			<hr>
			<div id="courseDesignTaskList" style="height: 100%;width: 100%;overflow: hidden;background-color: #fff;margin-top: 30px;display: none;margin-bottom: 30px">
				<table id="courseDesignTaskListTable"></table>
			</div>
		</div>
		
	</body>
</html>

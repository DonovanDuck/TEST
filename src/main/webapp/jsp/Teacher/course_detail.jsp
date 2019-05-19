<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title>课程三级页面</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/scaffolding.less">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/course3.css">
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
</head>
<body>
<head>
<div class="container-fluid">
	<nav>
		<ul class="nav nav-pills">
			<li role="presentation" class="active"><a href="#">首页</a></li>
			<li role="presentation"><a href="#">课程</a></li>
			<li role="presentation"><a href="#">讨论区</a></li>
			<li role="presentation"><a href="#">学生成果</a></li>
			<li role="presentation"><a href="#">产学研项目</a></li>
		</ul>
	</nav>
</div>
</head>

<script type="text/javascript">
	function attention(){
		//alert('${course.courseId}');
		 $.ajax({
			async:false,
			cache:false,
			url:"${pageContext.request.contextPath}/teacher/ajaxAttentionCourse",
			data:{'courseId':'${course.courseId}'},
			type:"POST",
			dataType:"text",
			success:function(result) {
				alert(eval(result));
				if(eval(result) == "关注成功！"){
					$("#attention").html("已关注");
				}
				else{
					$("#attention").html("关注");
				}
			}
		}); 
	}
</script>

<main>
<div class="main_t">
	<div class="container-fluid">
		<c:if test="${ attention != 2 }">
			<button type="button" class="btn btn-default" id="attention"
				onclick="attention()">关注</button>
		</c:if>
		<c:if test="${ attention == 2 }">
			<button type="button" class="btn btn-default" id="attention"
				onclick="attention()">已关注</button>
		</c:if>
		<h1>${course. courseName}</h1>
		<c:if test="${course.fine != null && course.fine != '' }">
			<div
				style="color: red; position: relative; left: 10%; height: 50px; float: left;">
				<span>${course.fine }</span>
			</div>
		</c:if>
		<p>参与人数：${course.courseStudentNum }
			&nbsp;&nbsp;&nbsp;创课时间：${publishTime }</p>
	</div>
</div>

<div class="main_b">
	<div class="main_b_t">
		<div class="container">
			<div class="container_left">
				<h3>简介</h3>
				<p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;${course.courseDetail }</p>
				<!-- <h3>大纲</h3>
                <p class="inner">
                    第1部分 线性数据结构 <br>
                    该部分训练对线性结构实现方法，涉及线性表、队列、栈。<br>
                    <br>
                    1-1  数据结构与算法 - 线性表 <br>
                    1-2  数据结构与算法 - 队列 <br>
                    1-3  数据结构与算法 - 栈 <br>
                    第2部分 线性结构的应用 <br>
                    该部分训练线性结构在典型问题中应用，以及针对线性结构的排序和查找算法。 <br>
                    <br>
                    2-1  数据结构与算法 - 计算表达式 <br>
                    2-2  数据结构与算法 - 字符串匹配 <br>
                    2-3  数据结构与算法 - 排序 <br>
                    2-4  数据结构与算法 - 查找 <br>
                    第3部分 树和图 <br>
                    该部分训练对树形数据结构和图数据结构的掌握。 <br>
                    <br>
                    3-1  数据结构与算法 - 树 <br>
                    3-2  数据结构与算法 - 图 <br>
                </p> -->
			</div>
			<div class="container_right">
				<h3>教师圈</h3>
				<ul style="list-style: none;">
					<c:forEach items="${teacherList }" var="teacher">
					<li>
						<div>
							<ul style="list-style: none;">
								<li style="float: left;">
									<div
										style="width: 60px; height: 60px; margin-left: 10px; margin-top: 10px;">
										<img style="border-radius: 50%; width: 100%; height: 100%"
											src="${pageContext.request.contextPath}/images/t2.png" alt="" />
									</div>
								</li>
								<li style="float:left; position: relative; top: 30px; left: 18px;">
									<div style="width: 100px; height: 50px;">
										<ul style="list-style: none;">
											<li style="margin-right: 10px; float: left;">${teacher.teacherName }</li>
											<li>${teacher.professionalTitles }</li>
										</ul>
									</div>
								</li>
							</ul>
						</div>
					</li>
					<!-- 清除浮动 -->
					<div style="clear: both;"></div>
					</c:forEach>
					<li>
						<div>
							<ul style="list-style: none;">
								<li style="float: left;">
									<div
										style="width: 60px; height: 60px; margin-left: 10px; margin-top: 10px;">
										<img style="border-radius: 50%; width: 100%; height: 100%"
											src="${pageContext.request.contextPath}/images/t2.png" alt="" />
									</div>
								</li>
								<li style="float:left; position: relative; top: 30px; left: 18px;">
									<div style="width: 100px; height: 50px;">
										<ul style="list-style: none;">
											<li style="margin-right: 10px; float: left;">嘉能可</li>
											<li>副教授</li>
										</ul>
									</div>
								</li>
							</ul>
						</div>
					</li>
				</ul>

			</div>
		</div>
	</div>
	<div class="main_b_m">
		<div class="container">
			<div class="brother">
				<a href="#">更多</a>
				<h3>教案库</h3>
				
				<p>1、JAVA语言概述与开发环境的搭建</p>
				<p>2、简单的JAVA程序</p>
				<p>3、数据运算、流控制和数组</p>
				<p>4、类、包和接口</p>
			</div>
			<div class="brother">
				<a href="#">更多</a>
				<h3>实验库</h3>
				<p>1、创建java Application和 java Applet程序</p>
				<p>2、类的继承</p>
				<p>3、接口的应用</p>
				<p>4、熟练掌握多线程</p>
			</div>
			<div class="brother">
				<a href='${pageContext.request.contextPath}/teacher/toCourseResource/4'>更多</a>
				<h3>作业库</h3>
				<c:forEach items ="${taskList}" varStatus="status" var = "task"  begin="0" end ="4">
					<p>${requestScope.offset+status.index +1}、${task.taskTitle }</p>
				</c:forEach>
				<!-- <h3>作业库</h3>
				<p>1、创建第一个java 程序 Hello World</p>
				<p>2、练习数据类型转换</p>
				<p>3、熟练掌握类的继承</p>
				<p>4、用类实现求两点间的距离</p> -->
			</div>
			<div class="brother">
				<a href='${pageContext.request.contextPath}/teacher/toCourseResource/3'>更多</a>
				<h3>多媒体库</h3>
				<c:forEach items ="${resource}" varStatus="status" var = "re"  begin="0" end ="4">
					<p>${requestScope.offset+status.index +1}、${re.resourceName }</p>
				</c:forEach>
				<!-- 
				<p>2、简单的JAVA程序视频演示</p>
				<p>3、数据运算、流控制和数组视频教程</p>
				<p>4、类的使用视频教程</p> -->
			</div>
			<div class="brother">
				<a href="#">更多</a>
				<h3>课设库</h3>
				<p>1、图书信息管理系统</p>
				<p>2、简单小游戏</p>
				<p>3、记事本</p>
				<p>4、员工信息管理系统</p>
			</div>
			<div class="brother">
				<a href="#">更多</a>
				<h3>教学资源库</h3>
				<p>1、JAVA语言概述与开发环境的搭建</p>
				<p>2、简单的JAVA程序</p>
				<p>3、数据运算、流控制和数组</p>
				<p>4、类、包和接口</p>
			</div>
		</div>
	</div>
	<div class="main_b_b">
		<div class="container">
			<h3>拓展任务</h3>
		</div>
	</div>
</div>
</main>
<footer></footer>
</body>
</html>
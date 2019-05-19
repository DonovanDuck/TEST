<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<<<<<<< HEAD
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
=======
<html lang="en">
<head>
<meta charset="UTF-8">
<title>课程三级页面</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/lesson3.css" />
<!--head-->
<link href="http://www.tit.edu.cn/images/logo.ico" rel="Shortcut Icon">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css">
<link
	href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet" />

<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
<script
	src="${pageContext.request.contextPath}/js/Admin/bootstrap.min.js"></script>
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76

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
<<<<<<< HEAD
				if(eval(result) == "关注成功！"){
					$("#attention").html("已关注");
				}
				else{
					$("#attention").html("关注");
				}
=======
				 
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
			}
		}); 
	}
</script>

<<<<<<< HEAD
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
=======
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/jsp/top.jsp" flush="true" />
		<!-- header End -->
		<main>
		<div class="main_t">
			<div class="img">
				<img
					src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${course.faceImg }"
					alt="" style="width: 100%; height: 100%;" />
			</div>
			<div class="word">
				<div style="float: left;">
					<h1>${course. courseName}</h1>
				</div>
				<c:if test="${course.fine != null && course.fine != '' }">
					<div
						style="color: red; position: relative; top: 34px; left: 20px; width: 50px; height: 50px; float: left;">
						<span>${course.fine }</span>
					</div>
				</c:if>
				<div
					style="width: 244px; height: 60px; position: relative; left: 10px; top: 10px; padding-top: 15px; float: left;">
					<c:if test="${teacher != null && manager == 1 }">
						<a
							href="${pageContext.request.contextPath}/teacher/toModifyCourse/${course.courseId}">
							<button class="btn btn-default" type="submit"
								style="margin-left: 21px; margin-right: 22px;">编辑</button>
						</a>
					</c:if>
					<button id="attention" class="btn btn-default"
						onclick="attention()">关注</button>
				</div>
				<!-- 清除浮动 -->
				<div style="clear: both;"></div>
				<div class="summery">
					<p>
					<li>${category }</li>
					<li>创建时间：${course.publishTime }</li>
					<li>参与人数：${course.courseStudentNum }</li>
					</p>
				</div>
				<c:if test="${teacher != null && (manager == 0 || manager == 1)  }">
					<button style="float: left" type="button" class="btn btn-warning">
						<a
							href="${pageContext.request.contextPath}/teacher/toCreateVirtualClass?courseId=${course.courseId }">创建班级</a>
					</button>
				</c:if>

				<div>

					<c:if test="${student != null && virtualClass != null }">
						<a target="_parent"
							href="${pageContext.request.contextPath}/teacher/toClassDetail?virtualClassNum=${virtualClass.virtualClassNum }&virtualClassName=${virtualClass.virtualClassName }">
							<button class="btn btn-default" type="submit"
								style="margin-left: 43px;">班级信息</button>
						</a>
					</c:if>
					
					<c:if test="${teacher != null && (manager == 0 || manager == 1)  }">
					
						<a target="_parent"
							href="${pageContext.request.contextPath}/teacher/toPublishResource">
							<button class="btn btn-default" type="submit"
								style="margin-left: 43px;">发布资源</button>
						</a>
						
						<a target="_parent"
							href="${pageContext.request.contextPath}/teacher/toResourceMain">
							<button class="btn btn-default" type="submit"
								style="margin-left: 43px;">资源管理</button>
						</a>
					
				</c:if>

					<button class="btn btn-default" type="submit"
						style="margin-left: 35px;">课程讨论区</button>
				</div>

			</div>
		</div>
		<div class="main_b">
			<div class="main_b_t">
				<nav>
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/teacher/toCourseIntroduce/${course.courseId}"
							target="target">课程介绍</a></li>
						<li><a
							href="${pageContext.request.contextPath}/resource/toTeacherResource/${course.courseId}"
							target="target">资源</a></li>
						<li><a
							href="${pageContext.request.contextPath}/jsp/Teacher/teacher-resource-expansion-task.jsp"
							target="target">拓展任务</a>
						<%-- <li style="width: 160px"><a
							href="${pageContext.request.contextPath}/teacher/teacherClassList/${course.courseId }"
							target="target">暂时的开课班级列表</a></li> --%>
						<%-- <li><a
							href="${pageContext.request.contextPath}/jsp/Teacher/teacher-release-task.jsp"
							target="_blank">发布任务</a></li> --%>
						<%-- <li><a
							href="${pageContext.request.contextPath}/teacher/toPublishResource"
							target="_blank">发布资源</a></li>
						<li><a
							href="${pageContext.request.contextPath}/teacher/toResourceMain"
							target="_blank">资源管理</a></li> --%>
					</ul>
				</nav>
			</div>
			<div class="main_b_b">
				<iframe
					src="${pageContext.request.contextPath}/teacher/toCourseIntroduce/${course.courseId}"
					name="target" frameborder="0" width="65%" height="100%"
					scrolling="auto"></iframe>
				<div class="friend">
					<div class="h3">
						<h2>教师圈</h2>
					</div>

					<c:forEach items="${teacherList }" var="teacher">
						<div class="teacher">
							<div class="img">
								<img src="${pageContext.request.contextPath}/images/t1.png"
									alt="" />
							</div>
							<div class="word">
								<p>${teacher.teacherName }</p>
								<p>${teacher.professionalTitles }</p>
							</div>
						</div>
					</c:forEach>


					<div class="teacher">
						<div class="img">
							<img src="${pageContext.request.contextPath}/images/t2.png"
								alt="" />
						</div>
						<div class="word">
							<p>陈良育</p>
							<p>副教授</p>
						</div>
					</div>
					<div class="teacher">
						<div class="img">
							<img src="${pageContext.request.contextPath}/images/t3.png"
								alt="" />
						</div>
						<div class="word">
							<p>李春艳</p>
							<p>副教授</p>
						</div>
					</div>
					<div class="teacher">
						<div class="img">
							<img src="${pageContext.request.contextPath}/images/t4.png"
								alt="" />
						</div>
						<div class="word">
							<p>李茵</p>
							<p>讲师</p>
						</div>
					</div>
					<div class="teacher">
						<div class="img">
							<img src="${pageContext.request.contextPath}/images/t5.png"
								alt="" />
						</div>
						<div class="word">
							<p>张晶</p>
							<p>教师</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		</main>
		<div class="footer">
			<div class="container">

				<!--row End-->
				<div class="foot-bq">
					<!-- 版权内容请在本组件"内容配置-版权"处填写 -->
					<div
						style="width: 900px; text-align: center; float: left; position: relative; left: 135px; top: 17px;">
						<p>地址：山西省太原市尖草坪区新兰路31号&nbsp;&nbsp;&nbsp;&nbsp;邮编：030008</p>
						<p>
							版权所有：太原工业学院&nbsp;&nbsp;&nbsp;&nbsp;ICP备案号：晋ICP备14003279号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;晋公网安备号：140110430070001
						</p>
					</div>
				</div>
			</div>
			<!--container End-->
		</div>
	</div>
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
</body>
</html>
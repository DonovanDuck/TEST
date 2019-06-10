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
<title>${course. courseName}</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/scaffolding.less">
<link
	href="${pageContext.request.contextPath}/css/achievement/achievementMain.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/course3.css">
<script
	src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
</head>
<body>


<style>
	.a
{
	width:313px;
	height:0;
	background-color:#f0f0f0;
	opacity: 0;
	transition:height 0.2s linear,opacity 0.2s linear;
	-webkit-transition:height 0.2s linear,opacity 0.2s linear; /* Safari */
	padding-left: 26px;
    padding-top: 18px;
	
}
.b{
	width:187px;
	min-height:77px;
	height: auto;
	position: relative;
}

.b:hover .a
{
	height:100px;
	
	opacity: 1;
	
}
.xiangmu-out .rel-img img{
    		width: 100%;
    		height: 100%;
    		overflow: hidden;
    		transition:all 0.5s;
    	}
   .xiangmu-out:hover{
    box-shadow: 0 0 15px grey;
    transform: translate(0,-10px);
}

.xiangmu-out .rel-img{
	overflow: hidden;
</style>

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
<jsp:include page="/jsp/top.jsp" flush="true" />
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
		<p>类别：${category}系&nbsp;&nbsp;&nbsp; 参与人数：${course.courseStudentNum }
			&nbsp;&nbsp;&nbsp;创课时间：${publishTime }</p>
	</div>
</div>

<div class="container" style="height: 62px;">
		 <div class="main_b_t">
				<nav>
					<ul style="    margin-top: 25px;margin-left: -14px;">
						<li style="float: left;margin-right: 25px"><a style="font-size: 22px;"
							href="#">课程介绍</a></li>
						<li style="float: left;margin-right: 25px"><a style="font-size: 22px;"
							href="${pageContext.request.contextPath}/teacher/toCourseResource/0"
							>资源</a></li>
						<li style="float: left;margin-right: 25px"><a style="font-size: 22px;"
							href=""
							>翻转课堂</a>
						 <li style="float: left;margin-right: 25px"><a style="font-size: 22px;"
							href=""
							>挑战</a></li> 
						 <li style="float: left;margin-right: 25px;margin-bottom: 2%;"><a style="font-size: 22px;"
							href=""
							>课程成果</a></li>
					</ul>
				</nav>
			</div>
	</div>

<div class="main_b">
	<div class="main_b_t">
		<div class="container" style="margin-bottom: 23px;">
			<div class="container_left">
				<h3>简介</h3>
				<iframe style="margin-left: 12px;margin-top: -2px;"
					src="${pageContext.request.contextPath}/teacher/toCourseIntroduceFrame/${course.courseId }"
					 frameborder="0" width="93%" height="100%"
					scrolling="auto"></iframe>
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
				<h3>教师团队</h3>
					<iframe style="margin-left: 12px;margin-top: -2px;"
					src="${pageContext.request.contextPath}/teacher/toCourseTeacherFrame/${course.courseId }"
					frameborder="0" width="93%" height="87%"
					scrolling="auto"></iframe>

			</div>
		</div>
	</div>
	<c:if test="${taskList != null || resource != null }">
	<div class="main_b_m">
		 <div class="container" style="height: 494px;">
		 <div class="main_b_t">
				<nav>
					<ul style="    margin-top: 25px;margin-left: 38px;">
						<li style="float: left;margin-right: 25px"><a style="font-size: 22px;"
							href="${pageContext.request.contextPath}/teacher/toCourseResourceFrame/6/${course.courseId }"
							target="target">教案库</a></li>
						<li style="float: left;margin-right: 25px"><a style="font-size: 22px;"
							href="${pageContext.request.contextPath}/teacher/toCourseResourceFrame/7/${course.courseId }"
							target="target">教学资源库</a></li>
						<li style="float: left;margin-right: 25px"><a style="font-size: 22px;"
							href="${pageContext.request.contextPath}/teacher/toCourseResourceFrame/5/${course.courseId }"
							target="target">多媒体资源库</a>
						 <li style="float: left;margin-right: 25px"><a style="font-size: 22px;"
							href="${pageContext.request.contextPath}/teacher/toCourseResourceFrame/8/${course.courseId }"
							target="target">作业库</a></li> 
						 <li style="float: left;margin-right: 25px"><a style="font-size: 22px;"
							href="${pageContext.request.contextPath}/teacher/toCourseResourceFrame/9/${course.courseId }"
							target="target">实验库</a></li>
						<li style="float: left;margin-right: 25px"><a style="font-size: 22px;"
							href="${pageContext.request.contextPath}/teacher/toCourseResourceFrame/10/${course.courseId }"
							target="target">课程设计库</a></li> 
					</ul>
				</nav>
			</div>
			<div style="clear: both;"></div>
				<div style="width: 100%;height: 379px;">
				<iframe style="margin-left: 12px;margin-top: -2px;"
					src="${pageContext.request.contextPath}/teacher/toCourseResourceFrame/8/${course.courseId }"
					name="target" frameborder="0" width="93%" height="110%"
					scrolling="auto"></iframe></div>
			<%--<div class="brother">
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
			</div>--%>
		</div> 
	</div>
	</c:if>
	<div class="main_b_b">
		<div class="container" style="min-height: 412px;height: auto;">
			<h3 style="margin-left: 24px;font-weight: 600;font-size: 28px;">翻转课堂</h3>
			<ul>
	<li class="xiangmu-out" style="float: left; margin-left: 23px;margin-top: 11px;border: 1px solid #dcdcdc;">
		<div  style="  height: 151px;width: 320px;padding-left: 19px;padding-top: 15px;">
			<div style="float: left; height: 27px;width: 67px;
			position: relative;top: -9px;left: -13px;padding-left: 12px; padding-top: 3px;background: #f1ad4e;font-weight: 600;
			color: #fff;border-radius: 3px;">软件类</div>
			<div><span style="font-weight: 500;font-size: 20px;position:relative;left: 25px;top: -7px;">Java 实验一</span></div>
			<div style="clear: both;"></div>	
			<div style="height: 52px;"><span style="font-weight: 300px;">任务简介：</span>java类的继承</div>
			<div style="float: left;width: 20px;height: 20px;position: relative;top: -3px;left: -6px;padding-bottom: 2px;">
				<img src="${pageContext.request.contextPath}/images/position.png" style="width: 100%";height="100%" />
			</div>
			<div style="margin-bottom: 6px;color: #fea552">1029391、1029348班</div>
			<div style="float: left;margin-right: 139px;">发布人：xxxx</div>
			<div>2019-8-8</div>
			
		</div>
	</li>
	<li class="xiangmu-out" style="float: left; margin-left: 23px;margin-top: 11px;border: 1px solid #dcdcdc;">
		<div style="  height: 151px;width: 320px;padding-left: 19px;padding-top: 15px;">
			<div style="float: left; height: 27px;width: 67px;
			position: relative;top: -9px;left: -13px;padding-left: 12px; padding-top: 3px;background: #f1ad4e;font-weight: 600;
			color: #fff;border-radius: 3px;">软件类</div>
			<div><span style="font-weight: 500;font-size: 20px;position:relative;left: 25px;top: -7px;">Java 实验一</span></div>
			<div style="clear: both;"></div>	
			<div style="height: 52px;"><span style="font-weight: 300px;">任务简介：</span>java类的继承</div>
			<div style="float: left;width: 20px;height: 20px;position: relative;top: -3px;left: -6px;padding-bottom: 2px;">
				<img src="${pageContext.request.contextPath}/images/position.png" style="width: 100%";height="100%" />
			</div>
			<div style="margin-bottom: 6px;color: #fea552">1029391、1029348班</div>
			<div style="float: left;margin-right: 139px;">发布人：xxxx</div>
			<div>2019-8-8</div>
			
		</div>
	</li>
	<li class="xiangmu-out" style="float: left; margin-left: 23px;margin-top: 11px;border: 1px solid #dcdcdc;">
		<div style="  height: 151px;width: 320px;padding-left: 19px;padding-top: 15px;">
			<div style="float: left; height: 27px;width: 67px;
			position: relative;top: -9px;left: -13px;padding-left: 12px; padding-top: 3px;background: #f1ad4e;font-weight: 600;
			color: #fff;border-radius: 3px;">软件类</div>
			<div><span style="font-weight: 500;font-size: 20px;position:relative;left: 25px;top: -7px;">Java 实验一</span></div>
			<div style="clear: both;"></div>	
			<div style="height: 52px;"><span style="font-weight: 300px;">任务简介：</span>java类的继承</div>
			<div style="float: left;width: 20px;height: 20px;position: relative;top: -3px;left: -6px;padding-bottom: 2px;">
				<img src="${pageContext.request.contextPath}/images/position.png" style="width: 100%";height="100%" />
			</div>
			<div style="margin-bottom: 6px;color: #fea552">1029391、1029348班</div>
			<div style="float: left;margin-right: 139px;">发布人：xxxx</div>
			<div>2019-8-8</div>
			
		</div>
	</li>
	<li class="xiangmu-out" style="float: left; margin-left: 23px;margin-top: 11px;border: 1px solid #dcdcdc;">
		<div style="  height: 151px;width: 320px;padding-left: 19px;padding-top: 15px;">
			<div style="float: left; height: 27px;width: 67px;
			position: relative;top: -9px;left: -13px;padding-left: 12px; padding-top: 3px;background: #f1ad4e;font-weight: 600;
			color: #fff;border-radius: 3px;">软件类</div>
			<div><span style="font-weight: 500;font-size: 20px;position:relative;left: 25px;top: -7px;">Java 实验一</span></div>
			<div style="clear: both;"></div>	
			<div style="height: 52px;"><span style="font-weight: 300px;">任务简介：</span>java类的继承</div>
			<div style="float: left;width: 20px;height: 20px;position: relative;top: -3px;left: -6px;padding-bottom: 2px;">
				<img src="${pageContext.request.contextPath}/images/position.png" style="width: 100%";height="100%" />
			</div>
			<div style="margin-bottom: 6px;color: #fea552">1029391、1029348班</div>
			<div style="float: left;margin-right: 139px;">发布人：xxxx</div>
			<div>2019-8-8</div>
			
		</div>
	</li>
	<li class="xiangmu-out" style="float: left; margin-left: 23px;margin-top: 11px;border: 1px solid #dcdcdc;">
		<div style="  height: 151px;width: 320px;padding-left: 19px;padding-top: 15px;">
			<div style="float: left; height: 27px;width: 67px;
			position: relative;top: -9px;left: -13px;padding-left: 12px; padding-top: 3px;background: #f1ad4e;font-weight: 600;
			color: #fff;border-radius: 3px;">软件类</div>
			<div><span style="font-weight: 500;font-size: 20px;position:relative;left: 25px;top: -7px;">Java 实验一</span></div>
			<div style="clear: both;"></div>	
			<div style="height: 52px;"><span style="font-weight: 300px;">任务简介：</span>java类的继承</div>
			<div style="float: left;width: 20px;height: 20px;position: relative;top: -3px;left: -6px;padding-bottom: 2px;">
				<img src="${pageContext.request.contextPath}/images/position.png" style="width: 100%";height="100%" />
			</div>
			<div style="margin-bottom: 6px;color: #fea552">1029391、1029348班</div>
			<div style="float: left;margin-right: 139px;">发布人：xxxx</div>
			<div>2019-8-8</div>
			
		</div>
	</li>
	<li class="xiangmu-out" style="float: left; margin-left: 23px;margin-top: 11px;border: 1px solid #dcdcdc;">
		<div style="  height: 151px;width: 320px;padding-left: 19px;padding-top: 15px;">
			<div style="float: left; height: 27px;width: 67px;
			position: relative;top: -9px;left: -13px;padding-left: 12px; padding-top: 3px;background: #f1ad4e;font-weight: 600;
			color: #fff;border-radius: 3px;">软件类</div>
			<div><span style="font-weight: 500;font-size: 20px;position:relative;left: 25px;top: -7px;">Java 实验一</span></div>
			<div style="clear: both;"></div>	
			<div style="height: 52px;"><span style="font-weight: 300px;">任务简介：</span>java类的继承</div>
			<div style="float: left;width: 20px;height: 20px;position: relative;top: -3px;left: -6px;padding-bottom: 2px;">
				<img src="${pageContext.request.contextPath}/images/position.png" style="width: 100%";height="100%" />
			</div>
			<div style="margin-bottom: 6px;color: #fea552">1029391、1029348班</div>
			<div style="float: left;margin-right: 139px;">发布人：xxxx</div>
			<div>2019-8-8</div>
			
		</div>
	</li>
	
</ul>
</div>
</div>

<div class="main_b_b">
		<div class="container" style="min-height: 350px;height: auto;">
			<h3 style="margin-left: 24px;font-weight: 600;font-size: 28px;">挑战</h3>
			<ul>
	<li style="float: left; margin-left: 25px;margin-top: 18px;">
		<div style="  height: 151px;width: 171px;padding-left: 30px;padding-top: 15px;">
			<div style="background: blue; text-align: center;border-radius: 75px;height: 75px;width: 75px;
			position: relative;left: 10px;margin-bottom: 10px;">
				
			</div>
			
			<div>134323454 xxxx</div>
			<div>经验值：1000</div>
			
		</div>
	</li>
	<li style="float: left; margin-left: 25px;margin-top: 18px;">
		<div style="  height: 151px;width: 171px;padding-left: 30px;padding-top: 15px;">
			<div style="background: blue; text-align: center;border-radius: 75px;height: 75px;width: 75px;
			position: relative;left: 10px;margin-bottom: 10px;">
				
			</div>
			
			<div>134323454 xxxx</div>
			<div>经验值：1000</div>
			
		</div>
	</li>
	<li style="float: left; margin-left: 25px;margin-top: 18px;">
		<div style="  height: 151px;width: 171px;padding-left: 30px;padding-top: 15px;">
			<div style="background: blue; text-align: center;border-radius: 75px;height: 75px;width: 75px;
			position: relative;left: 10px;margin-bottom: 10px;">
				
			</div>
			
			<div>134323454 xxxx</div>
			<div>经验值：1000</div>
			
		</div>
	</li>
	<li style="float: left; margin-left: 25px;margin-top: 18px;">
		<div style="  height: 151px;width: 171px;padding-left: 30px;padding-top: 15px;">
			<div style="background: blue; text-align: center;border-radius: 75px;height: 75px;width: 75px;
			position: relative;left: 10px;margin-bottom: 10px;">
			</div>
			
			<div>134323454 xxxx</div>
			<div>经验值：1000</div>
			
		</div>
	</li>
	<li style="float: left; margin-left: 25px;margin-top: 18px;">
		<div style="  height: 151px;width: 171px;padding-left: 30px;padding-top: 15px;">
			<div style="background: blue; text-align: center;border-radius: 75px;height: 75px;width: 75px;
			position: relative;left: 10px;margin-bottom: 10px;">
				
			</div>
			
			<div>134323454 xxxx</div>
			<div>经验值：1000</div>
			
		</div>
	</li>
	
	
</ul>
</div>
</div>
<c:if test="${aocscList != null }">
<div class="main_b_b">
		<div class="container" style="min-height: 350px;height: auto;">
			<h3 style="margin-left: 24px;font-weight: 600;font-size: 28px;">课程成果</h3>
		<%-- <a
							href="${pageContext.request.contextPath}/achievement/toDetailAOCSC?achievementId=${item.achievementId }">
							<div class="chengguo-out col-md-4"
								style="padding: 8px; height: 350px; margin-top: 1%;">
								<div class="doorPlank"
									style="padding: 2.5rem; background-color: white; height: 100%">
									<div class="rel-img">
										<img src="${pageContext.request.contextPath}/img/fire.png"
											style="position: absolute; margin-left: 0; margin-top: 0;">
										<img alt="" style="width: 100%; height: 150px;"
											src="${pageContext.request.contextPath}/images/tu1.jpg" />
									</div>
									<div class="info" style="width: 100%; height: 80px;">
										<div class="infoContent">
											<h3 class="achievementTitle">
												<b>成果</b>
											</h3>
											<p class="description">成果描述</p>
											<p class="description">
												<b>XXXXX</b>推荐&nbsp&nbsp<span
													class="publishTime">发布于：2010-1-1</span>
											</p>
											<p class="publishTime" style="float: right; color: gray">浏览量:11</p>
										</div>
									</div>
								</div>
							</div>
						</a> --%>
						<c:forEach items="${aocscList }" var="item" varStatus="status">
						<a
							href="${pageContext.request.contextPath}/achievement/toDetailAOCSC?achievementId=${item.achievementId }">
							<div class="chengguo-out col-md-4"
								style="padding: 8px; height: 350px; margin-top: 1%;">
								<div class="doorPlank"
									style="padding: 2.5rem; background-color: white; height: 100%">
									<div class="rel-img">
										<img src="${pageContext.request.contextPath}/img/fire.png"
											style="position: absolute; margin-left: 0; margin-top: 0;">
										<img alt="" style="width: 100%; height: 150px;"
											src="${pageContext.request.contextPath}/images/tu2.jpg" />
									</div>
									<div class="info" style="width: 100%; height: 80px;">
										<div class="infoContent">
											<h3 class="achievementTitle">
												<b>${item.achievementName }</b>
											</h3>
											<p class="description">${item.introduction }</p>
											<p class="description">
												<b>${item.achievementCategory }</b>推荐&nbsp&nbsp<span
													class="publishTime">发布于：${item.finishTime }</span>
											</p>
											<p class="publishTime" style="float: right; color: gray">浏览量:${item.browseVolume }</p>
										</div>
									</div>
								</div>
							</div>
						</a>
					</c:forEach>
	
</div>
</div>
</c:if>
<jsp:include page="/jsp/footer.jsp" flush="true"/>
</body>
</html>
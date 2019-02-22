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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/table.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/own.css" />
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script>
	function termSelect() {
		if($('#select option:selected').val()==''){
            var newUrl = '${pageContext.request.contextPath}/teacher/teacherLogin';    //设置新提交地址
            $("#myform").attr('action',newUrl);    //通过jquery为action属性赋值
        }
        if($('#select option:selected').val()=='student'){
            var newUrl = '${pageContext.request.contextPath}/student/LoginStudent';    //设置新提交地址
            $("#myform").attr('action',newUrl);    //通过jquery为action属性赋值
        }
        if($('#select option:selected').val()=='manager'){
            var newUrl = '${pageContext.request.contextPath}/admin/LoginAdmin';    //设置新提交地址
            $("#myform").attr('action',newUrl);    //通过jquery为action属性赋值

        }
	}
</script>
</html>
<body>
	<div id="r2">
		<div class="sx">
			<div class="sx_r">
				<p>
					<span>开课学期:</span> <select placeholder=""
						style="width: 70%; height: 24px; float: right;"
						onchange="termSelect()">
						<c:forEach items="${termList }" var="term">
							<option value="term.termId"
								<c:if test="${term.startYear=='2019'}&&${term.term=='第一学期' }"> selected="selected" </c:if>>${term.startYear }-${term.endYear }
								${term.term }</option>
						</c:forEach>
					</select>
				</p>
			</div>
		</div>
		<!--放筛选学期-->
		<div class="table">
			<c:forEach items="${virtualClassList }" var="virtualClass"
				varStatus="status">
				<a target="_top"
					href="${pageContext.request.contextPath}/teacher/toClassDetail?virtualClassNum=${virtualClass.virtualClassNum }&virtualClassName=${virtualClass.virtualClassName }">

					<div class="b1">
						<div class="b1_l">
							<img
								src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${virtualClass.faceImg }"
								alt="" />
						</div>
						<div class="b1_r">
							<p class="h">${virtualClass.virtualClassName }</p>
							<p class="p1">
								授课班级：
								<c:forEach items="${virtualClass.realClassList }"
									var="realClass">
	            	${realClass.realClassNum }<span>&nbsp;&nbsp;&nbsp;</span>
								</c:forEach>
							</p>
							<p class="p1">课程名称：${virtualClass.virtualCourseName }</p>

							<p class="p2" id="term">开课学期：&nbsp;${virtualClass.term }</p>
						</div>
					</div>
					<hr />
				</a>
			</c:forEach>

		</div>

	</div>
</body>
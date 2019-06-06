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
<title>个人中心</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/own.css" />
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
	function reinitIframe(){
		var iframe = document.getElementById("iframeContent");
				
				 try 
				{ 
				var bHeight = iframe.contentWindow.document.body.scrollHeight; 
				/* 
				var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
				var height = Math.max(bHeight, dHeight); 
				iframe.height = height; */ 
				iframe.height = bHeight; 
			//
				} 
				catch (ex) { } 
	};
	function setIframeHeight() {
		
		var iframe = document.getElementById('iframeContent');
		if (iframe) {
			var iframeWin = iframe.contentWindow
					|| iframe.contentDocument.parentWindow;
			if (iframeWin.document.body) {
				iframe.height = iframeWin.document.documentElement.scrollHeight
						|| iframeWin.document.body.scrollHeight;
			}
		}
	};
	
	</script>
</head>
<body style="background-color: #F8F8F8">
 <jsp:include page="/jsp/top.jsp" flush="true"/>
<main>
    <div class="main_t" style="background: #fff;">
        <div class="images">
            <img src="../images/tou.png" alt=""/>
        </div>
        <div class="message">
            &nbsp;&nbsp;<h2 style="margin-bottom: 17px;">&nbsp;&nbsp;&nbsp;${teacher.teacherName }</h2>
            <p> &nbsp;&nbsp;&nbsp;&nbsp;${teacher.professionalTitles }</p>
        </div>
    </div>
    <div class="main_b">
    	
        <div class="main_b_l">
            <a target="iframeContent" href="${pageContext.request.contextPath}/teacher/toMyCourse"><div class="nav1" ><p><img src="../images/k1.png" alt=""/><span>我的课程</span></p></div></a>
            <a target="iframeContent" href="${pageContext.request.contextPath}/teacher/toMyClass"><div class="nav1" ><p><img src="../images/b1.png" alt=""/><span>我的班级</span></p></div></a>
            <a target="iframeContent" href="${pageContext.request.contextPath}/teacher/toMyClass"><div class="nav1" ><p><img src="../images/b1.png" alt=""/><span>我的成果</span></p></div></a>
            <a target="iframeContent" href="${pageContext.request.contextPath}/teacher/toMyClass"><div class="nav1" ><p><img src="../images/b1.png" alt=""/><span>我的评价</span></p></div></a>
            <a target="iframeContent" href="../html/teacher_talk_iframe.html"><div class="nav1" ><p><img src="../images/l1.png" alt=""/><span>我的讨论</span></p></div></a>
            <a><div class="nav1" onclick="d()"><p><img src="../images/j1.png" alt=""/><span>我的团队</span></p></div></a>
            <a target="iframeContent" href="${pageContext.request.contextPath}/teacher/toMyInfo"><div class="nav1" ><p><img src="../images/g1.png" alt=""/><span>修改信息</span></p></div></a>
        </div>
        <div class="main_b_r" style="width: 83%;float: left;height: 100%">
        <iframe  id="iframeContent" name="iframeContent"
                width="900px" height="100%"
                frameborder="no" border="0" scrolling="no"
                src="${pageContext.request.contextPath}/teacher/toMyCourse" ></iframe>
        </div>
    </div>
</main>
<jsp:include page="/jsp/footer2.jsp" flush="true"/>

</body>
</html>
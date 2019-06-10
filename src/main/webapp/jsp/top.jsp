<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>太原工业学院</title>
    
    <style>
    header{
    width: 100%;
    height: 143px;
    background-size: cover;
    position: relative;
}
li{
	list-style: none;
}
/*---------------登录------------------*/
header span{
    width: 39%;
    float: right;
    text-align: center;
    line-height: 30px;
    margin-top: 1%;
}
header span li{
    width: 51px;
    float: left;
    color: white;
    margin-right: 1%;
    margin-left:1%;
    line-height: 30px;
}
header span li a{
    color: white;
    font-size: 17px;
}
header span li:nth-child(1){
    position: relative;
}
.erweima{
    width: 130px;
    position: absolute;
    padding: 1%;
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
    display: none;
    z-index: 1;
}
.li1:hover .erweima{
    display: block;
}
.spanLi2{
	width: 130px;
    position: absolute;
    padding: 1%;
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
    left: 963px;
    top: 29px;
    display: none;
    z-index: 1;
}
.spanLi2 li{
    width: 100%;
    height: 30px;
    font-size: 16px;
}
.m:hover .spanLi2{
    display: block;
}
header span li a:hover{
    text-decoration: underline;
}
header span li:nth-child(5){
    position: relative;
}


/*--------------导航---------------*/
header nav {
    width: 49%;
    float: right;
    line-height: 30px;
    right: -3%;
    bottom: 15%;
    position: absolute;
   
}
header nav li{
    float: left;
    margin-left: 0;
    margin-right: 1%;
    width: 10%;
    text-align: center;
    border-radius: 3px;
        height: 34px;
    padding-top: 2px;
}
header nav li a:hover{
    color: blue;
}
header nav li a{
    color: white;
}
.li3{
	float: left;
    margin-left: 0;
    margin-right: 4%;
    background: #fff;
    width: 10%;
    text-align: center;
    border-radius: 3px;
        height: 34px;
    padding-top: 2px;
}
.li3 a{
	    color: #015293;
}
    </style>
    <script src="${pageContext.request.contextPath}/js/jquery.min%20(1).js" ></script>
    <script type="text/javascript">
        $(function (){
            var order=1;
            window.setInterval(lunbo,1000);
            function lunbo(){
                if(order==4){
                    order=0;
                }
                $(".banner-img img").eq(order).css("display","block").siblings().css("display","none");
                $(".square .square1").eq(order).css("background-color","#FF6600").siblings().css("background-color","white");
                order++;
            }
        });
    </script>
    <script>
     function dianji(ob){
    	 var topFlag = $(ob).attr("id");
    	 HttpServletRequest.getSession().setAttribute('topFlag', topFlag);
     };
    </script>
</head>
<body>
	<div style="width: 100%;height: 143px;background-size: cover;">
      <header style="background: url('${pageContext.request.contextPath}/images/head.png') no-repeat;webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover;">
   		<c:if test="${teacher == null && student == null }">
          <span style=" padding-left: 20%">
         </c:if>
         <c:if test="${teacher != null || student != null }">
          <span style=" padding-left: 7%">
         </c:if>
         
              <li class="li1"><a href="">微信端</a>
                  <div class="erweima">
                      <img src="${pageContext.request.contextPath}/images/erweima.png" alt="">
                  </div>
              </li>
              <li>|</li>
              <c:if test="${teacher == null && student == null }">
              <li><a href="<c:url value='/jsp/Teacher/index.jsp'/>">登录</a></li>
              </c:if>
               <c:if test="${teacher != null  }">
              <li class="m" style="width: 120px;"><a href="<c:url value='/teacher/toTeacherPage'/>">欢迎:${teacher.teacherName }</a></li>
              <li>|</li>
              <li class="li2"><a href="<c:url value='/teacher/quit'/>">退出</a></li>
               </c:if> 
              <c:if test="${student != null }">
              <li class="menu" style="width: 120px;"><a href="<c:url value='/student/toStudentPage'/>">欢迎:${student.studentName }</a></li>
              <li>|</li>
              <li class="li2"><a href="<c:url value='/teacher/quit'/>">退出</a></li>
              </c:if>
              <div class="spanLi2">
                      <ul>
                       	<li><a href="">我的作品</a></li>
                        <li><a href="">我的课程</a></li>
                        <li><a href="">我的班级</a></li>
                        <li><a href="">我的主页</a></li>
                      </ul>
                  </div>
              <!-- <li>|</li>
              <li class="li2"><a href="">我们</a></li> -->
             </span>
          <!--导航-->
          <nav style="width: 55%;">
              <ul>
                  <li class="li2"><a href="<c:url value='/main/toMain'/>" onclick="dianji(this)" >首页</a></li>
                <%--  <c:if test="${sessionScope.topFlag == '1' || sessionScope.topFlag == null}">
                   <li class="li3"><a href="<c:url value='/main/toMain'/>" onclick="dianji(this)" id="1">首页</a></li> 
                  </c:if> --%>
                  <li class="li2"><a href="<c:url value='/teacher/courseList'/>" onclick="dianji(this)">课程</a></li> 
                  <%--  <c:if test="${sessionScope.topFlag == '2' }">
                  <li class="li3"><a href="<c:url value='/teacher/courseList'/>" onclick="dianji(this)" id="2">课程</a></li> 
                  </c:if> --%>
                  
             <li class="li2"><a href="">互助</a></li> 
                  <!--  <li class="li3"><a href="">互助</a></li> -->
                  
                   <li class="li2"><a href="${pageContext.request.contextPath}/achievement/toAchievementMainPage">学生成果</a></li>
                  <%-- <li class="li3"><a href="${pageContext.request.contextPath}/achievement/toAchievementMainPage">学生成果</a></li> --%>
                  
                 <li class="li2"><a href="${pageContext.request.contextPath}/achievement/toAchievementMainPage">产学研项目</a></li>
                  <%-- <li class="li3"><a href="${pageContext.request.contextPath}/achievement/toAchievementMainPage">产学研项目</a></li> --%>
                  
              <li class="li2"><a href="${pageContext.request.contextPath}/turnClass/toTurnClassMainPage">课堂翻转</a></li> 
                  <%-- <li class="li3"><a href="${pageContext.request.contextPath}/turnClass/toTurnClassMainPage">课堂翻转</a></li> --%>
                  
                  <c:if test="${teacher != null }">
                <li class="li2"><a href="<c:url value='/teacher/toTeacherPage'/>" style="font-size: 15px;">个人中心</a></li> 
                  <%-- <li class="li3"><a href="<c:url value='/teacher/toTeacherPage'/>" style="font-size: 15px;">个人中心</a></li> --%>
	              </c:if>
	              <c:if test="${student != null }">
	              <li class="li2"><a href="<c:url value='/student/toStudentPage'/>" style="font-size: 15px;">个人中心</a></li>
	              <%-- <li class="li3"><a href="<c:url value='/student/toStudentPage'/>" style="font-size: 15px;">个人中心</a></li> --%>
	              </c:if>
	              <c:if test="${student == null && teacher == null }">
	              <li class="li2"><a href="<c:url value='/jsp/Teacher/index.jsp'/>" style="font-size: 15px;">个人中心</a></li>
	              <%-- <li class="li3"><a href="<c:url value='/jsp/Teacher/index.jsp'/>" style="font-size: 15px;">个人中心</a></li> --%>
	              </c:if>
              </ul>
          </nav>
      </header>
      </div>
</body>
</html>
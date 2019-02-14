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
    height: 120px;
    background: url("../img/head.png") no-repeat;
    background-size: cover;
    position: relative;
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
    width: 45px;
    float: left;
    color: white;
    margin-right: 1%;
    margin-left:1%;
    line-height: 30px;
}
header span li a{
    color: white;
    font-size: 14px;
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
header span li a:hover{
    text-decoration: underline;
}
header span li:nth-child(5){
    position: relative;
}
.h_span_li2 {
    width: 120px;
    position: absolute;
    padding: 1%;
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
    display: none;
}
.h_span_li2 li{
    width: 100%;
    height: 30px;
    font-size: 16px;
}
.li2:hover .h_span_li2{
    display: block;
}

/*--------------导航---------------*/
header nav {
    width: 40%;
    float: right;
    line-height: 30px;
    right: 3%;
    bottom: 6%;
    position: absolute;
   
}
header nav li{
    float: left;
    margin-left: 4%;
    margin-right: 4%;
}
header nav li a:hover{
    color: blue;
}
header nav li a{
    color: white;
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
</head>
<body>
      <header style="background: url('${pageContext.request.contextPath}/images/head.png') no-repeat;">
          <span>
              <li class="li1"><a href="">微信端</a>
                  <div class="erweima">
                      <img src="${pageContext.request.contextPath}/images/erweima.png" alt="">
                  </div>
              </li>
              <li>|</li>
              <c:if test="${teacher == null && student == null }">
              <li><a href="<c:url value='/jsp/Teacher/index.jsp'/>">登陆</a></li>
              </c:if>
              <c:if test="${teacher != null }">
              <a href="<c:url value='/teacher/toTeacherPage'/>"><li style="width: 120px;">欢迎:${teacher.teacherName }</li></a>
              <li>|</li>
              <li class="li2"><a href="<c:url value='/teacher/quit'/>">退出</a></li>
              </c:if>
              <c:if test="${student != null }">
              <a href="<c:url value='/student/toStudentPage'/>"><li style="width: 120px;">欢迎:${student.studentName }</li></a>
              <li>|</li>
              <li class="li2"><a href="<c:url value='/teacher/quit'/>">退出</a></li>
              </c:if>
              <li>|</li>
              <li class="li2"><a href="">我们</a></li>
              
                  <!--<div class="h_span_li2">-->
                      <!--<ul>-->
                        <!--<li><a href="">我的作品</a></li>-->
                        <!--<li><a href="">我的课程</a></li>-->
                        <!--<li><a href="">我的班级</a></li>-->
                        <!--<li><a href="">我的主页</a></li>-->
                      <!--</ul>-->
                  <!--</div>-->
              
             </span>
          <!--导航-->
          <nav>
              <ul>
                  <li><a href="<c:url value='/main/toMain'/>">首页</a></li>
                  <li><a href="<c:url value='/teacher/courseList'/>">课程</a></li>
                  <li><a href="">互助</a></li>
                  <li><a href="">学生成果</a></li>
                  <li><a href="">产学研项目</a></li>
              </ul>
          </nav>
      </header>
      
</body>
</html>
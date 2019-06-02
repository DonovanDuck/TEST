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
    	footer{
    width: 100%;
    background: #333333;
    float:left;
    height: 271.88px;
    margin-top: -12px;
}
footer .footer-img{
    width: 130px;
    height: 130px;
    padding-left: 9px;
    padding-top: 9px;
    background: white;
    margin-top: 2%;
    margin-bottom: 2%;
}
footer nav{
    width: 90%;
    height: 60px;
    margin-top: 2%;
    margin-left: 15%;
}
footer nav li{
    float: left;
    width: 11%;
    line-height: 30px;
}
footer nav li a{
    color: white;
}
footer nav li a:hover{
    color: blue;
}
*{
    margin: 0 auto;
    padding: 0;
}
ul li a{
    text-decoration: none;
    
}
li{
    list-style: none;
}
.clear{
    clear: both;
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

      <footer>
          <div class="footer-img"><img src="${pageContext.request.contextPath}/images/erweima.png" alt=""></div>
          <div>
              <hr>
              <nav>
                  <ul>
                      <li><a style="text-decoration: none;" href="<c:url value='/main/toMain'/>">首页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></li>
                      <li><a style="text-decoration: none;" href="<c:url value='/teacher/courseList'/>">课程&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></li>
                      <li><a style="text-decoration: none;" href="">讨论区&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></li>
                      <li><a  style="text-decoration: none;" href="">学生成果&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></li>
                      <li><a style="text-decoration: none;" href="">产学研项目&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></li>
                      <li><a style="text-decoration: none;" href="">微信端&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></li>
                      <li><a style="text-decoration: none;" href="">联系我们&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></li>
                  </ul>
              </nav>
          </div>
      </footer>
</body>
</html>
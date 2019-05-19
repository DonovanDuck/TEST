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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" type="text/css">
    <%-- <link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet" /> --%>
    <style>
    	.title p{
    		font-size: 10px;
    		opacity: 0.7;
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
      <jsp:include page="/jsp/top.jsp" flush="true" />
      <div class="banner">
          <div class="banner-img">
              <img src="${pageContext.request.contextPath}/images/banner_img01.jpg" alt="" style="width: 1400px;height:600px;overflow: hidden;"/>
              <img src="${pageContext.request.contextPath}/images/banner_img02.jpg" alt="" style="width: 1400px;height:600px;overflow: hidden;"/>
              <img src="${pageContext.request.contextPath}/images/banner_img03.jpg" alt="" style="width: 1400px;height:600px;overflow: hidden;"/>
              <img src="${pageContext.request.contextPath}/images/banner_img04.jpg" alt="" style="width: 1400px;height:600px;overflow: hidden;"/>
          </div>
          <div class="square">
              <div class="square1"></div>
              <div class="square1"></div>
              <div class="square1"></div>
              <div class="square1"></div>
          </div>
      </div>
      <main>
          <!--基地-->
          <!--课程-->
          <div class="course">
              课程
              <span><a href="<c:url value='/teacher/courseList' />">查看全部</a></span>
              <table>
                  <tr>
                  <c:forEach items="${courseList }" var="course" varStatus="status" begin="0" end="3">
                  <td>
                  	<a href="<c:url value='/teacher/toCourseDetail/${course.courseId }'/>">
                          <div  class="jidixiangmu-li">
                              <div class="rel-img"  style="width: 300px;height: 200px;"><img src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${course.faceImg }" alt="" style="width: 300px;height: 200px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p style="font-family: 微软雅黑; font-size: 20px; font-weight: 20px;opacity: 1;">${course.courseName }</p>
                                      <p>教师团队：
                                      	<c:forEach items="${course.teacherList }" var="teacher">
                							${teacher.teacherName }
                						</c:forEach>
                                      </p>
                                      <p>创建时间：${publishTime[status.index] }</p>
                                      <p>课程人数：${course.courseStudentNum }</p>
                                  </div>
                              </div>
                          </div>
                       </a>
                      </td>
                  </c:forEach>
                      
                      <!-- <td>
                          <div  class="jidixiangmu-li">
                              <div class="rel-img"><img src="../img/tu2.jpg" alt="" style="width: 300px;height: 200px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>课程名：机械原理</p>
                                      <p>创建教师：杨华</p>
                                      <p>创建时间：2006-12-22</p>
                                      <p>课程人数：1080</p>
                                  </div>
                              </div>
                          </div>
                      </td>
                      <td>
                          <div  class="jidixiangmu-li">
                              <div class="rel-img"><img src="../img/tu33.jpg" alt="" style="width: 300px;height: 200px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>课程名：数学竞赛选讲</p>
                                      <p>创建教师：赵小燕、李萍</p>
                                      <p>创建时间：2006-12-22</p>
                                      <p>课程人数：1730</p>
                                  </div>
                              </div>
                          </div>
                      </td>
                      <td>
                          <div  class="jidixiangmu-li">
                              <div class="rel-img"><img src="../img/tu44.jpg" alt="" style="width: 300px;height: 200px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>课程名：电磁学</p>
                                      <p>创建教师：张宇</p>
                                      <p>创建时间：2006-12-22</p>
                                      <p>课程人数：1991</p>
                                  </div>
                              </div>
                          </div>
                      </td> -->
                  </tr>
                  <tr>
                  <c:forEach items="${courseList }" var="course" varStatus="status" begin="4" end="7">
                  <td>
                  	<a href="<c:url value='/teacher/toCourseDetail/${course.courseId }'/>">
                          <div  class="jidixiangmu-li">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${course.faceImg }" alt="" style="width: 300px;height: 200px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p style="font-family: 微软雅黑; font-size: 20px; font-weight: 20px;opacity: 1;">课程名：${course.courseName }</p>
                                      <p>教师团队：
                                      	<c:forEach items="${course.teacherList }" var="teacher">
                							${teacher.teacherName }
                						</c:forEach>
                                      </p>
                                      <p>创建时间：${publishTime[status.index] }</p>
                                      <p>课程人数：${course.courseStudentNum }</p>
                                  </div>
                              </div>
                          </div>
                      </a>
                      </td>
                  </c:forEach>
                      <!-- <td>
                          <div  class="jidixiangmu-li">
                              <div class="rel-img"><img src="../img/tu4.png" alt="" style="width: 300px;height: 200px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>课程名：岩石学</p>
                                      <p>创建教师：邵龙义、鲁静</p>
                                      <p>创建时间：2006-12-22</p>
                                      <p>课程人数：1980</p>
                                  </div>
                              </div>
                          </div>
                      </td>
                      <td>
                          <div  class="jidixiangmu-li">
                              <div class="rel-img"><img src="../img/tu5.png" alt="" style="width: 300px;height: 200px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>课程名：传感技术与应用</p>
                                      <p>创建教师：张晓琳、唐文彦</p>
                                      <p>创建时间：2006-12-22</p>
                                      <p>课程人数：1800</p>
                                  </div>
                              </div>
                          </div>
                      </td>
                      <td>
                          <div  class="jidixiangmu-li">
                              <div class="rel-img"><img src="../img/tu6.jpg" alt="" style="width: 300px;height: 200px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>课程名：土木工程概论</p>
                                      <p>创建教师：熊峰</p>
                                      <p>创建时间：2006-12-22</p>
                                      <p>课程人数：2300</p>
                                  </div>
                              </div>
                          </div>
                      </td>
                      <td>
                          <div  class="jidixiangmu-li">
                              <div class="rel-img"><img src="../img/tu7.jpg" alt="" style="width: 300px;height: 200px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>课程名：模拟电子技术基础</p>
                                      <p>创建教师：许菲、吴友宇、华剑</p>
                                      <p>创建时间：2006-12-22</p>
                                      <p>课程人数：2170</p>
                                  </div>
                              </div>
                          </div>
                      </td> -->
                  </tr>
              </table>
          </div>

          <!--明星学生-->
          <div class="touxiang">
              明星学生
              <span><a href="">查看全部</a></span>
              <nav>
                  <ul>
                      <li><a href="">
                          <div class="touxiang-out">
                              <div class="touxiang-int">
                                  <img src="${pageContext.request.contextPath}/images/touxiang_09.png" alt="">
                              </div>
                              <div class="touxiang_name">
                                  <p>刘文静</p>
                                  <p>计算机工程系</p>
                              </div>
                          </div>
                      </a></li>
                      <li><a href="">
                          <div class="touxiang-out">
                              <div class="touxiang-int">
                                  <img src="${pageContext.request.contextPath}/images/touxiang_10.png" alt="">
                              </div>
                              <div class="touxiang_name">
                                  <p>蒋丽君</p>
                                  <p>机械工程系</p>
                              </div>
                          </div>
                      </a></li>
                      <li><a href="">
                          <div class="touxiang-out">
                              <div class="touxiang-int">
                                  <img src="${pageContext.request.contextPath}/images/touxiang_03.png" alt="">
                              </div>
                              <div class="touxiang_name">
                                  <p>侯品然</p>
                                  <p>电子工程系</p>
                              </div>
                          </div>
                      </a></li>
                      <li><a href="">
                          <div class="touxiang-out">
                              <div class="touxiang-int">
                                  <img src="${pageContext.request.contextPath}/images/touxiang_04.png" alt="">
                              </div>
                              <div class="touxiang_name">
                                  <p>肖福聚</p>
                                  <p>计算机工程系</p>
                              </div>
                          </div>
                      </a></li>
                      <li><a href="">
                          <div class="touxiang-out">
                              <div class="touxiang-int">
                                  <img src="${pageContext.request.contextPath}/images/touxiang_05.png" alt="">
                              </div>
                              <div class="touxiang_name">
                                  <p>吴正谢</p>
                                  <p>自动化系</p>
                              </div>
                          </div>
                      </a></li>
                      <li><a href="">
                          <div class="touxiang-out">
                              <div class="touxiang-int">
                                  <img src="${pageContext.request.contextPath}/images/touxiang_06.png" alt="">
                              </div>
                              <div class="touxiang_name">
                                  <p>陈宇</p>
                                  <p>理学系</p>
                              </div>
                          </div>
                      </a></li>
                      <li><a href="">
                          <div class="touxiang-out">
                              <div class="touxiang-int">
                                  <img src="${pageContext.request.contextPath}/images/touxiang_07.png" alt="">
                              </div>
                              <div class="touxiang_name">
                                  <p>唐德天</p>
                                  <p>体育系</p>
                              </div>
                          </div>
                      </a></li>
                      <li><a href="">
                          <div class="touxiang-out">
                              <div class="touxiang-int">
                                  <img src="${pageContext.request.contextPath}/images/touxiang_08.png" alt="">
                              </div>
                              <div class="touxiang_name">
                                  <p>张晓玉</p>
                                  <p>经济与管理系</p>
                              </div>
                          </div>
                      </a></li>
                  </ul>
              </nav>
          </div>

          <!--学生成果-->
          <div class="chengguo">
              学生成果
              <span><a href="">查看全部</a></span>
              <table>
                  <tr>
                      <td>
                          <div  class="chengguo-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/chengguo_01.jpg" alt="" style="width: 227px;height: 209px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>成果名称：细胞分析</p>
                                      <p>团队名称：生物学实验组</p>
                                      <p>指导教师：赵忠义</p>
                                      <p>完成时间：2006-12-22</p>
                                  </div>
                              </div>
                          </div>
                      </td>
                      <td>
                          <div  class="chengguo-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/chengguo_02.jpg" alt="" style="width: 227px;height: 209px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>成果名称：环境分析项目</p>
                                      <p>团队名称：环境与安全实验团队</p>
                                      <p>指导教师：周    昀</p>
                                      <p>完成时间：2006-12-22</p>
                                  </div>
                              </div>
                          </div>
                      </td>
                      <td>
                          <div  class="chengguo-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/chengguo_03.jpg" alt="" style="width: 227px;height: 209px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>成果名称：航天模型项目</p>
                                      <p>团队名称：雄鹰团队</p>
                                      <p>指导教师：陈    远</p>
                                      <p>完成时间：2006-12-22</p>
                                  </div>
                              </div>
                          </div>
                      </td>
                      <td>
                          <div  class="chengguo-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/chengguo_04.jpg" alt="" style="width: 227px;height: 209px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>成果名称：科学研究项目</p>
                                      <p>团队名称：科研团队</p>
                                      <p>指导教师：刘纪孔</p>
                                      <p>完成时间：2006-12-22</p>
                                  </div>
                              </div>
                          </div>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <div  class="chengguo-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/chengguo_05.jpg" alt="" style="width: 227px;height: 209px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>成果名称：创新设计项目</p>
                                      <p>团队名称：灵光一闪团队</p>
                                      <p>指导教师：崔常山</p>
                                      <p>完成时间：2006-12-22</p>
                                  </div>
                              </div>
                          </div>
                      </td>
                      <td>
                          <div  class="chengguo-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/chengguo_06.jpg" alt="" style="width: 227px;height: 209px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>成果名称：科技创新项目</p>
                                      <p>团队名称：飞扬团队</p>
                                      <p>指导教师：陈    睿</p>
                                      <p>完成时间：2006-12-22</p>
                                  </div>
                              </div>
                          </div>
                      </td>
                      <td>
                          <div  class="chengguo-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/chengguo_07.jpg" alt="" style="width: 227px;height: 209px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>成果名称：创意产品项目</p>
                                      <p>团队名称：DREAM团队</p>
                                      <p>指导教师：刘    瑜</p>
                                      <p>完成时间：2006-12-22</p>
                                  </div>
                              </div>
                          </div>
                      </td>
                      <td>
                          <div  class="chengguo-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/chengguo_08.jpg" alt="" style="width: 227px;height: 209px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>成果名称：创意小设计项目</p>
                                      <p>团队名称：IDEA团队</p>
                                      <p>指导教师：舢    板</p>
                                      <p>完成时间：2006-12-22</p>
                                  </div>
                              </div>
                          </div>
                      </td>
                  </tr>
              </table>
          </div>

          <!--产学研项目-->
          <div class="xiangmu">
              产学研项目
              <span><a href="">查看全部</a></span>
              <table>
                  <tr>
                      <td>
                          <div  class="xiangmu-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/chanxueyan_01.jpg" alt="" style="width: 257px;height: 209px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>成果名称：协同创新项目</p>
                                      <p>团队名称：科研团队</p>
                                      <p>获奖情况：国家一等奖</p>
                                      <p>完成时间：2006-12-22</p>
                                  </div>
                              </div>
                          </div>
                      </td>
                      <td>
                          <div  class="xiangmu-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/chanxueyan_02.jpg" alt="" style="width: 257px;height: 209px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>成果名称：WISDOM项目</p>
                                      <p>团队名称：科研团队</p>
                                      <p>获奖情况：国家二等奖</p>
                                      <p>完成时间：2006-12-22</p>
                                  </div>
                              </div>
                          </div>
                      </td>
                      <td>
                          <div  class="xiangmu-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/chanxueyan_03.jpg" alt="" style="width: 257px;height: 209px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>成果名称：技术转化项目</p>
                                      <p>团队名称：科研团队</p>
                                      <p>获奖情况：国家一等奖</p>
                                      <p>完成时间：2006-12-22</p>
                                  </div>
                              </div>
                          </div>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <div  class="xiangmu-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/chanxueyan_04.jpg" alt="" style="width: 257px;height: 209px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>成果名称：管理创新项目</p>
                                      <p>团队名称：科研团队</p>
                                      <p>获奖情况：国家二等奖</p>
                                      <p>完成时间：2006-12-22</p>
                                  </div>
                              </div>
                          </div>
                      </td>
                      <td>
                          <div  class="xiangmu-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/chanxueyan_05.jpg" alt="" style="width: 257px;height: 209px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>成果名称：国家火炬项目</p>
                                      <p>团队名称：科研团队</p>
                                      <p>获奖情况：国家三等奖</p>
                                      <p>完成时间：2006-12-22</p>
                                  </div>
                              </div>
                          </div>
                      </td>
                      <td>
                          <div  class="xiangmu-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/chanxueyan_06.jpg" alt="" style="width: 257px;height: 209px;"></div>
                              <div class="info">
                                  <div class="title">
                                      <p>成果名称：科技创新项目</p>
                                      <p>团队名称：科研团队</p>
                                      <p>获奖情况：国家二等奖</p>
                                      <p>完成时间：2006-12-22</p>
                                  </div>
                              </div>
                          </div>
                      </td>
                  </tr>
              </table>
          </div>

          <!--老师排行榜-->
          <div class="teacher">
              教师排行榜
              <span><a href="">查看全部</a></span>
              <nav>
                  <ul>
                      <li>
                          <div class="teacher-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/touxiang_01.png" alt="" style="width: 73px;height: 73px;"></div>
                              <div class="infor">
                                  <div class="title">
                                      <p>赵忠文</p>
                                      <p>&nbsp;&nbsp;教授</p>
                                  </div>
                              </div>
                          </div>
                      </li>
                      <li>
                          <div class="teacher-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/touxiang_02.png" alt="" style="width: 73px;height: 73px;"></div>
                              <div class="infor">
                                  <div class="title">
                                      <p>陈&nbsp;&nbsp;&nbsp;&nbsp;远</p>
                                      <p>&nbsp;&nbsp;教授</p>
                                  </div>
                              </div>
                          </div>
                      </li>
                      <li>
                          <div class="teacher-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/touxian_11.png" alt="" style="width: 73px;height: 73px;"></div>
                              <div class="infor">
                                  <div class="title">
                                      <p>周&nbsp;&nbsp;&nbsp;&nbsp;昀</p>
                                      <p>副教授</p>
                                  </div>
                              </div>
                          </div>
                      </li>
                      <li>
                          <div class="teacher-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/touxiang_12.png" alt="" style="width: 73px;height: 73px;"></div>
                              <div class="infor">
                                  <div class="title">
                                      <p>崔常山</p>
                                      <p>副教授</p>
                                  </div>
                              </div>
                          </div>
                      </li>
                      <li>
                          <div class="teacher-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/touxiang_13.png" alt="" style="width: 73px;height: 73px;"></div>
                              <div class="infor">
                                  <div class="title">
                                      <p>刘纪孔</p>
                                      <p>&nbsp;&nbsp;教授</p>
                                  </div>
                              </div>
                          </div>
                      </li>
                      <li>
                          <div class="teacher-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/touxiang_14.png" alt="" style="width: 73px;height: 73px;"></div>
                              <div class="infor">
                                  <div class="title">
                                      <p>陈&nbsp;&nbsp;&nbsp;&nbsp;睿</p>
                                      <p>&nbsp;&nbsp;教授</p>
                                  </div>
                              </div>
                          </div>
                      </li>
                      <li>
                          <div class="teacher-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/touxiang_15.png" alt="" style="width: 73px;height: 73px;"></div>
                              <div class="infor">
                                  <div class="title">
                                      <p>刘&nbsp;&nbsp;&nbsp;&nbsp;瑜</p>
                                      <p>&nbsp;&nbsp;教授</p>
                                  </div>
                              </div>
                          </div>
                      </li>
                      <li>
                          <div class="teacher-out">
                              <div class="rel-img"><img src="${pageContext.request.contextPath}/images/touxiang_16.png" alt="" style="width: 73px;height: 73px;"></div>
                              <div class="infor">
                                  <div class="title">
                                      <p>舢&nbsp;&nbsp;&nbsp;&nbsp;板</p>
                                      <p>副教授</p>
                                  </div>
                              </div>
                          </div>
                      </li>

                  </ul>
              </nav>
          </div>

          <!--论坛热帖-->
          <div class="post">
              热帖
              <span><a href="">查看全部</a></span>
              <nav>
                  <ul>
                      <li>
                          <div class="post-out"><img src="${pageContext.request.contextPath}/images/tu77.jpg" alt=""><a href="">小梦梦</a> <span>发表于2018年12月11日</span></div>
                          <div class="post-inner">
                              <a href="">面CPP开发内核需要掌握到什么程度？</a> <span>C++课程</span>
                          </div><hr>
                      </li>
                      <li>
                          <div class="post-out"><img src="${pageContext.request.contextPath}/images/tu77.jpg" alt=""><a href="">点点鬼</a> <span>发表于2018年12月13日</span></div>
                          <div class="post-inner">
                              <a href="">请教去重方法 输入是字符串 输出是字符串 谢谢各位大神！</a> <span>C++课程</span>
                          </div><hr>
                      </li>
                      <li>
                          <div class="post-out"><img src="${pageContext.request.contextPath}/images/tu77.jpg" alt=""><a href="">郝海今天发糖了吗？</a> <span>发表于2018年12月15日</span></div>
                          <div class="post-inner">
                              <a href="">求问，视觉算法工程师 需要看什么书？</a> <span>C++课程</span>
                          </div><hr>
                      </li>
                      <li>
                          <div class="post-out"><img src="${pageContext.request.contextPath}/images/tu77.jpg" alt=""><a href="">红酥手</a> <span>发表于2018年12月16日</span></div>
                          <div class="post-inner">
                              <a href="">这句话啥意思，可以举个例子吗？</a> <span>C/C++课程</span>
                          </div><hr>
                      </li>
                      <li>
                          <div class="post-out"><img src="${pageContext.request.contextPath}/images/tu77.jpg" alt=""><a href="">Believer123</a> <span>发表于2018年12月17日</span></div>
                          <div class="post-inner">
                              <a href="">有二维数组A[10][20]，每个元素占4个存储单元。。。</a> <span>C/C++课程</span>
                          </div><hr>
                      </li>
                      <li>
                          <div class="post-out"><img src="${pageContext.request.contextPath}/images/tu77.jpg" alt=""><a href="">yzpseu</a> <span>发表于2018年12月17日</span></div>
                          <div class="post-inner">
                              <a href="">Java并发编程的艺术思维导图</a> <span>JAVA课程</span>
                          </div><hr>
                      </li>
                      <li>
                          <div class="post-out"><img src="${pageContext.request.contextPath}/images/tu77.jpg" alt=""><a href="">董成荣</a> <span>发表于2018年12月20日</span></div>
                          <div class="post-inner">
                              <a href="">python中那个API可以让x轴自动伸缩？</a> <span>Python课程</span>
                          </div><hr>
                      </li>
                      <li>
                          <div class="post-out"><img src="${pageContext.request.contextPath}/images/tu77.jpg" alt=""><a href="">燕舞s</a> <span>发表于2018年12月21日</span></div>
                          <div class="post-inner">
                              <a href="">公司的统计的数据库里字段全是数字怎么办？</a> <span>数据库课程</span>
                          </div><hr>
                      </li>
                  </ul>
              </nav>
          </div>
      </main>
       <jsp:include page="/jsp/footer.jsp" flush="true"/>
</body>
</html>
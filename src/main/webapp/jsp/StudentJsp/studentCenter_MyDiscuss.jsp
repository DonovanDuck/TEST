<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title></title>
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/student/s-own.css" />
    <script>
        function f(){
            var w1=document.getElementById("w1");
            var w2=document.getElementById("w2");
            var p1=document.getElementById("p1");
            var p2=document.getElementById("p2");
            var k1=document.getElementById("k1");
            var k2=document.getElementById("k2");
            w1.style.background="#00bc9b";
            w2.style.background="white";
            p1.style.color="white";
            p2.style.color="black";
            k1.style.display="block";
            k2.style.display="none";
        }
        function g(){
            var w1=document.getElementById("w1");
            var w2=document.getElementById("w2");
            var p1=document.getElementById("p1");
            var p2=document.getElementById("p2");
            var k1=document.getElementById("k1");
            var k2=document.getElementById("k2");
            w2.style.background="#00bc9b";
            w1.style.background="white";
            p2.style.color="white";
            p1.style.color="black";
            k2.style.display="block";
            k1.style.display="none";
        }
        function w3(){
            var w3=document.getElementById('w3');
            var w4=document.getElementById('w4');
            var w5=document.getElementById('w5');
            var w6=document.getElementById('w6');
            var p3=document.getElementById('p3');
            var p4=document.getElementById('p4');
            var p5=document.getElementById('p5');
            var p6=document.getElementById('p6');
            var t1=document.getElementById('t1');
            var t2=document.getElementById('t2');
            var t3=document.getElementById('t3');
            var t4=document.getElementById('t4');
            w3.style.background="#00bc9b";
            w4.style.background="white";
            w5.style.background="white";
            w6.style.background="white";
            p3.style.color="white";
            p4.style.color="black";
            p5.style.color="black";
            p6.style.color="black";
            t1.style.display="block";
            t2.style.display="none";
            t3.style.display="none";
            t4.style.display="none";
        }
        function w4(){
            var w3=document.getElementById('w3');
            var w4=document.getElementById('w4');
            var w5=document.getElementById('w5');
            var w6=document.getElementById('w6');
            var p3=document.getElementById('p3');
            var p4=document.getElementById('p4');
            var p5=document.getElementById('p5');
            var p6=document.getElementById('p6');
            var t1=document.getElementById('t1');
            var t2=document.getElementById('t2');
            var t3=document.getElementById('t3');
            var t4=document.getElementById('t4');
            w4.style.background="#00bc9b";
            w3.style.background="white";
            w5.style.background="white";
            w6.style.background="white";
            p4.style.color="white";
            p3.style.color="black";
            p5.style.color="black";
            p6.style.color="black";
            t2.style.display="block";
            t1.style.display="none";
            t3.style.display="none";
            t4.style.display="none";
        }
        function w5(){
            var w3=document.getElementById('w3');
            var w4=document.getElementById('w4');
            var w5=document.getElementById('w5');
            var w6=document.getElementById('w6');
            var p3=document.getElementById('p3');
            var p4=document.getElementById('p4');
            var p5=document.getElementById('p5');
            var p6=document.getElementById('p6');
            var t1=document.getElementById('t1');
            var t2=document.getElementById('t2');
            var t3=document.getElementById('t3');
            var t4=document.getElementById('t4');
            w5.style.background="#00bc9b";
            w4.style.background="white";
            w3.style.background="white";
            w6.style.background="white";
            p5.style.color="white";
            p4.style.color="black";
            p3.style.color="black";
            p6.style.color="black";
            t3.style.display="block";
            t2.style.display="none";
            t1.style.display="none";
            t4.style.display="none";
        }
        function w6(){
            var w3=document.getElementById('w3');
            var w4=document.getElementById('w4');
            var w5=document.getElementById('w5');
            var w6=document.getElementById('w6');
            var p3=document.getElementById('p3');
            var p4=document.getElementById('p4');
            var p5=document.getElementById('p5');
            var p6=document.getElementById('p6');
            var t1=document.getElementById('t1');
            var t2=document.getElementById('t2');
            var t3=document.getElementById('t3');
            var t4=document.getElementById('t4');
            w6.style.background="#00bc9b";
            w4.style.background="white";
            w5.style.background="white";
            w3.style.background="white";
            p6.style.color="white";
            p4.style.color="black";
            p5.style.color="black";
            p3.style.color="black";
            t4.style.display="block";
            t2.style.display="none";
            t3.style.display="none";
            t1.style.display="none";
        }
    </script>
</head>
<body>
	<jsp:include page="/jsp/top.jsp" flush="true"/>
<main>
    <div class="main_t">
        <div class="images">
            <img src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${student.faceImg }"style="width: 100%; height: 100%;"  alt="" />
        </div>
          <div class="message">
            &nbsp;&nbsp;<h2>&nbsp;&nbsp;&nbsp;${student.studentNickName }</h2>
            <p> &nbsp;&nbsp;&nbsp;&nbsp;${student.studentId }</p>
        </div>
    </div>
    <div class="main_b">
        <div class="main_b_l">
            <a
                    href="${pageContext.request.contextPath}/student/toStudentCenter_MyCourse">
                <div class="nav1">
                    <p>
                        <img
                                src="${pageContext.request.contextPath}/images/studentCenterImg/k1.png"
                                alt="" />我的课程
                    </p>
                </div>
            </a> <a
                href="${pageContext.request.contextPath}/student/toStudentCenter_MyClass">
            <div class="nav1">
                <p>
                    <img
                            src="${pageContext.request.contextPath}/images/studentCenterImg/b1.png"
                            alt="" />我的班级
                </p>
            </div>
        </a> <a
				href="${pageContext.request.contextPath}/student/toStudentCenter_MyAchievement">
				<div class="nav1">
					<p>
						<img
							src="${pageContext.request.contextPath}/images/studentCenterImg/t1.png"
							alt="" />我的成果
					</p>
				</div>
			</a> <a
                href="${pageContext.request.contextPath}/student/toStudentCenter_MyDiscuss">
            <div class="nav1">
                <p>
                    <img
                            src="${pageContext.request.contextPath}/images/studentCenterImg/t1.png"
                            alt="" />我的讨论
                </p>
            </div>
        </a> <a
                href="${pageContext.request.contextPath}/student/toStudentCenter_MyInfo">
            <div class="nav1">
                <p>
                    <img
                            src="${pageContext.request.contextPath}/images/studentCenterImg/g1.png"
                            alt="" />个人信息
                </p>
            </div>
        </a>
        </div>
        <div class="main_b_r" id="r3">
            <div class="main_b_r_t">
                <div class="word1" id="w3" onclick="w3()">
                    <p><a href="#" id="p3">我发的帖子</a></p>
                </div>
                <div class="word2" id="w4" onclick="w4()">
                    <p><a href="#" id="p4">我回复的帖子</a></p>
                </div>
                <div class="word3" id="w5" onclick="w5()">
                    <p><a href="#" id="p5">我设置最优答案贴子</a></p>
                </div>
                <div class="word4" id="w6" onclick="w6()">
                    <p><a href="#" id="p6">我要发帖</a></p>
                </div>
            </div>
            <div class="hr"></div>
            <div class="main_b_r_b" id="t1">
                <a href="#" target="_blank">
                    <div class="note">
                        <div class="note_l">
                            <img src="../images/tou1.png" alt=""/>
                        </div>
                        <div class="note_r">
                            <h3>求助轮播图问题</h3>
                            <p>最佳答案：利用js进行书写代码，完成自动轮播。。</p>
                            <p>发布时间：2019年1月25日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回复：20&nbsp;&nbsp;赞：20&nbsp;浏览量：30</p>
                        </div>
                    </div>
                </a>
                <a href="#" target="_blank">
                    <div class="note">
                        <div class="note_l">
                            <img src="../images/tou2.png" alt=""/>
                        </div>
                        <div class="note_r">
                            <h3>求助轮播图问题</h3>
                            <p>最佳答案：利用js进行书写代码，完成自动轮播。。</p>
                            <p>发布时间：2019年1月25日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回复：20&nbsp;&nbsp;赞：20&nbsp;浏览量：30</p>
                        </div>
                    </div>
                </a>
                <a href="#" target="_blank">
                    <div class="note">
                        <div class="note_l">
                            <img src="../images/tou3.png" alt=""/>
                        </div>
                        <div class="note_r">
                            <h3>求助轮播图问题</h3>
                            <p>最佳答案：利用js进行书写代码，完成自动轮播。。</p>
                            <p>发布时间：2019年1月25日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回复：20&nbsp;&nbsp;赞：20&nbsp;浏览量：30</p>
                        </div>
                    </div>
                </a>
            </div>
            <div class="main_b_r_b" id="t2">
                <a href="#" target="_blank">
                    <div class="note">
                        <div class="note_l">
                            <img src="../images/tou2.png" alt=""/>
                        </div>
                        <div class="note_r">
                            <h3>求助轮播图问题</h3>
                            <p>最佳答案：利用js进行书写代码，完成自动轮播。。</p>
                            <p>发布时间：2019年1月25日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回复：20&nbsp;&nbsp;赞：20&nbsp;浏览量：30</p>
                        </div>
                    </div>
                </a>
                <a href="#" target="_blank">
                    <div class="note">
                        <div class="note_l">
                            <img src="../images/tou3.png" alt=""/>
                        </div>
                        <div class="note_r">
                            <h3>求助轮播图问题</h3>
                            <p>最佳答案：利用js进行书写代码，完成自动轮播。。</p>
                            <p>发布时间：2019年1月25日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回复：20&nbsp;&nbsp;赞：20&nbsp;浏览量：30</p>
                        </div>
                    </div>
                </a>
                <a href="#" target="_blank">
                    <div class="note">
                        <div class="note_l">
                            <img src="../images/tou1.png" alt=""/>
                        </div>
                        <div class="note_r">
                            <h3>求助轮播图问题</h3>
                            <p>最佳答案：利用js进行书写代码，完成自动轮播。。</p>
                            <p>发布时间：2019年1月25日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回复：20&nbsp;&nbsp;赞：20&nbsp;浏览量：30</p>
                        </div>
                    </div>
                </a>
            </div>
            <div class="main_b_r_b" id="t3">
                <a href="#" target="_blank">
                    <div class="note">
                        <div class="note_l">
                            <img src="../images/tou2.png" alt=""/>
                        </div>
                        <div class="note_r">
                            <h3>求助轮播图问题</h3>
                            <p>最佳答案：利用js进行书写代码，完成自动轮播。。</p>
                            <p>发布时间：2019年1月25日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回复：20&nbsp;&nbsp;赞：20&nbsp;浏览量：30</p>
                        </div>
                    </div>
                </a>
                <a href="#" target="_blank">
                    <div class="note">
                        <div class="note_l">
                            <img src="../images/tou1.png" alt=""/>
                        </div>
                        <div class="note_r">
                            <h3>求助轮播图问题</h3>
                            <p>最佳答案：利用js进行书写代码，完成自动轮播。。</p>
                            <p>发布时间：2019年1月25日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回复：20&nbsp;&nbsp;赞：20&nbsp;浏览量：30</p>
                        </div>
                    </div>
                </a>
                <a href="#" target="_blank">
                    <div class="note">
                        <div class="note_l">
                            <img src="../images/tou3.png" alt=""/>
                        </div>
                        <div class="note_r">
                            <h3>求助轮播图问题</h3>
                            <p>最佳答案：利用js进行书写代码，完成自动轮播。。</p>
                            <p>发布时间：2019年1月25日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回复：20&nbsp;&nbsp;赞：20&nbsp;浏览量：30</p>
                        </div>
                    </div>
                </a>
            </div>
            <div id="t4"></div>
        </div>
    </div>
</main>
<jsp:include page="/jsp/footer.jsp" flush="true" />
</body>
</html>
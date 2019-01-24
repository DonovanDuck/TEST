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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/student/s-own.css"/>
    <script>
        function a(){
            var r1=document.getElementById("r1");
            var r2=document.getElementById("r2");
            var r3=document.getElementById("r3");
            var r5=document.getElementById("r5");
            r1.style.display="block";
            r2.style.display="none";
            r3.style.display="none";
            r5.style.display="none";
        }
        function b(){
            var r1=document.getElementById("r1");
            var r2=document.getElementById("r2");
            var r3=document.getElementById("r3");
            var r5=document.getElementById("r5");
            r1.style.display="none";
            r2.style.display="block";
            r3.style.display="none";
            r5.style.display="none";
        }
        function c(){
            var r1=document.getElementById("r1");
            var r2=document.getElementById("r2");
            var r3=document.getElementById("r3");
            var r5=document.getElementById("r5");
            r1.style.display="none";
            r2.style.display="none";
            r3.style.display="block";
            r5.style.display="none";
        }
        function e(){
            var r1=document.getElementById("r1");
            var r2=document.getElementById("r2");
            var r3=document.getElementById("r3");
            var r5=document.getElementById("r5");
            r1.style.display="none";
            r2.style.display="none";
            r3.style.display="none";
            r5.style.display="block";
        }
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
        function bj(){
            var top=document.getElementById('top');
            var g1=document.getElementById('g1');
            var g2=document.getElementById('g2');
            top.style.display="none";
            g1.style.display="none";
            g2.style.display="block";
        }
        function xx(){
            var top=document.getElementById('top');
            var g1=document.getElementById('g1');
            var g2=document.getElementById('g2');
            top.style.display="block";
            g1.style.display="block";
            g2.style.display="none";
        }
    </script>
</head>
<body>
<header>

</header>
<main>
    <div class="main_t">
        <div class="images">
            <img src="../images/s-tou.png" alt=""/>
        </div>
        <div class="message">
            &nbsp;&nbsp;<h2>&nbsp;&nbsp;&nbsp;star</h2>
            <p> &nbsp;&nbsp;&nbsp;&nbsp;172056218</p>
        </div>
    </div>
    <div class="main_b">
        <div class="main_b_l">
            <div class="nav1" onclick="a()"><p><img src="${pageContext.request.contextPath}/images/studentCenterImg/k1.png" alt=""/>我的课程</p></div>
            <div class="nav1" onclick="b()"><p><img src="${pageContext.request.contextPath}/images/studentCenterImg/b1.png" alt=""/>我的班级</p></div>
            <div class="nav1" onclick="c()"><p><img src="${pageContext.request.contextPath}/images/studentCenterImg/t1.png" alt=""/>我的讨论</p></div>
            <div class="nav1" onclick="e()"><p><img src="${pageContext.request.contextPath}/images/studentCenterImg/g1.png" alt=""/>个人信息</p></div>
        </div>
        <div class="main_b_r" id="r1">
            <div class="main_b_r_t">
                <div class="word1" id="w1" onclick="f()">
                    <p><a href="#" id="p1">我学习的课程</a></p>
                </div>
                <div class="word2" id="w2" onclick="g()">
                    <p><a href="#" id="p2">我关注的课程</a></p>
                </div>
            </div>
            <div class="hr"></div>
            <div class="main_b_r_b" id="k1">
                    <div class="lesson">
                        <div class="lesson_l">
                            <img src="../images/tu6.jpg" alt=""/>
                        </div>
                        <div class="lesson_r">
                            <h3>数据结构</h3>
                            <p>创课老师：张三</p>
                            <p>开课老师：王五</p>
                            <p>开课时间：2018-2019年 第二学期</p>
                        </div>
                    </div>
                    <div class="lesson">
                        <div class="lesson_l">
                            <img src="../images/tu2.png" alt=""/>
                        </div>
                        <div class="lesson_r">
                            <h3>数字图像处理</h3>
                            <p>创课老师：李莉莉</p>
                            <p>开课老师：孟璇朗</p>
                            <p>开课时间：2018-2019年 第一学期</p>
                        </div>
                    </div>
                    <div class="lesson">
                        <div class="lesson_l">
                            <img src="../images/tu1.jpg" alt=""/>
                        </div>
                        <div class="lesson_r">
                            <h3>概率论与数理统计</h3>
                            <p>创课老师：赵江波</p>
                            <p>开课老师：赵江波</p>
                            <p>开课时间：2017-2018年 第一学期</p>
                        </div>
                    </div>
                    <div class="lesson">
                        <div class="lesson_l">
                            <img src="../images/tu10.jpg" alt=""/>
                        </div>
                        <div class="lesson_r">
                            <h3>WEB编程技术</h3>
                            <p>创课老师：张虎</p>
                            <p>开课老师：张军</p>
                            <p>开课时间：2018-2019年 第二学期</p>
                        </div>
                    </div>
            </div>
            <div class="main_b_r_b" id="k2">
                <div class="lesson">
                    <div class="lesson_l">
                        <img src="../images/tu2.png" alt=""/>
                    </div>
                    <div class="lesson_r">
                        <h3>数字图像处理</h3>
                        <p>创课老师：李莉莉</p>
                        <p>开课老师：孟璇朗</p>
                        <p>开课时间：2018-2019年 第一学期</p>
                    </div>
                </div>
                <div class="lesson">
                    <div class="lesson_l">
                        <img src="../images/tu1.jpg" alt=""/>
                    </div>
                    <div class="lesson_r">
                        <h3>概率论与数理统计</h3>
                        <p>创课老师：赵江波</p>
                        <p>开课老师：赵江波</p>
                        <p>开课时间：2017-2018年 第一学期</p>
                    </div>
                </div>
                <div class="lesson">
                    <div class="lesson_l">
                        <img src="../images/tu10.jpg" alt=""/>
                    </div>
                    <div class="lesson_r">
                        <h3>WEB编程技术</h3>
                        <p>创课老师：张虎</p>
                        <p>开课老师：张军</p>
                        <p>开课时间：2018-2019年 第二学期</p>
                    </div>
                </div>
                <div class="lesson">
                    <div class="lesson_l">
                        <img src="../images/tu6.jpg" alt=""/>
                    </div>
                    <div class="lesson_r">
                        <h3>数据结构</h3>
                        <p>创课老师：张三</p>
                        <p>开课老师：王五</p>
                        <p>开课时间：2018-2019年 第二学期</p>
                    </div>
                </div>
            </div>
        </div>
        <div id="r2"></div>
        <div id="r3">
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
        <div id="r5">
            <div class="r5_t" id="top">
                <div class="h3">
                    <p>我的信息</p>
                </div>
                <div class="bj" onclick="bj()">
                    <p>编辑个人信息</p>
                </div>
            </div>
            <div class="r5_b" id="g1">
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号：172056218</p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;昵称：star</p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：郭晓玲</p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别：女</p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;出生年月：1999年10月28日</p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;政治面貌：团员</p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系别：计算机工程系</p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专业：软件工程</p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;学习成果：</p>
                <p>产学研项目：</p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;获奖情况：</p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其它：</p>
            </div>
            <div id="g2">
                <form action="">
                    昵称：<br/><input type="text" placeholder="请输入昵称："/><br/>
                    密码：<br/><input type="text" placeholder="请输入密码："/><br/>
                    出生年月日：<br/><input type="text" placeholder="请输入年月日："/><br/>
                    政治面貌：<br/><input type="text" placeholder="请输入政治面貌："/><br/>
                    系别：<br/><input type="text" placeholder="请输入系别："/><br/>
                    专业：<br/><input type="text" placeholder="请输入专业："/><br/>
                    学习成果：<br/><textarea name="" id="1" cols="30" rows="4" placeholder=""></textarea><br/>
                    产学研项目：<br/><textarea name="" id="2" cols="30" rows="4" placeholder=""></textarea><br/>
                    获奖情况：<br/><textarea name="" id="3" cols="30" rows="4" placeholder=""></textarea><br/>
                    其它：<br/><textarea name="" id="4" cols="30" rows="4" placeholder=""></textarea><br/>
                    <div class="outer">
                        <div class="qr" onclick="xx()">确认</div>
                        <div class="qx" onclick="xx()">取消</div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>
<footer></footer>
</body>
</html>
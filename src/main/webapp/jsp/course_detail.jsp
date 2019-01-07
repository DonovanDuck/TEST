<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--slider-->
<link href="css/flexslider.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="js/jquery.flexslider.js" type="text/javascript"></script>
 <script type="text/javascript">
    $(function(){
      SyntaxHighlighter.all();
    });
    $(window).load(function(){
      $('.flexslider').flexslider({
        animation: "slide",
        animationLoop: false,
        itemWidth: 210,
        itemMargin: 5,
        minItems: 2,
        maxItems: 4,
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
  </script>
</head>
<body>


<div class="cont_bg">
<div class="wrap">
<div class="content">
 <div class="main">
 	<h2>c++</h2>
 	<div class="text">
 		<div class="txt_img">
 			<a href="details.html"><img src="images/pic1.jpg"  alt="" /></a> 
 		</div>
		<div class="txt_para">
			<ul>
				<li>所属系部：计算机工程系</li>
				<li>开课教师：Donovan</li>
				<li>对应年级：大一</li>
				<li>大纲：c++</li>
			</ul>
		</div>
	</div>
	<div class="txt_para1">
		<h2>课程简介</h2>
		<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give and expound the actual teachings the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? </p>
	</div>
	<div class="btn">
		<a href="details.html">Read More <span>>></span></a>
	</div>
	<div class="clear"></div>
	
 </div>
 <div class="sidebar">
  <div class="side_bar">
 	<h2>我的班级</h2>
 	<p class="top"><a href=""><img src="images/art-pic1.jpg" alt="">
 		<ul>
 			<li>班级名称 ：c++</li>
 			<li>包含班级：1520561,1520562</li>
 			<li>创建时间：2010.2.1</li>
 		</ul>
 	</a></p>
	<p class="top"><a href=""><img src="images/art-pic2.jpg" alt="">
		<ul>
 			<li>班级名称 ：c++</li>
 			<li>包含班级：1520561,1520562</li>
 			<li>创建时间：2010.2.1</li>
 		</ul>
	</a></p>
 	<p class="top"><a href=""><img src="images/art-pic3.jpg" alt="">
 		<ul>
 			<li>班级名称 ：c++</li>
 			<li>包含班级：1520561,1520562</li>
 			<li>创建时间：2010.2.1</li>
 		</ul>
 	</a></p>
 	<p class="top"><a href=""><img src="images/art-pic4.jpg" alt="">
 		<ul>
 			<li>班级名称 ：c++</li>
 			<li>包含班级：1520561,1520562</li>
 			<li>创建时间：2010.2.1</li>
 		</ul>
 	</a></p>
 </div>
  
 </div>
  </div>
 <div class="clear"></div>
 <div class="resource">
 	<h2>资源库</h2>
 	<div class="menu1">
		<ul class="list">
            <li><img src="images/icon_2.png" alt="">
            	<p><strong>文件资源</strong>
            </li>
            <li>
            	<div class="word">
            <div class="images">
                <img src="c/images/word1.png" alt="" style="width:80px;height:80px;"/>
            </div>
            <div class="word_r">
                <p>&nbsp;&nbsp;&nbsp;发布人：张XX</p>
                <p>&nbsp;&nbsp;&nbsp;大致内容：指针的使用</p>
                <p>&nbsp;&nbsp;&nbsp;发布时间：2018年12月27日</p>
                <p>&nbsp;&nbsp;&nbsp;被下载：XX</p>
                <hr/>
            </div>
        </div>
            </li>
        </ul>
	</div>
	<div class="menu1">
		<ul class="list">
            <li><img src="images/icon_2.png" alt="">
            	<p><strong>视频资源</strong>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi aliquip consequat Lorem ipsum dolor sitamet conset etuer amet adipinget praesent ....</p>
            </li>
         </ul>
	</div>
	<div class="menu1">
		<ul class="list">
            <li><img src="images/icon_2.png" alt="">
            	<p><strong>图片资源</strong>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi aliquip consequat Lorem ipsum dolor sitamet conset etuer amet adipinget praesent ....</p>
            </li>
         </ul>
	</div>
	<div class="menu1">
		<ul class="list">
            <li><img src="images/icon_2.png" alt="">
            	<p><strong>其他资源</strong>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi aliquip consequat Lorem ipsum dolor sitamet conset etuer amet adipinget praesent ....</p>
            </li>
         </ul>
	</div>
 </div>
 </div>
</div>

<
</body>
</html>
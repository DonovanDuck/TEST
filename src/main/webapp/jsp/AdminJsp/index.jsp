<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>管理员界面</title>
<link rel="stylesheet" href="css/manager.css" />
<script src="js/manager.js"></script>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
</head>
<body>
	<header>
		<h1>头部</h1>
	</header>
	<div class="main">
		<div class="menu">
			<ul>
				<li id="import" onclick="importInformation()">导入信息</li>
				<li id="changeDepart" onclick="departInformation()">修改系部信息</li>
				<li id="setClass" onclick="setClass()">设置课程分类</li>
				<li id="addManager" onclick="add()">添加管理员</li>
				<li id="changeScore" onclick="score()">修改评分</li>
			</ul>
		</div>
		<div class="content">
			<div class="importInformation">
				<button>导入信息</button>
				<div class="teacher">
					<table>
						<span>请按照如下格式书写需要导入的教师表</span>
						<tr>
							<td>工号</td>
							<td>教师名</td>
							<td>教师密码</td>
							<td>教师性别</td>
							<td>教育背景</td>
							<td>教师职称</td>
							<td>教师电话</td>
							<td>电子邮箱</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
				<div class="student">
					<table>
						<span>请按照如下格式书写需要导入的学生表</span>
						<tr>
							<td>学号</td>
							<td>姓名</td>
							<td>班级</td>
							<td>性别</td>
							<td>密码</td>
							<td>邮箱</td>
							<td>专业</td>
							<td>电话</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="departInformation">
				<button>添加系部</button>
				<table>
					<tr>
						<td>id</td>
						<td>系名</td>
						<td>系部简介</td>
						<td>编辑栏</td>
					</tr>
					<tr>
						<td>001</td>
						<td>计算机工程系</td>
						<td>计算机</td>
						<td><button id="departInformationEdit"
								onclick="departInformationEdit()">编辑</button></td>
					</tr>
				</table>
			</div>
			<div class="setClass">
				<button>添加课程</button>
				<table>
					<tr>
						<td>课程id</td>
						<td>课程名</td>
						<td>课程描述</td>
						<td>课程分类</td>
						<td>发布者id</td>
						<td>课程图标</td>
						<td>编辑栏</td>
					</tr>
					<tr>
						<td>0001</td>
						<td>数据结构</td>
						<td>计算机课程</td>
						<td>计算机</td>
						<td>001</td>
						<td>图标</td>
						<td><button id="setClass" onclick="setClassEdit()">编辑</button></td>
					</tr>
				</table>
			</div>
			<div class="add">
				<button>添加管理员</button>
				<table>
					<tr>
						<td>账户</td>
						<td>密码</td>
						<td>编辑栏</td>
					</tr>
					<tr>
						<td>00001</td>
						<td>123456</td>
						<td><button id="add" onclick="addEdit()">编辑</button></td>
					</tr>
				</table>
			</div>
			<div class="score"></div>
		</div>
	</div>
	<footer>
		<h1>底部</h1>
	</footer>
</body>
</html>

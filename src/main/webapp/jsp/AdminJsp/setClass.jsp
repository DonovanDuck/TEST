<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title></title>
<style>
table {
	border: 1px solid black;
	border-collapse: collapse;
	margin-left: 15%;
	margin-top: 20%;
}

table td {
	border: 1px solid black;
	text-align: center;
}

button {
	margin-left: 50%;
}
</style>
</head>

<body>
	<form>
		<table>
			<tr>
				<td>课程id</td>
				<td>课程名</td>
				<td>课程描述</td>
				<td>课程分类</td>
				<td>发布者id</td>
				<td>课程图标</td>
			</tr>
			<tr>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
			</tr>
		</table>
		<button>ç¡®è®¤</button>
	</form>
</body>

</html>
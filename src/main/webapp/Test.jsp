<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>测试页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>
	<!-- 测试EXCEL 部分代码 -->
	<!-- <div id="hidden_file_div">
		<form id="form_excel" name="form_excel" 
		action="${pageContext.request.contextPath}/admin/DoExcel" method="post" enctype="multipart/form-data">
			<input type="file" id="file_excel" name="file_excel" />
		    <input type="submit" />
		</form>
		<input type="text" name="filename" id="filename" />
	</div> -->
	<div>
		<form id="form_excel" name="form_excel"
			action="${pageContext.request.contextPath}/admin/AddTeacher"
			method="post" enctype="multipart/form-data">
			<input type="file" id="file_excel" name="file_excel" /> <input
				type="submit" />
		</form>

		<form id="form_excel" name="form_excel"
			action="${pageContext.request.contextPath}/admin/AddStudent"
			method="post" enctype="multipart/form-data">
			<input type="file" id="file_excel" name="file_excel" /> <input
				type="submit" />
		</form>
	</div>

</body>
</html>
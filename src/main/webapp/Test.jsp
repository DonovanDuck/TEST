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
	<!--测试excel 文件上传问题-->
	<!--  -->
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
			 
	<!--测试头像上传上传问题
	<form action="${pageContext.request.contextPath}/admin/AddStudent" method="post" enctype="multipart/form-data">
		<label>用户名：</label>
			<input type="text" name="name"><br>
		 <label>密码：</label>
		 	<input type="password" name="pwd"><br> 
		 <label>上传头像：</label>
		 	<input type="file" name="file"><br> 
		 <input type="submit">-->		
	</form>
</body>
</html>
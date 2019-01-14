<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/updateResource.css"
	type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</head>
<body>
<div class="course ">
				<div class="imgContent col-md-3">
					<img src="${pageContext.request.contextPath}/images/tu11.jpg"
						alt="">
				</div>
				<div class="col-md-8" style="height: 100%">
					<div class="resource_name col-md-12" style="height: 20%">
						<label class="col-md-3 text-center">资源名:</label> <label
							class="col-md-9 text-left"> 这是一个资源</label>
					</div>
					<div class="resourse_Info" style="height: 80%">
						<div class="col-md-3 text-right">
							<label class="col-md-12 text-center">资源介绍:</label>
						</div>
						<div class="col-md-9 text-left">
							<textarea readonly
								style="width: 100%; height: 100px; border: 0px; outline: none;">虽然可以直接使用 Bootstrap 提供的 CSS 样式表，不要忘记 Bootstrap 的源码是基于最流行的 CSS 预处理脚本 - Less 和 Sass 开发的。你可以采用预编译的 CSS 文件快速开发，也可以从源码定制自己需要的样式。</textarea>
						</div>
					</div>
				</div>
				<div class="col-md-1">
					<input class="btn btn-default" style="margin-top: 30%"
						type="button" value="删除"> <input class="btn btn-default"
						style="margin-top: 46%" type="submit" value="修改">
				</div>
			</div>
</body>
</html>
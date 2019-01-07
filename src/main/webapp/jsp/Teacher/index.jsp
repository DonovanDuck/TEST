<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Title</title>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script>
        $(document).ready(function () {

            var entrance=document.getElementById('entrance');
            var entrance_content=document.getElementById('entrance_content');
            entrance.onclick=function(){
                entrance_content.style.display='inline';
                entrance.style.display='none';
            }
        });
        function gradeChange(){
            if($('#select option:selected').val()=='teacher'){
                var newUrl = '${pageContext.request.contextPath}/teacher/teacherLogin';    //设置新提交地址
                $("#myform").attr('action',newUrl);    //通过jquery为action属性赋值
                alert(newUrl);
            }
            if($('#select option:selected').val()=='student'){
                var newUrl = '${pageContext.request.contextPath}/teacher/studentLogin';    //设置新提交地址
                $("#myform").attr('action',newUrl);    //通过jquery为action属性赋值
                alert(newUrl);
            }
            if($('#select option:selected').val()=='manager'){
                var newUrl = '${pageContext.request.contextPath}/admin/LoginAdmin';    //设置新提交地址
                $("#myform").attr('action',newUrl);    //通过jquery为action属性赋值
                alert(newUrl);
            }
        }
         function CheckPost (){
      		if (addForm.employeeNum.value == "")
      		{
          		alert("请填写用户名！");
          		addForm.username.focus();
          		return false;
      		}
      		if (addForm.password.value == "")
      		{
          		alert("请填写密码！");
          		addForm.username.focus();
          		return false;
      		}
     		return true;
   		}

    </script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css" type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css"
	type="text/css">

</head>
<body id="body">

	<div class="Card">
		<div class="card_top">
			<div class="icon_logo">
				<img src="${pageContext.request.contextPath}/img/b1190.jpg" alt=""
					style="height: 70px;">
			</div>
			<div class="icon_banner">登录&nbsp;&nbsp;&nbsp;发现新的课堂</div>
		</div>
		<div class="card_bottom">
			<div class="login_content">
				<div class="login_form_area">
					<form id="myform"
						action="${pageContext.request.contextPath}/teacher/teacherLogin"
						name="addForm" class="login_form" onsubmit="return CheckPost();">
						<div class="login-account">
							<div class="id_select">
								<select id="select" onchange="gradeChange()">
									<option value="teacher">教师</option>
									<option value="student">学生</option>
									<option value="manager">管理员</option>
								</select> <span class="select_icon"
									style="display: inline-flex; align-items: center;">&#8203;
									<svg class="Zi Zi--Select Select-arrow" fill="currentColor"
										viewBox="0 0 24 24" width="24" height="24">
                                        <path
											d="M12 16.183l2.716-2.966a.757.757 0 0 1 1.064.001.738.738 0 0 1 0 1.052l-3.247 3.512a.758.758 0 0 1-1.064 0L8.22 14.27a.738.738 0 0 1 0-1.052.758.758 0 0 1 1.063 0L12 16.183zm0-9.365L9.284 9.782a.758.758 0 0 1-1.064 0 .738.738 0 0 1 0-1.052l3.248-3.512a.758.758 0 0 1 1.065 0L15.78 8.73a.738.738 0 0 1 0 1.052.757.757 0 0 1-1.063.001L12 6.818z"
											fill-rule="evenodd">
                                        </path>
                                    </svg>
								</span>
							</div>
							<span class="login-accountSeperator"></span>
							<div class="account_input">
								<input name="employeeNum" id="employeeNum"
									placeholder="使用工号、手机号或邮箱登录" />
							</div>
						</div>
						<div class="password_content">
							<div class="password_input">
								<div class="password_content_input">
									<input name="password" placeholder="输入密码" type="password"
										id="password">
								</div>
							</div>
							<div class="otherMethorToLogin">
								<a href="">忘记密码</a>
							</div>
						</div>
						<button type="submit" class="submit">登录</button>
						<div class="Login-footer">
							<span class="Login-qrcode">
								<button type="button" class="Button Button--plain">二维码登录</button>
							</span> <span class="Login-footerSeparate Login-qrcodeSeparate">
								· </span> <span class="Login-aboardPhone">
								<button type="button" class="Button Button--plain">校外人员登录
								</button>
							</span> <span class="Login-footerSeparate"> · </span> <span
								class="Login-socialLogin">
								<button id="entrance" type="button"
									class="Button Login-socialButtonEntrance Button--plain">社交帐号登录
								</button>
								<div id="entrance_content" style="display: none;">
									<span
										class="Login-socialButtonGroup Login-socialButtonGroup--hidden">
										<button disabled="" type="button"
											class="Button Login-socialButton Button--plain">
											<svg viewBox="0 0 20 19"
												class="Icon Login-socialIcon Icon--wechat"
												style="height: 17px; width: 18px;" width="18" height="17"
												aria-hidden="true">
                                                <title></title>
                                                <g>
                                                    <path
													fill-rule="evenodd"
													d="M.224 18.667s4.24-1.825 4.788-2.056C13.03 20.14 20 14.715 20 8.9 20 3.984 15.523 0 10 0S0 3.984 0 8.898c0 1.86.64 3.585 1.737 5.013-.274.834-1.513 4.757-1.513 4.757zM6.167 8.96c.69 0 1.25-.57 1.25-1.27 0-.703-.56-1.272-1.25-1.272s-1.25.57-1.25 1.27c0 .703.56 1.272 1.25 1.272zm7.583 0c.69 0 1.25-.57 1.25-1.27 0-.703-.56-1.272-1.25-1.272s-1.25.57-1.25 1.27c0 .703.56 1.272 1.25 1.272z"></path>
                                                </g>
                                            </svg>
										</button>
										<button disabled="" type="button"
											class="Button Login-socialButton Button--plain">
											<svg viewBox="0 0 22 18"
												class="Icon Login-socialIcon Icon--weibo"
												style="height: 16px; width: 20px;" width="20" height="16"
												aria-hidden="true">
                                                <title></title>
                                                <g>
                                                    <g
													fill-rule="evenodd">
                                                        <path
													d="M14.518.06s-.87.644.03 1.71c0 0 6.287-1.19 5.69 6.33 0 0 1.05 1.13 1.674-.31 0 .002 1.44-8.584-7.394-7.73zM4.883 13.17s.038 2.584 3.326 2.584c3.657 0 3.683-2.98 3.683-2.98S12.1 9.67 8.687 9.61c-3.863-.07-3.804 3.56-3.804 3.56zM7.41 14.21c-.668 0-1.214-.447-1.214-.998 0-.55.543-.998 1.215-.998.67 0 1.213.447 1.213.998 0 .55-.54.998-1.212.998z">

                                                        </path>
                                                        <path
													d="M4.317 4.52C-2.603 10.353.873 14.85.873 14.85c.57 1.01 3.382 3.1 8.596 3.1 5.21 0 9.314-3.628 9.314-6.44 0-2.813-2.918-2.714-2.918-2.714 1.04-1.554.19-2.65.19-2.65-1.684-2.118-5.404-.16-5.407-.158.772-1.717.11-2.797.11-2.797C8.932.66 4.317 4.52 4.317 4.52zm10.448 7.79s-.467 4.16-6.447 4.16c-5.745 0-5.82-3.322-5.842-3.712 0 0-.073-4.423 6.58-4.654 5.94-.204 5.71 4.207 5.71 4.207zM18.65 7.045s1.018-4.37-3.864-3.818c0 0-.628.58.09 1.346 0 0 2.602-.58 2.397 2.598 0 0 .715.885 1.376-.125z">

                                                        </path>
                                                    </g>
                                                </g>
                                            </svg>
										</button>
										<button disabled="" type="button"
											class="Button Login-socialButton Button--plain">
											<svg width="17" height="19" viewBox="0 0 18 20"
												xmlns="http://www.w3.org/2000/svg"
												class="Icon Login-socialIcon Icon--qq"
												style="height: 19px; width: 17px;" aria-hidden="true">
                                                <title></title>
                                                <g>
                                                    <title>QQ</title>
                                                    <path
													d="M9.003 0c-2.265 0-6.29 1.364-6.29 7.325V8.52S.55 12.96.55 15.474c0 .665.17 1.025.28 1.025.115 0 .903-.485 1.75-2.073 0 0-.18 2.197 1.903 3.967 0 0-1.77.495-1.77 1.182 0 .686 4.078.43 6.29 0 2.24.425 6.287.687 6.287 0 0-.688-1.768-1.182-1.768-1.182 2.085-1.77 1.905-3.967 1.905-3.967.845 1.588 1.634 2.072 1.746 2.072.11 0 .283-.36.283-1.026 0-2.514-2.166-6.954-2.166-6.954V7.325C15.29 1.365 11.268 0 9.003 0z"
													fill-rule="evenodd">

                                                    </path>
                                                </g>
                                            </svg>
										</button>
									</span>
								</div>
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/publish_jobs.css">
</head>
<body>
<div class="all">
<jsp:include page="/jsp/top.jsp" flush="true"/>
<main>
    <form action="${pageContext.request.contextPath}/teacher/publishTask" id="publish" enctype="multipart/form-data" method="post">
        <!--<input type="text" placeholder="请在此输入任务标题" style="width:846px;height:40px; border-width:0;margin-left:2px;">-->
        <p>标题：</p>
        <input type="text" name="taskTitle"  placeholder="请在此输入任务标题" style="width:1000px;height:25px; margin-left:25px;margin-top:10px;outline:none;">
        <br/>
        <p>任务类型：</p>
        <select   style="width:1002px;height:30px; margin-left:25px;margin-top:10px;outline:none;" id ="taskCategory" name="taskCategory"  >
                 <c:forEach items="${taskCategoryList }" var="taskCategory">
								<option <c:if test="${taskCategory=='work'}"> selected="selected" </c:if>  value="${taskCategory }">${taskCategory }</option>
				</c:forEach>
        </select>
        <p>任务描述：</p>
        <textarea  id="taskDetail"  name="taskDetail"   rows="10" cols="154" style=" margin-left:25px;margin-top:10px;overflow:scroll;overflow-x:hidden;outline:none;"></textarea>
     <input name="file" type="file"  multiple="multiple"  />
                上传附件
        <p>任务内容：</p>
        <select name="content"  style="width:1002px;height:30px; margin-left:25px;margin-top:10px;outline:none;" >
            <option value="work_library">作业库</option>
            <option value="test_library">实验库</option>
            <option value="multimedia_library">多媒体库</option>
        </select>
        <!--<textarea  rows="10" cols="124" style=" margin-left:25px;margin-top:10px;overflow:scroll;overflow-x:hidden;outline:none;">-->
            <!--<input type="checkbox">-->
        <!--</textarea>-->
        <div class="content">
            <input type="checkbox" style="width:15px; height:15px;"><span>1、指针的使用&nbsp;&nbsp;张三&nbsp;&nbsp;2019/01/05&nbsp;&nbsp;</span><br/>
            <input type="checkbox" style="width:15px; height:15px;"><span>2、值传递与址传递&nbsp;&nbsp;李四&nbsp;&nbsp;2019/02/01&nbsp;&nbsp;</span><br/>
            <input type="checkbox" style="width:15px; height:15px;"><span>3、申请空间与释放&nbsp;&nbsp;王五&nbsp;&nbsp;2019/01/15&nbsp;&nbsp;</span><br/>
            <input type="checkbox" style="width:15px; height:15px;"><span>4、算法的时间复杂度&nbsp;&nbsp;赵六&nbsp;&nbsp;2019/03/08&nbsp;&nbsp;</span><br/>
            <input type="checkbox" style="width:15px; height:15px;"><span>5、结构体的使用&nbsp;&nbsp;张三&nbsp;&nbsp;2019/01/05&nbsp;&nbsp;</span><br/>
            <input type="checkbox" style="width:15px; height:15px;"><span>6、jdk的安装以及环境变量的配置&nbsp;&nbsp;李四&nbsp;&nbsp;2019/02/01&nbsp;&nbsp;</span><br/>
            <input type="checkbox" style="width:15px; height:15px;"><span>7、循环语句的使用&nbsp;&nbsp;王五&nbsp;&nbsp;2019/01/15&nbsp;&nbsp;</span><br/>
            <input type="checkbox" style="width:15px; height:15px;"><span>8、用Eclipse完成Java项目&nbsp;&nbsp;赵六&nbsp;&nbsp;2019/03/08&nbsp;&nbsp;</span><br/>
        </div>
        <p>开始时间：</p>
        <input type="text" style="width:1000px;height:25px; margin-left:25px;margin-top:10px;outline:none;">
        <p>截止时间：</p>
        <input name="taskEndTime" type="text" style="width:1000px;height:25px; margin-left:25px;margin-top:10px;outline:none;">
        <div class="main_b">
        <button  class="cancel">取消</button>
        <button class="release" type="submit">发布</button>
    </div>
    </form>
    
</main>
<footer></footer>
</div>

</body>
</html>
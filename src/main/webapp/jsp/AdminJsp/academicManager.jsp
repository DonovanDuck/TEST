<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>学术委员会管理</title>
    <jsp:include page="Common.jsp"></jsp:include>
</head>
<body>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header col-md-3" style="padding: 0%">
            <a class="navbar-brand waves-effect waves-dark" href="teacherManager.html"><strong>后台管理</strong></a>
            <div id="sideNav" href=""><i class="material-icons dp48"></i></div>
        </div>
        <div class="col-md-6 text-center">
            <h2 style="padding-left: 40%;padding-top: 2%;">学术委员会信息页</h2>
        </div>
        <div class="col-md-3">
            <ul class="nav navbar-top-links navbar-right">
                <li style="float: right;margin-right: 9%">
                    <a class="dropdown-button waves-effect waves-dark" href="#!"data-activates="dropdown1">
                        <b>姓名</b>
                        <i class="material-icons right">arrow_drop_down</i>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- Dropdown Structure -->
    <ul id="dropdown1" class="dropdown-content">
        <li><a href="#">个人信息</a>
        </li>
        <li><a href="#"> 设置 </a>
        </li>
        <li><a href="#">登出 </a>
        </li>
    </ul>
    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li class="text-left">
                    <a href="teacherManager.html" class="waves-effect waves-dark" style="font-size:20px">教师信息管理</a>
                </li>
                <li class="text-left">
                    <a href="studentManager.html" class="waves-effect waves-dark" style="font-size:20px">学生信息管理</a>
                </li>
                <li class="text-left">
                    <a href="categoryManager.html" class="waves-effect waves-dark" style="font-size:20px">分类信息管理</a>
                </li>
                <li class="text-left">
                    <a href="academicManager.html" class="waves-effect waves-dark" style="font-size:20px">学术委员会管理</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="card">
                    <div class="card-content " style="padding-top: 3%">
                        <div class="table-responsive" style="overflow-x: hidden;">
                            <hr>
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th class="text-center">序号</th>
                                    <th class="text-center">类型</th>
                                    <th class="text-center">姓名</th>
                                    <th class="text-center">职称</th>
                                    <th class="text-center">认定时间</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="odd gradeX">
                                    <td class="text-center">1</td>
                                    <td style="text-align: center">计算机工程系</td>
                                    <td class="text-center">***</td>
                                    <td class="text-center">教授</td>
                                    <td class="text-center">2019-01-01</td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-default btn-lg" data-toggle="modal"
                                                data-target="#Edit" style="padding-top: 2%;">
                                            <small>编辑</small>
                                        </button>
                                        <button type="button" class="btn btn-default btn-lg" data-toggle="modal"
                                                data-target="#" style="padding-top: 2%;">
                                            <small>详情</small>
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!--End Advanced Tables -->
            </div>

        </div>
        <!-- /. PAGE INNER  -->
    </div>
</div>

<div class="modal" id="Edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    编辑学术委员会信息
                </h4>
            </div>
            <div class="modal-body">
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="teacherId" class="control-label">姓名</label>
                            <input type="text" class="form-control" id="teacherId">
                        </div>
                        <div class="form-group">
                            <label for="teacherName" class="control-label">职称</label>
                            <textarea class="form-control" id="teacherName"></textarea>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class='col-sm-6'>
                                    <div class="form-group">
                                        <label>认定时间：</label>
                                        <div class='input-group date' id='datetimepicker1'>
                                            <input type='text' class="form-control"/>
                                            <span class="input-group-addon">
                                                 <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-left: 2%">
                                关闭
                            </button>
                            <button type="submit" class="btn btn-primary">提交</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div><!-- /.modal-content -->
</div><!-- /.modal -->

</body>
</html>

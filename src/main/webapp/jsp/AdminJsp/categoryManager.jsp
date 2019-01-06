<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>分类信息管理</title>
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
            <h2 style="padding-left: 40%;padding-top: 2%;">分类信息页</h2>
        </div>
        <div class="col-md-3">
            <ul class="nav navbar-top-links navbar-right">
                <li style="float: right;margin-right: 9%">
                    <a class="dropdown-button waves-effect waves-dark" href="#!"data-activates="dropdown1">
                        <i class="fa fa-user fa-fw"></i>
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
        <li><a href="#">设置</a>
        </li>
        <li><a href="#">登出</a>
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
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#Edit" style="margin-top: 2%;margin-bottom: -3%;margin-left: 2%;padding-bottom: 3%;">
                        添加分类
                    </button>
                    <div class="card-content " style="padding-top: 3%">
                        <div class="table-responsive" style="overflow-x: hidden;">
                            <hr>
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th class="text-center">类型编号</th>
                                    <th class="text-center">类型名称</th>
                                    <th class="text-center">类型详情</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="odd gradeX">
                                    <td class="text-center">5</td>
                                    <td class="text-center">计算机工程系</td>
                                    <td class="text-center">计算机工程系现有“计算机科学与技术”、“网络工程”和“软件工程”三个专业</td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#Edit" style="padding-top: 5%;">
                                           <small> 编辑</small>
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

<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    添加分类信息
                </h4>
            </div>
            <div class="modal-body">
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="categoryId" class="control-label">分类编号</label>
                            <input type="text" class="form-control" id="categoryId">
                        </div>
                        <div class="form-group">
                            <label for="categoryName" class="control-label">分类名称</label>
                            <textarea class="form-control" id="categoryName"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="categoryDetali" class="control-label">分类详情</label>
                            <textarea class="form-control" id="categoryDetali"></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal"style="margin-left: 2%">关闭</button>
                            <button type="submit" class="btn btn-primary">提交</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div><!-- /.modal-content -->
</div><!-- /.modal -->

<div class="modal" id="Edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="EditTitle">
                    编辑分类
                </h4>
            </div>
            <div class="modal-body">
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="editCategoryId" class="control-label">分类编号</label>
                            <input type="text" class="form-control" id="editCategoryId">
                        </div>
                        <div class="form-group">
                            <label for="editCategoryName" class="control-label">分类名称</label>
                            <textarea class="form-control" id="editCategoryName"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="editCategorDetail" class="control-label">分类详情</label>
                            <textarea class="form-control" id="editCategorDetail"></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal"style="margin-left: 2%">关闭</button>
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

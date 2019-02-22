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
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/teacher/own.css"/>
</head>
<body>
<div id="t7">
                <div class="xiangmu">
                    <span class="xiangmu_1">获奖情况</span>  <div class="add">添加</div>
                    <div class="xiangmu_2">
                        <hr/>
                        <div class="chengguo"><img src="../images/pic_2.jpg" style="width: 100px;height: 100px;margin-left: 1%;float: left;" alt=""/>
                            <div class="name">以能力为导向的计算机人才培养模式的探索</div>
                            <div class="time">
                                <ul>
                                    <li>类型：教学改革项目</li>
                                    <li>级别：省级特等奖</li>
                                    <li>认定单位：山西省教育厅</li>
                                    <li>开始时间：2018年5月1日</li>
                                    <li>项目负责人</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="xiangmu_2">
                        <hr/>
                        <div class="chengguo"><img src="../images/pic.jpg" style="width: 100px;height: 100px;margin-left: 1%;float: left;" alt=""/>
                            <div class="name">VB制作的植物大战僵尸</div>
                            <div class="time">
                                <ul>
                                    <li>类型：科学研究项目</li>
                                    <li>级别：校级</li>
                                    <li>认定单位：山西省科教厅</li>
                                    <li>获奖时间：2019年10月1日</li>
                                    <li>项目参与人</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="xiangmu">
                    <span class="xiangmu_1">项目情况</span>  <div class="add">添加</div>
                    <div class="xiangmu_2">
                        <hr/>
                        <div class="chengguo"><img src="../images/SIFI.jpg" style="width: 100px;height: 100px;margin-left: 1%;float: left;" alt=""/>
                            <div class="name">基于SIFT图像处理技术的研究</div>
                            <div class="time">
                                <ul>
                                    <li>类型：教学改革项目</li>
                                    <li>级别：省级</li>
                                    <li>认定单位：山西省教育厅</li>
                                    <li>申报时间：2018年5月1日</li>
                                    <li>完成时间：2019年10月1日</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="xiangmu_2">
                        <hr/>
                        <div class="chengguo"><img src="../images/data.jpg" style="width: 100px;height: 100px;margin-left: 1%;float: left;" alt=""/>
                            <div class="name">基于大数据分析图像处理技术的研究</div>
                            <div class="time">
                                <ul>
                                    <li>类型：教学改革项目</li>
                                    <li>级别：省级</li>
                                    <li>认定单位：山西省教育厅</li>
                                    <li>申报时间：2018年5月1日</li>
                                    <li>完成时间：2019年10月12日</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="xiangmu">
                    <span class="xiangmu_1">产学研项目</span>  <div class="add">添加</div>
                    <div class="xiangmu_2">
                        <hr/>
                        <div class="chengguo"><img src="../images/yanye.jpg" style="width: 100px;height: 100px;margin-left: 1%;float: left;" alt=""/>
                            <div class="name">山西盐业公司商品统计系统</div>
                            <div class="time">
                                <ul>
                                    <li>合作单位：山西省盐业公司</li>
                                    <li>类型：独立开发</li>
                                    <li>合同金额：5000元</li>
                                    <li>开始时间：2018年5月1日</li>
                                    <li>完成时间：2019年10月1日</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="xiangmu_2">
                        <hr/>
                        <div class="chengguo"><img src="../images/fenjiu.jpg" style="width: 100px;height: 100px;margin-left: 1%;float: left;" alt=""/>
                            <div class="name">汾酒公司计量管理系统</div>
                            <div class="time">
                                <ul>
                                    <li>合作单位：山西省汾酒有限公司</li>
                                    <li>类型：合作开发</li>
                                    <li>资助金额：5000元</li>
                                    <li>开始时间：2018年3月14日</li>
                                    <li>完成时间：2019年10月1日</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="xiangmu">
                    <span class="xiangmu_1">论文发表情况</span>  <div class="add">添加</div>
                    <div class="xiangmu_2">
                        <hr/>
                        <div class="chengguo"><img src="../images/SIFI.jpg" style="width: 100px;height: 100px;margin-left: 1%;float: left;" alt=""/>
                            <div class="name">基于SIFI图像处理技术的研究</div>
                            <div class="time">
                                <ul>
                                    <li class="li_1">出版社：计算机学报</li>
                                    <li class="li_1">发表时间：2018年5月1日</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="xiangmu_2">
                        <hr/>
                        <div class="chengguo"><img src="../images/data.jpg" style="width: 100px;height: 100px;margin-left: 1%;float: left;" alt=""/>
                            <div class="name">基于大数据分析图像处理技术的研究</div>
                            <div class="time">
                                <ul>
                                    <li class="li_1">出版社：计算机学报</li>
                                    <li class="li_1">发表时间：2018年5月1日</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
</body>
</html>
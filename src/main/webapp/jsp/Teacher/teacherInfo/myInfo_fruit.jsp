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
<body style="margin-left:-21%">
 <div id="t7">
                <div class="xiangmu">
                    <span class="xiangmu_1">获奖情况</span>  <div class="add">添加</div>
                    <c:forEach items="${prizeList }" var="prize">
                    <div class="xiangmu_2">
                        <hr/>
                        <div class="chengguo"><img src="" style="width: 100px;height: 100px;margin-left: 1%;float: left;" alt=""/>
                            <div class="name">${prize.prizeProjectName }</div>
                            <div class="time">
                                <ul>
                                    <li>类型：</li>
                                    <li>级别：${prize.prizeLevel  }</li>
                                    <li>认定单位：${prize.thatOrganization }</li>
                                    <li>获奖时间：${prize.prizeTime }</li>
                                    <li>项目负责人：${prize.compere }</li>
                                </ul>
                            </div>
                        </div>
                         
                    </div>
                     </c:forEach>
                  
                </div>
                <div class="xiangmu">
                    <span class="xiangmu_1">项目情况</span>  <div class="add">添加</div>
                     <c:forEach items="${teacherProjectList }" var="teacherProject">
                    <div class="xiangmu_2">
                        <hr/>
                       
                        <div class="chengguo"><img src="" style="width: 100px;height: 100px;margin-left: 1%;float: left;" alt=""/>
                            <div class="name">${teacherProject.teacherProjectName }</div>
                            <div class="time">
                                <ul>
                                    <li>类型：${teacherProject.teacherProjectCategory }</li>
                                    <li>级别：${teacherProject.level }</li>
                                    <li>认定单位：${teacherProject.approvalOrganization }</li>
                                    <li>申报时间：${teacherProject.approvalTime }</li>
                                    <li>完成时间：${teacherProject.finishTime }</li>
                                </ul>
                            </div>
                        </div>
                        
                    </div>
                    </c:forEach>
                </div>
                <div class="xiangmu">
                    <span class="xiangmu_1">产学研项目</span>  <div class="add">添加</div>
                         <c:forEach items="${industryUniversityResearchProjectList }" var="industryUniversityResearchProject">
                    <div class="xiangmu_2">
                        <hr/>
                        <div class="chengguo"><img src="" style="width: 100px;height: 100px;margin-left: 1%;float: left;" alt=""/>
                            <div class="name">${industryUniversityResearchProject.projectName }</div>
                            <div class="time">
                                <ul>
                                    <li>合作单位：${industryUniversityResearchProject.cooperator }</li>
                                    <li>类型：${industryUniversityResearchProject.projectCategory }</li>
                                    <li>合同金额：${industryUniversityResearchProject.collectTheAmoount }</li>
                                    <li>开始时间：${industryUniversityResearchProject.startTime }</li>
                                    <li>完成时间：${industryUniversityResearchProject.endTime }</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
                <div class="xiangmu">
                    <span class="xiangmu_1">论文发表情况</span>  <div class="add">添加</div>
                      <c:forEach items="${paperList }" var="paper">
                    <div class="xiangmu_2">
                        <hr/>
                        <div class="chengguo"><img src="" style="width: 100px;height: 100px;margin-left: 1%;float: left;" alt=""/>
                            <div class="name">${paper.paperTitle }</div>
                            <div class="time">
                                <ul>
                                    <li class="li_1">出版社：${paper.publishingHouse }</li>
                                    <li class="li_1">发表时间：${paper.publishTime }</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
</body>
</html>
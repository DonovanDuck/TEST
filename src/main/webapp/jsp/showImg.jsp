<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>

<%--
  Created by IntelliJ IDEA.
  User: wkk
  Date: 2017/5/31/031
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String path = request.getParameter("path");
    if (path == null || path.isEmpty()) {
        return;
    }
    File file = new File(path);
    if (!file.exists() || file.isDirectory()) {
        return;
    }
    FileInputStream fileInputStream = new FileInputStream(file);
    ServletOutputStream outputStream = response.getOutputStream();
    byte bs[] = new byte[1024];
    int l;
    while ((l = fileInputStream.read(bs)) != -1) {
        outputStream.write(bs, 0, l);
    }
    outputStream.flush();
    outputStream.close();
    fileInputStream.close();
    
%>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>线上会议管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />
    <style type="text/css">
        html{
            height: 100%;
        }
        body{
            background-image: url("${pageContext.request.contextPath}/images/true.jpg");
            background-size: 100% 100%;
            padding: 0;
            margin: 0;
        }
    </style>
</head>
<body>
<div style="text-align: center; margin-top: 50px;">
    <div style="text-align: center; color: #A0A0A0; font-family: 微软雅黑; font-size: 36px;">
        <h1>欢迎来到线上会议管理系统！</h1>
    </div>
    <div style="text-align: center; font-family: 微软雅黑; margin-top: 200px;">
        <input type="button" class="btn btn-primary" value="点击这里登录" onclick="window.location.replace('${pageContext.request.contextPath}/user/login')">
    </div>
</div>
</body>
</html>

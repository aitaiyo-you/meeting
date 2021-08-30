<%--
  Created by IntelliJ IDEA.
  User: aitaiyo
  Date: 2021/6/25
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
    <style type="text/css">
        html{
            height: 100%;
        }
        body{
            height: 100%;
        }
    </style>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1>线上会议管理系统</h1>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><input id="user-id" type="hidden" value="${user.uid}">你好，${user.uname}</li>
                <li><a href="${pageContext.request.contextPath}/user/information?id=${user.uid}" id="user-inform">个人信息</a></li>
                <li><a href="${pageContext.request.contextPath}/user/exitLogin" id="exit-user">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <ul class="sub-menu">
                    <li style="background-color: #d0d0d0"><a href="${pageContext.request.contextPath}/meeting/selectAllNo?id=${user.uid}"><i class="icon-font">&#xe008;</i>未报名会议</a></li>
                    <li style="background-color: #d0d0d0"><a href="${pageContext.request.contextPath}/meeting/selectAllJoin?id=${user.uid}"><i class="icon-font">&#xe005;</i>已报名会议</a></li>
                </ul>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="#">首页</a></div>
        </div>
        <div class="background-wrap">
        </div>
    </div>
    <!--/main-->
</div>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
</body>
</html>

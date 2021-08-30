<%--
  Created by IntelliJ IDEA.
  User: aitaiyo
  Date: 2021/7/2
  Time: 19:44
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
    <title>个人信息管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
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
                    <li style="background-color: #d0d0d0"><a href="${pageContext.request.contextPath}/user/information?id=${user.uid}"><i class="icon-font">&#xe008;</i>个人信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/updatePwd?id=${user.uid}"><i class="icon-font">&#xe005;</i>修改密码</a></li>
                </ul>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list">
                <span class="crumb-step">></span>
                <span class="crumb-wrap">修改密码</span>
            </div>
        </div>
        <div class="result-wrap">
            <div class="meeting-name">
                原密码：
                <input type="password" class="common-text" id="user-old">
            </div>
            <div class="meeting-address">
                新密码：
                <input type="password" class="common-text" id="user-new">
            </div>
            <div class="error-time">
                <span id="user-new-error"></span>
            </div>
            <div class="meeting-end">
                再次输入：
                <input type="password" class="common-text" id="user-reNew">
            </div>
            <div class="error-time">
                <span id="user-reNew-error"></span>
            </div>
            <div class="user_detail_button">
                <button class="btn-info btn" id="update-pass">修改密码</button>
            </div>
        </div>
    </div>
    <!--/main-->
</div>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
<script type="text/javascript">
    window.onload = function () {
        let nFlag = 0;
        let oFlag = 0;
        //密码验证
        $("#user-new").keyup(function () {
            let password = $("#user-new").val();
            if (password.length < 4) {
                showTips("new", "密码位数应大于4", "error");
                nFlag = 0;
            } else if (password.length > 20) {
                showTips("new", "密码位数应小于20", "error");
                nFlag = 0;
            } else {
                showTips("new", "密码位数可用", "success");
                nFlag = 1;
            }
        })
        $("#user-reNew").keyup(function () {
            let password = $("#user-new").val();
            let rePwd = $("#user-reNew").val();
            if (rePwd == password) {
                showTips("re", "两次输入密码一致", "success");
                oFlag = 1;
            } else {
                showTips("re", "两次密码输入不一致", "error");
                oFlag = 0;
            }
        })
        $("#update-pass").click(function () {
            let id = $("#user-id").val();
            let Old = $("#user-old").val();
            let New = $("#user-new").val();
            let reNew = $("#user-reNew").val();
            if (Old == "" || New == "" || reNew == "") {
                swal("抱歉", "密码不得为空！", "error");
                return ;
            }
            if (oFlag == 0 || nFlag == 0) {
                return ;
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/user/updatePass",
                type: "POST",
                data: {
                    id: id,
                    newPwd: New,
                    oldPwd: Old
                },
                success: function (e) {
                    if (e == "success") {
                        swal("恭喜", "修改密码成功，1s后退出登录！", "success")
                        setTimeout(function () {
                            window.location.replace("${pageContext.request.contextPath}/user/exitLogin");
                        }, 1000)
                    } else {
                        swal("抱歉", "原密码错误，修改密码失败！", "error");
                    }
                }
            })
        })
    }
    function showTips(type, msg, status) {
        let dom;
        if (type == "new") {
            dom = $("#user-new-error")
        } else if (type == "re") {
            dom = $("#user-reNew-error")
        }
        dom.text(msg);
        if (status == "success") {
            dom.css("color", "green")
        } else if (status == "error") {
            dom.css("color", "red")
        }
    }
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: aitaiyo
  Date: 2021/7/2
  Time: 16:22
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
                    <li><a href="${pageContext.request.contextPath}/user/information?id=${user.uid}"><i class="icon-font">&#xe008;</i>个人信息</a></li>
                    <li style="background-color: #d0d0d0"><a href="${pageContext.request.contextPath}/user/updatePwd?id=${user.uid}"><i class="icon-font">&#xe005;</i>修改密码</a></li>
                </ul>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list">
                <span class="crumb-step">></span>
                <span class="crumb-wrap">个人信息</span>
            </div>
        </div>
        <div class="result-wrap">
            <div class="meeting-name">
                用户名：
                <input type="text" class="common-text" id="user-name" value="${user1.uname}">
            </div>
            <div class="meeting-address">
                性别：
                <input type="radio" value="男" name="user-sex" ${user1.usex=='男'?'checked':''}>男
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" value="女" name="user-sex" ${user1.usex=='女'?'checked':''}>女
            </div>
            <div class="meeting-address">
                电话：
                <input type="text" class="common-text" id="user-phone" value="${user1.utel}">
            </div>
            <div class="error-time">
                <span id="user-phone-error"></span>
            </div>
            <div class="meeting-end">
                邮箱：
                <input type="text" class="common-text" id="user-email" value="${user1.uemail}">
            </div>
            <div class="error-time">
                <span id="user-email-error"></span>
            </div>
            <div class="meeting-end">
                生日：
                <input type="date" class="common-text" id="user-birthday" value="${user1.ubirth}">
            </div>
            <div class="error-time">
                <span id="user-birthday-error"></span>
            </div>
            <div class="user_detail_button">
                <button class="btn-info btn" id="update-information">修改个人信息</button>
            </div>
        </div>
    </div>
    <!--/main-->
</div>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
<script type="text/javascript">
    window.onload = function () {
        let flag = 0;
        let pFlag = 2;
        let eFlag = 2;
        let bFlag = 2;
        $("#user-name").bind("input propertychange", function () {
            flag = 1;
        })
        $("input[name=user-sex]").change(function () {
            flag = 1;
        })
        $("#user-birthday").bind("input propertychange", function () {
            flag = 1;
            var birthday = $("#user-birthday").val();
            var myDate = new Date();
            birthday = birthday.replaceAll("-", "/");
            birthday = new Date(birthday);
            if (birthday >= myDate) {
                showTips("birthday", "出生日期不得晚于当前时间", "error");
                bFlag = 0;
            } else {
                $("#user-birthday-error").text("");
                bFlag = 1;
            }
        })
        //手机邮箱格式验证
        $("#user-phone").bind("input propertychange", function () {
            flag = 1;
            let phone = $("#user-phone").val();
            let reg1 = /^(1\d{10})$/;
            if (!(reg1.test(phone))) {
                showTips("phone", "手机号格式不规范", "error");
                pFlag = 0;
                return;
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/user/selectRepeat",
                type: "POST",
                data: {
                    phone: phone
                },
                success: function (e) {
                    if (e == "repeat") {
                        showTips("phone", "手机号重复", "error");
                        pFlag = 0;
                    } else {
                        showTips("phone", "手机号可用", "success");
                        pFlag = 1;
                    }
                }
            })
        })
        $("#user-email").bind("input propertychange", function () {
            flag = 1;
            let email = $("#user-email").val();
            let reg1 = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            if (!(reg1.test(email))) {
                showTips("email", "邮箱格式不规范", "error");
                eFlag = 0;
                return;
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/user/selectRepeat",
                type: "POST",
                data: {
                    email: email
                },
                success: function (e) {
                    if (e == "repeat") {
                        showTips("email", "邮箱重复", "error");
                        eFlag = 0;
                    } else {
                        showTips("email", "邮箱可用", "success")
                        eFlag = 1;
                    }
                }
            })
        })
        //修改信息
        $("#update-information").click(function () {
            var id = $("#user-id").val();
            var name = $("#user-name").val();
            var sex = "";
            var s = document.getElementsByName("user-sex");
            for (let i = 0; i < s.length; i++) {
                if (s[i].checked) {
                    sex = s[i].value;
                }
            }
            var phone = $("#user-phone").val();
            var email = $("#user-email").val();
            var birthday = document.getElementById("user-birthday").value;
            if (flag == 0) {
                swal("抱歉", "请先修改个人信息！", "error");
                return ;
            }
            if (name == '' || phone == '' || email == '') {
                swal("抱歉", "用户名，电话和邮箱不得有空项！", "error");
                return ;
            }
            if (pFlag == 0|| eFlag == 0 || bFlag == 0) {
                return ;
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/user/updateUser",
                type: "POST",
                data: {
                    id: id,
                    name: name,
                    phone: phone,
                    email: email,
                    sex: sex,
                    birthday: birthday
                },
                success: function (e) {
                    if (e == "success") {
                        swal("恭喜", "修改个人信息成功，1s后刷新界面！", "success")
                        setTimeout(function () {
                            window.location.replace("${pageContext.request.contextPath}/user/information?id=" + id);
                        }, 1000)
                    } else {
                        swal("抱歉", "修改个人信息失败！", "error");
                    }
                }
            })
        })
    }
    function showTips(type, msg, status) {
        let dom;
        if (type == "email") {
            dom = $("#user-email-error")
        } else if (type == "phone") {
            dom = $("#user-phone-error")
        } else if (type == "birthday") {
            dom = $("#user-birthday-error")
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

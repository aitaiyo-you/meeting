<%--
  Created by IntelliJ IDEA.
  User: aitaiyo
  Date: 2021/6/28
  Time: 17:09
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
    <title>管理员主界面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="">后台首页</a></li>
                <li><a href="${pageContext.request.contextPath}" target="_blank">网站首页</a></li>
            </ul>
        </div>
        <div class="topbar-logo-wrap clearfix">
            <h1>线上会议管理系统</h1>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li>管理员${user.uname}</li>
                <li><a href="${pageContext.request.contextPath}/user/exitLogin" id="exit-user">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>后台管理</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <ul class="sub-menu">
                    <li style="background-color: #d0d0d0"><a href="${pageContext.request.contextPath}/user/auditUser"><i class="icon-font">&#xe008;</i>审核管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/adminUser"><i class="icon-font">&#xe005;</i>用户管理</a></li>
                    <li style="background-color: #d0d0d0"><a href="${pageContext.request.contextPath}/user/adminMeeting"><i class="icon-font">&#xe006;</i>会议管理</a></li>
                </ul>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list">
                <i class="icon-font"></i><a href="${pageContext.request.contextPath}/user/admin">首页</a>
                <span class="crumb-step">></span>
                <span class="crumb-wrap">用户管理</span>
            </div>
        </div>
        <div class="search-wrap">
            <table class="search-tab">
                <tr>
                    <th width="70">关键字：</th>
                    <td><input class="common-text" placeholder="关键字" name="keyword" value="${keyword2}" id="keyword" type="text"></td>
                    <td><input class="btn btn-primary btn2" id="search-key" value="查询" type="submit"></td>
                </tr>
            </table>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <div class="result-list">
                    <button class="btn btn-danger" name="delete-all">批量删除</button>
                    <button class="btn btn-success" name="add-user">新增用户</button>
                </div>
            </div>
            <div class="result-content">
                <table class="userItem-table result-tab" width="100%" id="table-user">
                    <tr>
                        <th style="text-align: center"><input id="select-all" class="allChoose" name="select-all" type="checkbox" onclick="selectAll()"></th>
                        <th style="text-align: center">用户ID</th>
                        <th style="text-align: center">用户名</th>
                        <th style="text-align: center">状态</th>
                        <th style="text-align: center">性别</th>
                        <th style="text-align: center">电话</th>
                        <th style="text-align: center">邮箱</th>
                        <th style="text-align: center">生日</th>
                        <th style="text-align: center">操作</th>
                    </tr>
                    <c:forEach items="${userInfo.list}" var="user" varStatus="status">
                        <tr>
                            <td class="tc"><input class="allChoose" name="check-user" value="${user.uid}" type="checkbox" onclick="toCheck()"></td>
                            <td align="center" class="userItem-id">${user.uid}</td>
                            <td align="center" class="userItem-name">${user.uname}</td>
                            <td align="center" class="userItem-status">
                                <c:if test="${user.ustatus == 1}">未审核</c:if>
                                <c:if test="${user.ustatus == 2}">审核通过</c:if>
                                <c:if test="${user.ustatus == 3}">驳回审核</c:if>
                            </td>
                            <td align="center" class="userItem-sex">${user.usex==null||""?'未填写':user.usex}</td>
                            <td align="center" class="userItem-phone">${user.utel}</td>
                            <td align="center" class="userItem-email">${user.uemail}</td>
                            <td align="center" class="userItem-birthday">${user.ubirth==null||""?'未填写':user.ubirth}</td>
                            <td align="center" style="word-break: break-all">
                                <input type="hidden" name="uid" value="${user.uid}">
                                <button class="btn btn-info" name="update-user">修改</button>
                                <button class="btn btn-danger" name="delete-user">删除</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="list-page">
                    <input type="button" class="btn" value="首页" onclick="window.location.replace('${pageContext.request.contextPath}/user/adminUser?pageNo=1&keyword=${keyword2}')"/>
                    <c:if test="${requestScope.userInfo.prePage >= 1}">
                        <input type="button" class="btn" value="上一页" onclick="window.location.replace('${pageContext.request.contextPath}/user/adminUser?pageNo=${requestScope.userInfo.prePage}&keyword=${keyword2}')"/>
                    </c:if>
                    本页共${requestScope.userInfo.size}条 第${requestScope.userInfo.pageNum}/${requestScope.userInfo.pages < 1?1:requestScope.userInfo.pages}页
                    <c:if test="${requestScope.userInfo.nextPage >= 1}">
                        <input type="button" class="btn" value="下一页" onclick="window.location.replace('${pageContext.request.contextPath}/user/adminUser?pageNo=${requestScope.userInfo.nextPage}&keyword=${keyword2}')"/>
                    </c:if>
                    <input value="末页" type="button" class="btn" onclick="window.location.replace('${pageContext.request.contextPath}/user/adminUser?pageNo=${requestScope.userInfo.pages}&keyword=${keyword2}')"/>
                </div>
            </div>
        </div>
    </div>
    <!--/main-->

    <!-- 新增用户弹窗 -->
    <div class="user_detail_page" id="add-user-page">
        <div class="user_detail_bg" id="add-user-bg"></div>
        <div class="user_detail_content" id="add-user-content">
            <div class="user_detail_top" id="add-user-top">
                <p class="user_detail_title" id="add-user-title">新增用户</p>
                <p class="user_detail_close" id="add-user-close">×</p>
            </div>
            <div class="user_detail_body" id="add-user-body">
                <div class="user_detail_text" id="add-user-text">
                    <div class="user_detail_name" style="margin-top: 20px">用户名：</div>
                    <div class="user_detail_name" style="margin-top: 10px">密码：</div>
                    <div class="user_detail_name" style="margin-top: 10px">电话：</div>
                    <div class="user_detail_name" style="margin-top: 10px">邮箱：</div>
                    <div class="user_detail_name" style="margin-top: 10px">性别：</div>
                    <div class="user_detail_name" style="margin-top: 10px">生日：</div>
                </div>
                <div class="user_detail_edit" id="add-user-edit">
                    <input type="text" id="add-user-name" class="common-text" style="margin-top: 20px">
                    <input type="password" id="add-user-password" class="common-text" style="margin-top: 10px">
                    <span id="add-user-password-tip" class="error-tip"></span>
                    <input type="text" id="add-user-phone" class="common-text" style="margin-top: 10px">
                    <span id="add-user-phone-tip" class="error-tip"></span>
                    <input type="text" id="add-user-email" class="common-text" style="margin-top: 10px">
                    <span id="add-user-email-tip" class="error-tip"></span>
                    <div class="user_detail_name" style="margin-top: 10px; text-align: left">
                        <input type="radio" name="add-user-sex" value="男">男
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="add-user-sex" value="女">女
                    </div>
                    <input type="date" id="add-user-birthday" class="common-text" style="margin-top: 10px">
                    <span id="add-user-birthday-tip" class="error-tip"></span>
                </div>
                <div class="user_detail_button">
                    <button class="btn-primary btn" id="add-user">新增</button>
                    <button class="btn btn-danger" id="empty-user">清空</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 修改信息弹窗 -->
    <div class="user_detail_page" id="update-user-page">
        <div class="user_detail_bg" id="update-user-bg"></div>
        <div class="user_detail_content" id="update-user-content">
            <div class="user_detail_top" id="update-user-top">
                <p class="user_detail_title" id="update-user-title">修改用户</p>
                <p class="user_detail_close" id="update-user-close">×</p>
            </div>
            <div class="user_detail_body" id="update-user-body">
                <div class="user_detail_text" id="update-user-text">
                    <div class="user_detail_name" style="margin-top: 20px">用户名：</div>
                    <div class="user_detail_name" style="margin-top: 10px">电话：</div>
                    <div class="user_detail_name" style="margin-top: 10px">邮箱：</div>
                    <div class="user_detail_name" style="margin-top: 10px">性别：</div>
                    <div class="user_detail_name" style="margin-top: 10px">生日：</div>
                </div>
                <div class="user_detail_edit" id="update-user-edit">
                    <input type="hidden" id="update-user-id">
                    <input type="text" id="update-user-name" class="common-text" style="margin-top: 20px">
                    <input type="text" id="update-user-phone" class="common-text" style="margin-top: 10px">
                    <span id="update-user-phone-tip" class="error-tip"></span>
                    <input type="text" id="update-user-email" class="common-text" style="margin-top: 10px">
                    <span id="update-user-email-tip" class="error-tip"></span>
                    <div class="user_detail_name" style="margin-top: 10px; text-align: left">
                        <input type="radio" name="update-user-sex" value="男">男
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="update-user-sex" value="女">女
                    </div>
                    <input type="date" id="update-user-birthday" class="common-text" style="margin-top: 10px">
                    <span id="update-user-birthday-tip" class="error-tip"></span>
                </div>
                <div class="user_detail_button">
                    <button class="btn-primary btn" id="update-user">修改</button>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
<script type="text/javascript">
    window.onload = function (){
        //搜索关键词
        $("#search-key").click(function (){
            var key = $("#keyword").val();
            window.location.replace("${pageContext.request.contextPath}/user/adminUser?keyword=" + key);
        })
        //删除用户
        $("button[name=delete-user]").click(function (){
            let index = $("button[name=delete-user]").index(this);
            let uid = $("input[name=uid]").eq(index).val();
            $.ajax({
                url: "${pageContext.request.contextPath}/user/deleteUser",
                type: "POST",
                data: {
                    uid: uid
                },
                success: function (e){
                    if (e == "success") {
                        swal("恭喜", "删除用户成功，1s后刷新界面！", "success")
                        setTimeout(function () {
                            window.location.reload()
                        }, 1000)
                    } else {
                        swal("抱歉", "删除用户失败！", "error")
                    }
                }
            })
        })
        //批量删除
        $("button[name=delete-all]").click(function (){
            let arr = [];
            var checkboxs = document.getElementsByName("check-user");
            for (let i = 0; i < checkboxs.length; i++) {
                if (checkboxs[i].checked) {
                    arr[arr.length] = checkboxs[i].value;
                }
            }
            if (arr == '') {
                swal("抱歉", "请先选择用户！", "error");
                return;
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/user/deleteAllUser",
                type: "POST",
                data: {
                    ids: arr,
                },
                success: function (e) {
                    if (e == "success") {
                        swal("恭喜", "批量删除用户成功，1s后刷新界面！", "success")
                        setTimeout(function () {
                            window.location.reload()
                        }, 1000)
                    } else {
                        swal("抱歉", "批量删除用户失败！", "error")
                    }
                }
            })
        })
        // 新增用户按钮点击时间，展示面板
        $("button[name=add-user]").click(function () {
            $("#add-user-page").css("display", "block");
            $("#add-user-content").css({
                "transform": "translate(-50%, -50%) scale(1)",
                "top": "50%",
                "left": "50%"
            });
        })
        // 关闭面板
        $("#add-user-bg").click(function () {
            $("#add-user-content").css({
                "transform": "translate(50%, -50%) scale(0)"
            });
            setTimeout(function () {
                $("#add-user-page").css("display", "none");
                $("#add-user-edit input").val("");
                $("#add-user-edit span").text("");
                $("input:radio[name=add-user-sex]").prop("checked",false);
            }, 400)
        })
        $("#add-user-close").click(function () {
            $("#add-user-content").css({
                "transform": "translate(50%, -50%) scale(0)"
            });
            setTimeout(function () {
                $("#add-user-page").css("display", "none");
                $("#add-user-edit input").val("");
                $("#add-user-edit span").text("");
                $("input:radio[name=add-user-sex]").prop("checked",false);
            }, 400)
        })
        // 自由拖动
        var posX;
        var posY;

        fpage = document.getElementById("add-user-content");
        ftop = document.getElementById("add-user-top");
        ftop.onmousedown = function(e) {
            posX = event.x - fpage.offsetLeft; //获得横坐标x
            posY = event.y - fpage.offsetTop; //获得纵坐标y
            document.onmousemove = mousemove; //调用函数，只要一直按着按钮就能一直调用
        }
        document.onmouseup = function() {
            document.onmousemove = null; //鼠标举起，停止
        }

        function mousemove(ev) {
            if (ev == null) ev = window.event; //IE
            fpage.style.left = (ev.clientX - posX) + "px";
            fpage.style.top = (ev.clientY - posY) + "px";
        }

        //清空按钮
        $("#empty-user").click(function (){
            $("#add-user-edit input").val("");
            $("#add-user-edit span").text("");
            $("input:radio[name=add-user-sex]").prop("checked",false);
        })
        let pFlag = 0;
        let tFlag = 0;
        let eFlag = 0;
        let bFlag = 0;
        //密码验证
        $("#add-user-password").bind("input propertychange", function () {
            let password = $("#add-user-password").val();
            if (password.length < 4) {
                showTips("add", "password", "密码位数应大于4", "error");
                pFlag = 0;
            } else if (password.length > 20) {
                showTips("add", "password", "密码位数应小于20", "error");
                pFlag = 0;
            } else {
                showTips("add", "password", "密码位数可用", "success");
                pFlag = 1;
            }
        })
        //生日日期验证
        $("#add-user-birthday").bind("input propertychange", function () {
            var birthday = $("#add-user-birthday").val();
            var myDate = new Date();
            birthday = birthday.replaceAll("-", "/");
            birthday = new Date(birthday);
            if (birthday >= myDate) {
                showTips("add", "birthday", "出生日期不得晚于当前时间", "error");
                bFlag = 0;
            } else {
                $("#add-user-birthday-tip").text("");
                bFlag = 1;
            }
        })
        //手机邮箱格式验证
        $("#add-user-phone").bind("input propertychange", function () {
            let phone = $("#add-user-phone").val();
            let reg1 = /^(1\d{10})$/;
            if (!(reg1.test(phone))) {
                showTips("add", "phone", "手机号格式不规范", "error")
                tFlag = 0;
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
                        showTips("add", "phone", "手机号重复", "error")
                        tFlag = 0;
                    } else {
                        showTips("add", "phone", "手机号可用", "success")
                        tFlag = 1;
                    }
                }
            })
        })
        $("#add-user-email").bind("input propertychange", function () {
            let email = $("#add-user-email").val();
            let reg1 = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            if (!(reg1.test(email))) {
                showTips("add", "email", "邮箱格式不规范", "error")
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
                        showTips("add", "email", "邮箱重复", "error")
                        eFlag = 0;
                    } else {
                        showTips("add", "email", "邮箱可用", "success")
                        eFlag = 1;
                    }
                }
            })
        })
        //新增用户
        $("#add-user").click(function (){
            var name = $("#add-user-name").val();
            var password = $("#add-user-password").val();
            var phone = $("#add-user-phone").val();
            var email = $("#add-user-email").val();
            var birthday = document.getElementById("add-user-birthday").value;
            var sex = "";
            var s = document.getElementsByName("add-user-sex");
            for (let i = 0; i < s.length; i++) {
                if (s[i].checked) {
                    sex = s[i].value;
                }
            }
            if (pFlag == 0 || tFlag == 0 || eFlag == 0 || bFlag == 0) {
                return ;
            }
            if (name == '' || password == '' || phone == '' || email == '') {
                swal("抱歉", "用户名，密码，电话和邮箱不得有空项！", "error");
                return ;
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/user/addUser",
                type: "POST",
                data: {
                    name: name,
                    password: password,
                    phone: phone,
                    email: email,
                    sex: sex,
                    birthday: birthday
                },
                success: function (e) {
                    if (e == "success") {
                        swal("恭喜", "新增用户成功，1s后刷新界面！", "success")
                        setTimeout(function () {
                            window.location.reload()
                        }, 1000)
                    } else {
                        swal("抱歉", "新增用户失败！", "error");
                    }
                }
            })
        })
        // 修改信息弹窗
        // 修改用户按钮点击时间，展示面板
        $("button[name=update-user]").click(function () {
            let index = $("button[name=update-user]").index(this);
            $("#update-user-id").val($(".userItem-id").eq(index).text());
            $("#update-user-name").val($(".userItem-name").eq(index).text());
            $("#update-user-phone").val($(".userItem-phone").eq(index).text());
            $("#update-user-email").val($(".userItem-email").eq(index).text());
            $("#update-user-birthday").val($(".userItem-birthday").eq(index).text());
            var sex = $(".userItem-sex").eq(index).text();
            if (sex == "男") {
                $("input[name=update-user-sex]").get(0).checked=true;
            } else if (sex == "女") {
                $("input[name=update-user-sex]").get(1).checked=true;
            }
            $("#update-user-page").css("display", "block");
            $("#update-user-content").css({
                "transform": "translate(-50%, -50%) scale(1)",
                "top": "50%",
                "left": "50%"
            });
        })
        // 关闭面板
        $("#update-user-bg").click(function () {
            $("#update-user-content").css({
                "transform": "translate(50%, -50%) scale(0)"
            });
            setTimeout(function () {
                $("#update-user-page").css("display", "none");
                $("#update-user-edit input").val("");
                $("#update-user-edit span").text("");
            }, 400)
        })
        $("#update-user-close").click(function () {
            $("#update-user-content").css({
                "transform": "translate(50%, -50%) scale(0)"
            });
            setTimeout(function () {
                $("#update-user-page").css("display", "none");
                $("#update-user-edit input").val("");
                $("#update-user-edit span").text("");
            }, 400)
        })
        // 自由拖动
        var posX1;
        var posY1;

        fpage1 = document.getElementById("update-user-content");
        ftop1 = document.getElementById("update-user-top");
        ftop1.onmousedown = function(e) {
            posX1 = event.x - fpage1.offsetLeft; //获得横坐标x
            posY1 = event.y - fpage1.offsetTop; //获得纵坐标y
            document.onmousemove = mousemove1; //调用函数，只要一直按着按钮就能一直调用
        }
        document.onmouseup = function() {
            document.onmousemove = null; //鼠标举起，停止
        }

        function mousemove1(ev) {
            if (ev == null) ev = window.event; //IE
            fpage1.style.left = (ev.clientX - posX1) + "px";
            fpage1.style.top = (ev.clientY - posY1) + "px";
        }
        //修改界面信息验证
        let flag = 0;
        let eFlag1 = 2;
        let tFlag1 = 2;
        $("#update-user-name").bind("input propertychange", function () {
            flag = 1;
        })
        //手机邮箱格式验证
        $("#update-user-phone").bind("input propertychange", function () {
            flag = 1;
            let phone = $("#update-user-phone").val();
            let reg1 = /^(1\d{10})$/;
            if (!(reg1.test(phone))) {
                showTips("update", "phone", "手机号格式不规范", "error")
                tFlag1 = 0;
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
                        showTips("update", "phone", "手机号重复", "error")
                        tFlag1 = 0;
                    } else {
                        showTips("update", "phone", "手机号可用", "success")
                        tFlag1 = 1;
                    }
                }
            })
        })
        $("#update-user-email").bind("input propertychange", function () {
            flag = 1;
            let email = $("#update-user-email").val();
            let reg1 = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            if (!(reg1.test(email))) {
                showTips("update", "email", "邮箱格式不规范", "error")
                eFlag1 = 0;
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
                        showTips("update", "email", "邮箱重复", "error")
                        eFlag1 = 0;
                    } else {
                        showTips("update", "email", "邮箱可用", "success")
                        eFlag1 = 1;
                    }
                }
            })
        })
        $("input[name=update-user-sex]").change(function () {
            flag = 1;
        })
        let bFlag1 = 2;
        $("#update-user-birthday").bind("input propertychange", function () {
            flag = 1;
            var birthday = $("#update-user-birthday").val();
            var myDate = new Date();
            birthday = birthday.replaceAll("-", "/");
            birthday = new Date(birthday);
            if (birthday >= myDate) {
                showTips("update", "birthday", "出生日期不得晚于当前时间", "error");
                bFlag1 = 0;
            } else {
                $("#update-user-birthday-tip").text("");
                bFlag1 = 1;
            }
        })
        //修改个人信息
        $("#update-user").click(function () {
            var id = $("#update-user-id").val();
            var name = $("#update-user-name").val();
            var phone = $("#update-user-phone").val();
            var email = $("#update-user-email").val();
            var birthday = document.getElementById("update-user-birthday").value;
            var sex = "";
            var s = document.getElementsByName("update-user-sex");
            for (let i = 0; i < s.length; i++) {
                if (s[i].checked) {
                    sex = s[i].value;
                }
            }
            if (name == '' || phone == '' || email == '') {
                swal("抱歉", "用户名，电话和邮箱不得有空项！", "error");
                return ;
            }
            if (flag == 0) {
                swal("抱歉", "请先修改个人信息！", "error");
                return ;
            }
            if (tFlag1 == 0 || eFlag1 == 0 || bFlag1 == 0) {
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
                        swal("恭喜", "修改用户成功，1s后刷新界面！", "success")
                        setTimeout(function () {
                            window.location.reload()
                        }, 1000)
                    } else {
                        swal("抱歉", "修改用户失败！", "error");
                    }
                }
            })
        })
    }
    function selectAll() {
        var selectAll = document.getElementById("select-all");
        var flag = selectAll.checked;
        var checkboxs = document.getElementsByName("check-user");
        let str = [];
        if (flag) {
            for (var i = 0; i < checkboxs.length; i++) {
                checkboxs[i].checked = true;
            }
        } else {
            for (var i = 0; i < checkboxs.length; i++) {
                checkboxs[i].checked = false;
                str += checkboxs[i].value;
            }
        }
    }
    function toCheck() {
        var selectAll = document.getElementById("select-all");
        var checkboxs = document.getElementsByName("check-user");
        var count = 0;
        for (var i = 0; i < checkboxs.length; i++) {
            if (checkboxs[i].checked) {
                count++;
            }
        }
        if (count == checkboxs.length) {
            selectAll.checked = true;
        } else {
            selectAll.checked = false;
        }
    }
    function showTips(page, type, msg, status) {
        let dom;
        if (page == "add") {
            if (type == "email") {
                dom = $("#add-user-email-tip")
            } else if (type == "phone") {
                dom = $("#add-user-phone-tip")
            } else if (type == "password") {
                dom = $("#add-user-password-tip")
            } else if (type == "birthday") {
                dom = $("#add-user-birthday-tip")
            }
        } else if (page == "update") {
            if (type == "email") {
                dom = $("#update-user-email-tip")
            } else if (type == "phone") {
                dom = $("#update-user-phone-tip")
            } else if (type == "birthday") {
                dom = $("#update-user-birthday-tip")
            }
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

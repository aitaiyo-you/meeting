<%--
  Created by IntelliJ IDEA.
  User: aitaiyo
  Date: 2021/6/25
  Time: 18:53
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
    <title>用户注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
</head>
<body>
<div class="wrap login_wrap">
    <div class="content">
        <div class="logo"></div>
        <div class="login_box">
            <div class="login_form" style="padding-bottom: 20px">
                <div class="login_title">
                    注册
                </div>
                <form action="${pageContext.request.contextPath}/user/doRegister" method="post">
                    <div class="form_text_ipt">
                        <input id="name" name="name" type="text" placeholder="用户名">
                    </div>
                    <div class="ececk_warning"><span id="name-error"></span></div>
                    <div class="form_text_ipt">
                        <input id="phone" name="phone" type="text" placeholder="手机号">
                    </div>
                    <div class="ececk_warning"><span id="phone-error"></span></div>
                    <div class="form_text_ipt">
                        <input id="email" name="email" type="text" placeholder="邮箱">
                    </div>
                    <div class="ececk_warning"><span id="email-error"></span></div>
                    <div class="form_text_ipt">
                        <input id="password" name="password" type="password" placeholder="密码">
                    </div>
                    <div class="ececk_warning"><span id="password-error"></span></div>
                    <div class="form_text_ipt">
                        <input id="rePassword" name="rePassword" type="password" placeholder="重复密码">
                    </div>
                    <div class="ececk_warning"><span id="rePassword-error"></span></div>
                    <div class="form_btn">
                        <button id="register" onclick="return test()">注册</button>
                    </div>
                    <div class="form_reg_btn">
                        <span>已有帐号？</span><a href="${pageContext.request.contextPath}/user/login">马上登录</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
    var flag = false;
    var nFlag = false;
    var pFlag = false;
    var eFlag = false;
    var rFlag = false;
    var pFlag1 = false;
    window.onload = function () {
        $('.form_text_ipt input').focus(function(){
            $(this).parent().css({
                'box-shadow':'0 0 3px #bbb',
            });
        });
        $('.form_text_ipt input').blur(function(){
            $(this).parent().css({
                'box-shadow':'none',
            });
            //$(this).parent().next().hide();
        });
        //用户名验证
        $("#name").bind("input propertychange", function () {
            var name = $("#name").val();
            if (name == "") {
                nFlag = false;
                $("#name").css({
                    'color':'red',
                });
                $("#name").parent().css({
                    'border':'solid 1px red',
                });
                $("#name-error").show();
                showTips("name", "用户名不得为空", "error");
            } else {
                nFlag = true;
                $("#name").css({
                    'color':'#ccc',
                });
                $("#name").parent().css({
                    'border':'solid 1px #ccc',
                });
                $("#name-error").hide();
            }
        })
        //手机号码验证
        $("#phone").bind("input propertychange", function () {
            let phone = $("#phone").val();
            let reg1 = /^(1\d{10})$/;
            if (!(reg1.test(phone))) {
                $("#phone").css({
                    'color':'red',
                });
                $("#phone").parent().css({
                    'border':'solid 1px red',
                });
                showTips("phone", "手机号格式不规范", "error");
                pFlag = false;
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
                        $("#phone").css({
                            'color':'red',
                        });
                        $("#phone").parent().css({
                            'border':'solid 1px red',
                        });
                        showTips("phone", "手机号重复", "error");
                        pFlag = false;
                    } else {
                        $("#phone").css({
                            'color':'#ccc',
                        });
                        $("#phone").parent().css({
                            'border':'solid 1px #ccc',
                        });
                        showTips("phone", "手机号可用", "success");
                        pFlag = true;
                    }
                }
            })
        })
        //邮箱验证
        $("#email").bind("input propertychange", function () {
            let email = $("#email").val();
            let reg1 = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            if (!(reg1.test(email))) {
                $("#email").css({
                    'color':'red',
                });
                $("#email").parent().css({
                    'border':'solid 1px red',
                });
                showTips("email", "邮箱格式不规范", "error");
                eFlag = false;
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
                        $("#email").css({
                            'color':'red',
                        });
                        $("#email").parent().css({
                            'border':'solid 1px red',
                        });
                        showTips("email", "邮箱重复", "error");
                        eFlag = false;
                    } else {
                        $("#email").css({
                            'color':'#ccc',
                        });
                        $("#email").parent().css({
                            'border':'solid 1px #ccc',
                        });
                        showTips("email", "邮箱可用", "success")
                        eFlag = true;
                    }
                }
            })
        })
        //密码验证
        $("#password").bind("input propertychange", function () {
            let password = $("#password").val();
            if (password.length < 4) {
                $("#password").css({
                    'color':'red',
                });
                $("#password").parent().css({
                    'border':'solid 1px red',
                });
                showTips("password", "密码位数应大于4", "error");
                pFlag1 = false;
            } else if (password.length > 20) {
                $("#password").css({
                    'color':'red',
                });
                $("#password").parent().css({
                    'border':'solid 1px red',
                });
                showTips("password", "密码位数应小于20", "error");
                pFlag1 = false;
            } else {
                $("#password").css({
                    'color':'#ccc',
                });
                $("#password").parent().css({
                    'border':'solid 1px #ccc',
                });
                showTips("password", "密码位数可用", "success");
                pFlag1 = true;
            }
        })
        //重复密码验证
        $("#rePassword").bind("input propertychange", function () {
            let password = $("#password").val();
            let rePwd = $("#rePassword").val();
            if (rePwd == password) {
                $("#rePassword").css({
                    'color':'#ccc',
                });
                $("#rePassword").parent().css({
                    'border':'solid 1px #ccc',
                });
                showTips("re", "两次输入密码一致", "success");
                rFlag = true;
            } else {
                $("#rePassword").css({
                    'color':'red',
                });
                $("#rePassword").parent().css({
                    'border':'solid 1px red',
                });
                showTips("re", "两次密码输入不一致", "error");
                rFlag = false;
            }
        })
    }
    function test() {
        if (nFlag == false || pFlag1 == false || pFlag == false || eFlag == false || rFlag == false) {
            flag = false;
        } else {
            flag = true;
        }
        return flag;
    }
    function showTips(type, msg, status) {
        let dom;
        if (type == "email") {
            dom = $("#email-error")
        } else if (type == "phone") {
            dom = $("#phone-error")
        } else if (type == "name") {
            dom = $("#name-error")
        } else if (type == "password") {
            dom = $("#password-error")
        } else if (type == "re") {
            dom = $("#rePassword-error")
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

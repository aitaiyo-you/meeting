<%--
  Created by IntelliJ IDEA.
  User: aitaiyo
  Date: 2021/6/25
  Time: 9:10
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
    <title>用户登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
</head>
<body>
<div class="wrap login_wrap">
    <div class="content">
        <div class="logo"></div>
        <div class="login_box" style="padding-bottom: 20px;">
            <div class="login_form">
                <div class="login_title">
                    登录
                </div>
                <form action="${pageContext.request.contextPath}/user/doLogin" method="post">
                    <div class="form_text_ipt">
                        <input id="phone" name="phone" type="text" placeholder="手机号/邮箱">
                    </div>
                    <div class="ececk_warning"><span></span></div>
                    <div class="form_text_ipt">
                        <input id="password" name="password" type="password" placeholder="密码">
                    </div>
                    <div class="ececk_warning"><span></span></div>
                    <div class="form_btn">
                        <button id="login" onclick="return test()">登录</button>
                    </div>
                </form>
                <div class="form_reg_btn">
                    <span>还没有帐号？</span><a href="${pageContext.request.contextPath}/user/register">马上注册</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
    var flag = false;
    window.onload = function () {
        //登录输入框效果
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

        //表单验证
        $('.form_text_ipt input').bind('input propertychange',function(){
            flag = false;
            if($(this).val()==""){
                flag = false;
                $(this).css({
                    'color':'red',
                });
                $(this).parent().css({
                    'border':'solid 1px red',
                });
                var tip = $(this).attr("placeholder");
                $(this).parent().next().find('span').html(tip + '不得为空');
                $(this).parent().next().show();
            }else{
                flag = true;
                $(this).css({
                    'color':'#ccc',
                });
                $(this).parent().css({
                    'border':'solid 1px #ccc',
                });
                $(this).parent().next().hide();
            }
        });
    }
    function test() {
        var phone = $("#phone").val();
        var password = $("#password").val();
        if (password == "" || phone == "") {
            flag = false;
        }
        return flag;
    }
</script>
</body>
</html>

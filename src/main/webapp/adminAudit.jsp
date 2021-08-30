<%--
  Created by IntelliJ IDEA.
  User: aitaiyo
  Date: 2021/6/26
  Time: 10:22
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
                    <li><a href="${pageContext.request.contextPath}/user/auditUser"><i class="icon-font">&#xe008;</i>审核管理</a></li>
                    <li style="background-color: #d0d0d0"><a href="${pageContext.request.contextPath}/user/adminUser"><i class="icon-font">&#xe005;</i>用户管理</a></li>
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
                <span class="crumb-wrap">审核管理</span>
            </div>
        </div>
        <div class="search-wrap">
            <table class="search-tab">
                <tr>
                    <th width="70">关键字：</th>
                    <td><input class="common-text" placeholder="关键字" name="keyword" value="${keyword1}" id="keyword" type="text"></td>
                    <td><input class="btn btn-primary btn2" id="search-key" value="查询" type="submit"></td>
                </tr>
            </table>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <div class="result-list">
                    <button class="btn btn-success" name="pass-all">批量通过</button>
                    <button class="btn btn-danger" name="fail-all">批量驳回</button>
                </div>
            </div>
            <div class="result-content">
                <table class="result-tab" width="100%" id="table-audit">
                    <tr>
                        <th style="text-align: center"><input id="select-all" class="allChoose" name="select-all" type="checkbox" onclick="selectAll()"></th>
                        <th style="text-align: center">用户ID</th>
                        <th style="text-align: center">用户名</th>
                        <th style="text-align: center">性别</th>
                        <th style="text-align: center">电话</th>
                        <th style="text-align: center">邮箱</th>
                        <th style="text-align: center">生日</th>
                        <th style="text-align: center">操作</th>
                    </tr>
                    <c:forEach items="${auditInfo.list}" var="user" varStatus="status">
                        <tr>
                            <td class="tc"><input class="allChoose" name="check-audit" value="${user.uid}" type="checkbox" onclick="toCheck()"></td>
                            <td align="center">${user.uid}</td>
                            <td align="center">${user.uname}</td>
                            <td align="center">
                                <c:if test="${user.usex != '' && user.usex != null}">${user.usex}</c:if>
                                <c:if test="${user.usex == '' || user.usex == null}">未填写</c:if>
                            </td>
                            <td align="center">${user.utel}</td>
                            <td align="center">
                                <c:if test="${user.uemail==null || user.uemail==''}">未填写</c:if>
                                <c:if test="${user.uemail!=null && user.uemail!=''}">${user.uemail}</c:if>
                            </td>
                            <td align="center">
                                <c:if test="${user.ubirth==null || user.ubirth==''}">未填写</c:if>
                                <c:if test="${user.ubirth!=null && user.ubirth!=''}">${user.ubirth}</c:if>
                            </td>
                            <td align="center" style="word-break: break-all">
                                <input type="hidden" name="uid" value="${user.uid}">
                                <button class="btn btn-success" name="pass-audit">通过审核</button>
                                <button class="btn btn-danger" name="fail-audit">驳回审核</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="list-page">
                    <input type="button" class="btn" value="首页" onclick="window.location.replace('${pageContext.request.contextPath}/user/auditUser?pageNo=1&keyword=${keyword1}')"/>
                    <c:if test="${requestScope.auditInfo.prePage >= 1}">
                        <input type="button" class="btn" value="上一页" onclick="window.location.replace('${pageContext.request.contextPath}/user/auditUser?pageNo=${requestScope.auditInfo.prePage}&keyword=${keyword1}')"/>
                    </c:if>
                    本页共${requestScope.auditInfo.size}条 第${requestScope.auditInfo.pageNum}/${requestScope.auditInfo.pages < 1?1:requestScope.auditInfo.pages}页
                    <c:if test="${requestScope.auditInfo.nextPage >= 1}">
                        <input type="button" class="btn" value="下一页" onclick="window.location.replace('${pageContext.request.contextPath}/user/auditUser?pageNo=${requestScope.auditInfo.nextPage}&keyword=${keyword1}')"/>
                    </c:if>
                    <input value="末页" type="button" class="btn" onclick="window.location.replace('${pageContext.request.contextPath}/user/auditUser?pageNo=${requestScope.auditInfo.pages}&keyword=${keyword1}')"/>
                </div>
            </div>
        </div>
    </div>
    <!--/main-->
</div>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
<script type="text/javascript">
    window.onload = function (){
        //关键字查询
        $("#search-key").click(function (){
            var key = $("#keyword").val();
            window.location.replace("${pageContext.request.contextPath}/user/auditUser?keyword=" + key);
        })
        //审核通过
        $("button[name=pass-audit]").click(function (){
            let index = $("button[name=pass-audit]").index(this);
            let uid = $("input[name=uid]").eq(index).val();
            $.ajax({
                url: "${pageContext.request.contextPath}/user/passAudit",
                type: "POST",
                data: {
                    uid: uid,
                },
                success: function (e) {
                    if (e == "success") {
                        swal("恭喜", "通过审核成功，1s后刷新界面！", "success")
                        setTimeout(function () {
                            window.location.reload()
                        }, 1000)
                    } else {
                        swal("抱歉", "通过审核失败！", "error")
                    }
                }
            })
        })
        //驳回审核
        $("button[name=fail-audit]").click(function (){
            let index = $("button[name=fail-audit]").index(this);
            let uid = $("input[name=uid]").eq(index).val();
            $.ajax({
                url: "${pageContext.request.contextPath}/user/failAudit",
                type: "POST",
                data: {
                    uid: uid,
                },
                success: function (e) {
                    if (e == "success") {
                        swal("恭喜", "驳回审核成功，1s后刷新界面！", "success")
                        setTimeout(function () {
                            window.location.reload()
                        }, 1000)
                    } else {
                        swal("抱歉", "驳回审核失败！", "error")
                    }
                }
            })
        })
        //批量通过
        $("button[name=pass-all]").click(function (){
            let arr = [];
            var checkboxs = document.getElementsByName("check-audit");
            for (let i = 0; i < checkboxs.length; i++) {
                if (checkboxs[i].checked) {
                    arr[arr.length] = checkboxs[i].value;
                }
            }
            if (arr == '') {
                swal("抱歉", "请先选择未审核用户！", "error");
                return;
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/user/passAllAudit",
                type: "POST",
                data: {
                    ids: arr,
                },
                success: function (e) {
                    if (e == "success") {
                        swal("恭喜", "批量通过审核成功，1s后刷新界面！", "success")
                        setTimeout(function () {
                            window.location.reload()
                        }, 1000)
                    } else {
                        swal("抱歉", "批量通过审核失败！", "error")
                    }
                }
            })
        })
        $("button[name=fail-all]").click(function (){
            let arr = [];
            var checkboxs = document.getElementsByName("check-audit");
            for (let i = 0; i < checkboxs.length; i++) {
                if (checkboxs[i].checked) {
                    arr[arr.length] = checkboxs[i].value;
                }
            }
            if (arr == '') {
                swal("抱歉", "请先选择未审核用户！", "error");
                return;
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/user/failAllAudit",
                type: "POST",
                data: {
                    ids: arr,
                },
                success: function (e) {
                    if (e == "success") {
                        swal("恭喜", "批量驳回审核成功，1s后刷新界面！", "success")
                        setTimeout(function () {
                            window.location.reload()
                        }, 1000)
                    } else {
                        swal("抱歉", "批量驳回审核失败！", "error")
                    }
                }
            });
        })
    }
    function selectAll() {
        var selectAll = document.getElementById("select-all");
        var flag = selectAll.checked;
        var checkboxs = document.getElementsByName("check-audit");
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
        var checkboxs = document.getElementsByName("check-audit");
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
</script>
</body>
</html>

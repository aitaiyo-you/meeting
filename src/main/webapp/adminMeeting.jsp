<%--
  Created by IntelliJ IDEA.
  User: aitaiyo
  Date: 2021/6/30
  Time: 14:37
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
                    <li style="background-color: #d0d0d0"><a href="${pageContext.request.contextPath}/user/adminUser"><i class="icon-font">&#xe005;</i>用户管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/adminMeeting"><i class="icon-font">&#xe006;</i>会议管理</a></li>
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
                <span class="crumb-wrap">会议管理</span>
            </div>
        </div>
        <div class="search-wrap">
            <table class="search-tab">
                <tr>
                    <th width="70">关键字：</th>
                    <td><input class="common-text" placeholder="关键字" name="keyword" value="${keyword3}" id="keyword" type="text"></td>
                    <td><input class="btn btn-primary btn2" id="search-key" value="查询" type="submit"></td>
                </tr>
            </table>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <div class="result-list">
                    <button class="btn btn-danger" name="delete-all">批量删除</button>
                    <button class="btn btn-success" name="add-meeting">新增会议</button>
                </div>
            </div>
            <div class="result-content">
                <table class="meetingItem-table result-tab" width="100%" id="table-user">
                    <tr>
                        <th style="text-align: center"><input id="select-all" class="allChoose" name="select-all" type="checkbox" onclick="selectAll()"></th>
                        <th style="text-align: center">会议ID</th>
                        <th style="text-align: center">会议名</th>
                        <th style="text-align: center">会议地址</th>
                        <th style="text-align: center">会议开始时间</th>
                        <th style="text-align: center">会议结束时间</th>
                        <th style="text-align: center">限制人数</th>
                        <th style="text-align: center">会议简介</th>
                        <th style="text-align: center">操作</th>
                        <th style="text-align: center">管理</th>
                    </tr>
                    <c:forEach items="${meetingInfo.list}" var="meeting" varStatus="status">
                        <tr>
                            <td class="tc"><input class="allChoose" name="check-meeting" value="${meeting.mid}" type="checkbox" onclick="toCheck()"></td>
                            <td align="center" class="meetingItem-id">${meeting.mid}</td>
                            <td align="center" class="meetingItem-name">${meeting.mname}</td>
                            <td align="center" class="meetingItem-address">${meeting.maddress}</td>
                            <td align="center" class="meetingItem-bTime">${meeting.mbtime}</td>
                            <td align="center" class="meetingItem-eTime">${meeting.metime}</td>
                            <td align="center" class="meetingItem-num">${meeting.etc1}/${meeting.mnum}</td>
                            <td align="center" class="meetingItem-intro">${meeting.mintro}</td>
                            <td align="center" style="word-break: break-all">
                                <input type="hidden" name="mid" value="${meeting.mid}">
                                <button class="btn btn-info" name="update-meeting">修改</button>
                                <button class="btn btn-danger" name="delete-meeting">删除</button>
                            </td>
                            <td align="center" style="word-break: break-all">
                                <input type="hidden" name="people" value="${meeting.etc1}">
                                <input type="hidden" name="num" value="${meeting.mnum}">
                                <input type="hidden" name="people" value="${meeting.etc1}">
                                <button class="btn btn-primary" name="manage-user">查看参会人员</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="list-page">
                    <input type="button" class="btn" value="首页" onclick="window.location.replace('${pageContext.request.contextPath}/user/adminMeeting?pageNo=1&keyword=${keyword3}')"/>
                    <c:if test="${requestScope.meetingInfo.prePage >= 1}">
                        <input type="button" class="btn" value="上一页" onclick="window.location.replace('${pageContext.request.contextPath}/user/adminMeeting?pageNo=${requestScope.meetingInfo.prePage}&keyword=${keyword2}')"/>
                    </c:if>
                    本页共${requestScope.meetingInfo.size}条 第${requestScope.meetingInfo.pageNum}/${requestScope.meetingInfo.pages < 1?1:requestScope.meetingInfo.pages}页
                    <c:if test="${requestScope.meetingInfo.nextPage >= 1}">
                        <input type="button" class="btn" value="下一页" onclick="window.location.replace('${pageContext.request.contextPath}/user/adminMeeting?pageNo=${requestScope.meetingInfo.nextPage}&keyword=${keyword2}')"/>
                    </c:if>
                    <input value="末页" type="button" class="btn" onclick="window.location.replace('${pageContext.request.contextPath}/user/adminMeeting?pageNo=${requestScope.meetingInfo.pages}&keyword=${keyword2}')"/>
                </div>
            </div>
        </div>
    </div>
    <!--/main-->

    <!-- 新增会议弹窗 -->
    <div class="user_detail_page" id="add-meeting-page">
        <div class="user_detail_bg" id="add-meeting-bg"></div>
        <div class="user_detail_content" id="add-meeting-content">
            <div class="user_detail_top" id="add-meeting-top">
                <p class="user_detail_title" id="add-meeting-title">新增会议</p>
                <p class="user_detail_close" id="add-meeting-close">×</p>
            </div>
            <div class="user_detail_body" id="add-meeting-body">
                <div class="meeting-name">
                    会议名称：
                    <input class="common-text" id="add-meeting-name" type="text">
                </div>
                <div class="meeting-address">
                    会议地点：
                    <input class="common-text" id="add-meeting-address" type="text">
                </div>
                <div class="meeting-address">
                    会议开始时间：
                    <input type="date" class="meeting-date" id="add-begin-date">
                    <input type="time" class="meeting-time" id="add-begin-time">
                </div>
                <div class="error-time">
                    <span id="add-begin-error"></span>
                </div>
                <div class="meeting-end">
                    会议结束时间：
                    <input type="date" class="meeting-date" id="add-end-date">
                    <input type="time" class="meeting-time" id="add-end-time">
                </div>
                <div class="error-time">
                    <span id="add-end-error"></span>
                </div>
                <div class="meeting-address">
                    限制人数：
                    <input type="text" class="common-text" id="add-meeting-num">
                </div>
                <div class="meeting-intro">
                    会议简介：
                    <textarea rows="5" cols="30" class="common-area" id="add-meeting-intro"></textarea>
                </div>
                <div class="error-time">
                    <span id="add-intro-error"></span>
                </div>
                <div class="user_detail_button">
                    <button class="btn-primary btn" id="add-meeting">新增</button>
                    <button class="btn btn-danger" id="empty-meeting">清空</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 修改信息弹窗 -->
    <div class="user_detail_page" id="update-meeting-page">
        <div class="user_detail_bg" id="update-meeting-bg"></div>
        <div class="user_detail_content" id="update-meeting-content">
            <div class="user_detail_top" id="update-meeting-top">
                <p class="user_detail_title" id="update-meeting-title">修改会议</p>
                <p class="user_detail_close" id="update-meeting-close">×</p>
            </div>
            <div class="user_detail_body" id="update-meeting-body">
                <div class="meeting-name">
                    会议名称：
                    <input type="hidden" id="update-meeting-id">
                    <input class="common-text" id="update-meeting-name" type="text">
                </div>
                <div class="meeting-address">
                    会议地点：
                    <input class="common-text" id="update-meeting-address" type="text">
                </div>
                <div class="meeting-address">
                    会议开始时间：
                    <input type="date" class="meeting-date" id="update-begin-date">
                    <input type="time" class="meeting-time" id="update-begin-time">
                </div>
                <div class="error-time">
                    <span id="update-begin-error"></span>
                </div>
                <div class="meeting-end">
                    会议结束时间：
                    <input type="date" class="meeting-date" id="update-end-date">
                    <input type="time" class="meeting-time" id="update-end-time">
                </div>
                <div class="error-time">
                    <span id="update-end-error"></span>
                </div>
                <div class="meeting-address">
                    限制人数：
                    <input type="hidden" id="update-meeting-people">
                    <input type="text" class="common-text" id="update-meeting-num">
                </div>
                <div class="meeting-intro">
                    会议简介：
                    <textarea rows="5" cols="30" class="common-area" id="update-meeting-intro"></textarea>
                </div>
                <div class="error-time">
                    <span id="update-intro-error"></span>
                </div>
                <div class="user_detail_button">
                    <button class="btn-primary btn" id="update-meeting">修改</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 管理参会人员弹窗 -->
    <div class="user_detail_page" id="manage-user-page">
        <div class="user_detail_bg" id="manage-user-bg"></div>
        <div class="user_detail_content" id="manage-user-content">
            <div class="user_detail_top" id="manage-user-top">
                <p class="user_detail_title" id="manage-user-title">查看参会人员</p>
                <p class="user_detail_close" id="manage-user-close">×</p>
            </div>
            <div class="user_detail_body" id="manage-user-body">
                <div class="search-wrap">
                    <input type="hidden" id="begin-time">
                    <table class="search-tab">
                        <tr>
                            <th width="70">关键字：</th>
                            <td><input type="hidden" id="manage-id"><input class="common-text" placeholder="关键字" id="keyword-manage" type="text"></td>
                            <td><input class="btn btn-primary btn2" id="search-user" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </div>
                <div class="result-wrap">
                    <div class="result-content">
                        <table class="meetingItem-table result-tab" width="100%" id="table-manage">
                            <tr>
                                <th style="text-align: center">用户名</th>
                                <th style="text-align: center">电话</th>
                                <th style="text-align: center">邮箱</th>
                                <th style="text-align: center">操作</th>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="list-page" id="page-manage">
                    <button class="btn" name="manage-button">首页</button>
                    <button class="btn" name="manage-button">上一页</button>
                    本页共 条 第 / 页
                    <button class="btn" name="manage-button">下一页</button>
                    <button class="btn" name="manage-button">末页</button>
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
            window.location.replace("${pageContext.request.contextPath}/user/adminMeeting?keyword=" + key);
        })
        //删除会议
        $("button[name=delete-meeting]").click(function () {
            let index = $("button[name=delete-meeting]").index(this);
            var id = $("input[name=mid]").eq(index).val();
            $.ajax({
                url: "${pageContext.request.contextPath}/meeting/deleteMeeting",
                type: "POST",
                data: {
                    id: id
                },
                success: function (e) {
                    if (e == "success") {
                        swal("恭喜", "删除会议成功，1s后刷新界面！", "success")
                        setTimeout(function () {
                            window.location.reload()
                        }, 1000)
                    } else {
                        swal("抱歉", "删除会议失败！", "error")
                    }
                }
            })
        })
        //批量删除
        $("button[name=delete-all]").click(function () {
            let arr = [];
            var checkboxs = document.getElementsByName("check-meeting");
            for (let i = 0; i < checkboxs.length; i++) {
                if (checkboxs[i].checked) {
                    arr[arr.length] = checkboxs[i].value;
                }
            }
            if (arr == '') {
                swal("抱歉", "请先选择会议！", "error");
                return;
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/meeting/deleteAllMeeting",
                type: "POST",
                data: {
                    ids: arr,
                },
                success: function (e) {
                    if (e == "success") {
                        swal("恭喜", "批量删除会议成功，1s后刷新界面！", "success")
                        setTimeout(function () {
                            window.location.reload()
                        }, 1000)
                    } else {
                        swal("抱歉", "批量删除会议失败！", "error")
                    }
                }
            })
        })
        //新增会议弹窗
        $("button[name=add-meeting]").click(function () {
            $("#add-meeting-page").css("display", "block");
            $("#add-meeting-content").css({
                "transform": "translate(-50%, -50%) scale(1)",
                "top": "50%",
                "left": "50%"
            });
        })
        // 关闭面板
        $("#add-meeting-bg").click(function () {
            $("#add-meeting-content").css({
                "transform": "translate(50%, -50%) scale(0)"
            });
            setTimeout(function () {
                $("#add-meeting-page").css("display", "none");
                $("#add-meeting-body input").val("");
                $("#add-meeting-body textarea").val("");
                $("#add-meeting-body span").text("");
            }, 400)
        })
        $("#add-meeting-close").click(function () {
            $("#add-meeting-content").css({
                "transform": "translate(50%, -50%) scale(0)"
            });
            setTimeout(function () {
                $("#add-meeting-page").css("display", "none");
                $("#add-meeting-body input").val("");
                $("#add-meeting-body textarea").val("");
                $("#add-meeting-body span").text("");
            }, 400)
        })
        // 自由拖动
        var posX;
        var posY;

        fpage = document.getElementById("add-meeting-content");
        ftop = document.getElementById("add-meeting-top");
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
        $("#empty-meeting").click(function () {
            $("#add-meeting-body input").val("");
            $("#add-meeting-body textarea").val("");
            $("#add-meeting-body span").text("");
        })
        let bFlag = 0;
        let eFlag = 0;
        let iFlag = 0;
        //开始日期判断
        $("#add-begin-date").bind("input propertychange", function () {
            var day = $("#add-begin-date").val(); //获取输入框时间
            var day1 = day.split("-");
            var year1 = day1[0];
            var month1 = day1[1];
            var date1 = day1[2]; //获取确切年月日
            var myDate = new Date();
            //获取当前年
            var year=myDate.getFullYear();
            //获取当前月
            var month=myDate.getMonth()+1;
            //获取当前日
            var date = myDate.getDate()+1;
            $("#add-end-date").val("");
            $("#add-end-time").val("");
            $("#add-end-error").text("");
            eFlag = 0;
            if (year1 < year) {
                showTips("add", "begin", "开始时间至少应晚于发布时间一天", "error");
                bFlag = 0;
            } else if (month1 < month) {
                showTips("add", "begin", "开始时间至少应晚于发布时间一天", "error");
                bFlag = 0;
            } else if (date1 < date) {
                showTips("add", "begin", "开始时间至少应晚于发布时间一天", "error");
                bFlag = 0;
            } else {
                $("#add-begin-error").text("");
                bFlag = 1;
            }
        })
        $("#add-begin-time").bind("input propertychange", function () {
            $("#add-end-date").val("");
            $("#add-end-time").val("");
            $("#add-end-error").text("");
            eFlag = 0;
        })
        //结束日期判断
        $("#add-end-date").bind("input propertychange", function () {
            var day = $("#add-begin-date").val(); //获取开始输入框时间
            var day1 = day.split("-");
            var year = day1[0];
            var month = day1[1];
            var date = day1[2]; //获取确切年月日
            var day2 = $("#add-end-date").val();
            var day3 = day2.split("-");
            var year1 = day3[0];
            var month1 = day3[1];
            var date1 = day3[2]; //获取确切年月日
            if ($("#add-begin-time").val() == "" || $("#add-begin-date").val() == "") {
                eFlag = 0;
            } else {
                eFlag = 1;
            }
            if (year1 != year) {
                showTips("add", "end", "会议必须当天结束", "error");
                eFlag = 0;
            } else if (month != month1) {
                showTips("add", "end", "会议必须当天结束", "error");
                eFlag = 0;
            } else if (date != date1) {
                showTips("add", "end", "会议必须当天结束", "error");
                eFlag = 0;
            } else {
                $("#add-end-error").text("");
                eFlag = 1;
            }
        })
        $("#add-end-time").bind("input propertychange", function () {
            var time = $("#add-end-time").val().split(":");
            var time1 = $("#add-begin-time").val().split(":");
            var h = time[0];
            var m = time[1];
            var h1 = time1[0];
            var m1 = time1[1];
            var t = 60*h + m;
            var t1 = 60*h1 + m1;
            if (t-t1 < 60) {
                showTips("add", "end", "会议至少应持续1小时", "error");
                eFlag = 0;
            } else {
                $("#add-end-error").text("");
                eFlag = 1;
            }
        })
        //简介字数限制
        $("#add-meeting-intro").keyup(function () {
            var intro = $("#add-meeting-intro").val();
            if (intro.length > 200) {
                showTips("add", "intro", "会议简介不要超过200字", "error");
                iFlag = 0;
            } else {
                $("#add-intro-error").text("");
                iFlag = 1;
            }
        })
        //新增会议
        $("#add-meeting").click(function () {
            var name = $("#add-meeting-name").val();
            var address = $("#add-meeting-address").val();
            var bDate = $("#add-begin-date").val();
            var bHour = $("#add-begin-time").val();
            var bTime = bDate + " " + bHour;
            var eDate = $("#add-end-date").val();
            var eHour = $("#add-end-time").val();
            var eTime = eDate + " " + eHour;
            var num = $("#add-meeting-num").val();
            var intro = $("#add-meeting-intro").val();
            if (name == "" || address == "" || num == "" || bDate == "" || bTime == "" ||
                eDate == "" || eTime == "" || intro == "") {
                swal("抱歉", "不得有空项！", "error");
                return ;
            }
            if (!(/(^[1-9]\d*$)/.test(num))) {
                swal("抱歉", "限制人数应为正整数！", "error");
                return ;
            }
            if (bFlag == 0 || eFlag == 0 || iFlag == 0) {
                return ;
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/meeting/addMeeting",
                type: "POST",
                data: {
                    name: name,
                    address: address,
                    bTime: bTime,
                    eTime: eTime,
                    num: num,
                    intro: intro
                },
                success: function (e) {
                    if (e == "success") {
                        swal("恭喜", "新增会议成功，1s后刷新界面！", "success")
                        setTimeout(function () {
                            window.location.reload()
                        }, 1000)
                    } else {
                        swal("抱歉", "新增会议失败！", "error")
                    }
                }
            })
        })
        //修改弹窗
        $("button[name=update-meeting]").click(function () {
            let index = $("button[name=update-meeting]").index(this);
            var Time = $(".meetingItem-bTime").eq(index).text();
            var myDate = new Date();
            Time = Time.replaceAll("-", "/");
            Time = new Date(Time);
            if (Time <= myDate) {
                swal("抱歉", "该会议已开始，不能修改！", "error");
                return ;
            }
            $("#update-meeting-id").val($(".meetingItem-id").eq(index).text());
            $("#update-meeting-name").val($(".meetingItem-name").eq(index).text());
            $("#update-meeting-address").val($(".meetingItem-address").eq(index).text());
            $("#update-meeting-num").val($("input[name=num]").eq(index).val());
            $("#update-meeting-people").val($("input[name=people]").eq(index).val());
            $("#update-meeting-intro").val($(".meetingItem-intro").eq(index).text());
            var bTime = $(".meetingItem-bTime").eq(index).text().split(" ");
            $("#update-begin-date").val(bTime[0]);
            $("#update-begin-time").val(bTime[1]);
            var eTime = $(".meetingItem-eTime").eq(index).text().split(" ");
            $("#update-end-date").val(eTime[0]);
            $("#update-end-time").val(eTime[1]);
            $("#update-meeting-page").css("display", "block");
            $("#update-meeting-content").css({
                "transform": "translate(-50%, -50%) scale(1)",
                "top": "50%",
                "left": "50%"
            });
        })
        // 关闭面板
        $("#update-meeting-bg").click(function () {
            $("#update-meeting-content").css({
                "transform": "translate(50%, -50%) scale(0)"
            });
            setTimeout(function () {
                $("#update-meeting-page").css("display", "none");
                $("#update-meeting-body input").val("");
                $("#update-meeting-body textarea").val("");
                $("#update-meeting-body span").text("");
            }, 400)
        })
        $("#update-meeting-close").click(function () {
            $("#update-meeting-content").css({
                "transform": "translate(50%, -50%) scale(0)"
            });
            setTimeout(function () {
                $("#update-meeting-page").css("display", "none");
                $("#update-meeting-body input").val("");
                $("#update-meeting-body textarea").val("");
                $("#update-meeting-body span").text("");
            }, 400)
        })
        // 自由拖动
        var posX1;
        var posY1;

        fpage1 = document.getElementById("update-meeting-content");
        ftop1 = document.getElementById("update-meeting-top");
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
        let flag = 0;
        let bFlag1 = 2;
        let eFlag1 = 2;
        let iFlag1 = 2;
        $("#update-meeting-name").click(function () {
            flag = 1;
        })
        $("#update-meeting-address").click(function () {
            flag = 1;
        })
        $("#update-meeting-num").click(function () {
            flag = 1;
        })
        //开始日期判断
        $("#update-begin-date").bind("input propertychange", function () {
            flag = 1;
            var day = $("#update-begin-date").val(); //获取输入框时间
            var day1 = day.split("-");
            var year1 = day1[0];
            var month1 = day1[1];
            var date1 = day1[2]; //获取确切年月日
            var myDate = new Date();
            //获取当前年
            var year=myDate.getFullYear();
            //获取当前月
            var month=myDate.getMonth()+1;
            //获取当前日
            var date = myDate.getDate()+1;
            $("#update-end-date").val("");
            $("#update-end-time").val("");
            $("#update-end-error").text("");
            eFlag1 = 0;
            if (year1 < year) {
                showTips("update", "begin", "开始时间至少应晚于发布时间一天", "error");
                bFlag1 = 0;
            } else if (month1 < month) {
                showTips("update", "begin", "开始时间至少应晚于发布时间一天", "error");
                bFlag1 = 0;
            } else if (date1 < date) {
                showTips("update", "begin", "开始时间至少应晚于发布时间一天", "error");
                bFlag1 = 0;
            } else {
                $("#update-begin-error").text("");
                bFlag1 = 1;
            }
        })
        $("#update-begin-time").bind("input propertychange", function () {
            flag = 1;
            $("#update-end-date").val("");
            $("#update-end-time").val("");
            $("#update-end-error").text("");
            eFlag1 = 0;
        })
        //结束日期判断
        $("#update-end-date").bind("input propertychange", function () {
            flag = 1;
            var day = $("#update-begin-date").val(); //获取开始输入框时间
            var day1 = day.split("-");
            var year = day1[0];
            var month = day1[1];
            var date = day1[2]; //获取确切年月日
            var day2 = $("#update-end-date").val();
            var day3 = day2.split("-");
            var year1 = day3[0];
            var month1 = day3[1];
            var date1 = day3[2]; //获取确切年月日
            if ($("#update-begin-time").val() == "" || $("#update-begin-date").val() == "") {
                eFlag1 = 0;
            } else {
                eFlag1 = 1;
            }
            if (year1 != year) {
                showTips("update", "end", "会议必须当天结束", "error");
                eFlag1 = 0;
            } else if (month != month1) {
                showTips("update", "end", "会议必须当天结束", "error");
                eFlag1 = 0;
            } else if (date != date1) {
                showTips("update", "end", "会议必须当天结束", "error");
                eFlag1 = 0;
            } else {
                $("#update-end-error").text("");
                eFlag1 = 1;
            }
        })
        $("#update-end-time").bind("input propertychange", function () {
            flag = 1;
            var time = $("#update-end-time").val().split(":");
            var time1 = $("#update-begin-time").val().split(":");
            var h = time[0];
            var m = time[1];
            var h1 = time1[0];
            var m1 = time1[1];
            var t = 60*h + m;
            var t1 = 60*h1 + m1;
            if (t-t1 < 60) {
                showTips("update", "end", "会议至少应持续1小时", "error");
                eFlag1 = 0;
            } else {
                $("#update-end-error").text("");
                eFlag1 = 1;
            }
        })
        //简介字数限制
        $("#update-meeting-intro").keyup(function () {
            flag = 1;
            var intro = $("#update-meeting-intro").val();
            if (intro.length > 200) {
                showTips("update", "intro", "会议简介不要超过200字", "error");
                iFlag1 = 0;
            } else {
                $("#update-intro-error").text("");
                iFlag1 = 1;
            }
        })
        //修改按钮
        $("#update-meeting").click(function () {
            var id = $("#update-meeting-id").val();
            var name = $("#update-meeting-name").val();
            var address = $("#update-meeting-address").val();
            var bDate = $("#update-begin-date").val();
            var bHour = $("#update-begin-time").val();
            var bTime = bDate + " " + bHour;
            var eDate = $("#update-end-date").val();
            var eHour = $("#update-end-time").val();
            var eTime = eDate + " " + eHour;
            var num = $("#update-meeting-num").val();
            var people = $("#update-meeting-people").val();
            var intro = $("#update-meeting-intro").val();
            if (name == "" || address == "" || num == "" || bDate == "" || bTime == "" ||
                eDate == "" || eTime == "" || intro == "") {
                swal("抱歉", "不得有空项！", "error");
                return ;
            }
            if (!(/(^[1-9]\d*$)/.test(num))) {
                swal("抱歉", "限制人数应为正整数！", "error");
                return ;
            }
            if (num < people) {
                swal("抱歉", "会议限制人数不得小于已报名人数！", "error");
                return ;
            }
            if (flag == 0) {
                swal("抱歉", "请先修改数据！", "error");
                return ;
            }
            if (bFlag1 == 0 || eFlag1 == 0 || iFlag1 == 0) {
                return ;
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/meeting/updateMeeting",
                type: "POST",
                data: {
                    id: id,
                    name: name,
                    address: address,
                    bTime: bTime,
                    eTime: eTime,
                    num: num,
                    intro: intro
                },
                success: function (e) {
                    if (e == "success") {
                        swal("恭喜", "修改会议成功，1s后刷新界面！", "success")
                        setTimeout(function () {
                            window.location.reload()
                        }, 1000)
                    } else {
                        swal("抱歉", "修改会议失败！", "error")
                    }
                }
            })
        })
        //管理参会人员弹窗
        $("button[name=manage-user]").click(function () {
            let index = $("button[name=manage-user]").index(this);
            var id = $(".meetingItem-id").eq(index).text();
            $("#manage-id").val(id);
            $("#begin-time").val($(".meetingItem-bTime").eq(index).text());
            $.ajax({
                url: "${pageContext.request.contextPath}/user/selectUserByMid",
                type: "post",
                data: {
                    id: id
                },
                success: function (e) {
                    console.log(e);
                    let userList = e.list
                    $("#table-manage").empty()
                    $("#table-manage").append(`<tr>
                        <th style="text-align: center">用户名</th>
                        <th style="text-align: center">电话</th>
                        <th style="text-align: center">邮箱</th>
                        <th style="text-align: center">操作</th>
                    </tr>`)
                    for (let i = 0; i < userList.length; i++) {
                        let u = userList[i];
                        $("#table-manage").append(`<tr>
                                <td style="text-align: center">`+ u.uname +`</td>
                                <td style="text-align: center">`+ u.utel +`</td>
                                <td style="text-align: center">`+ u.uemail +`</td>
                                <td style="text-align: center"><button class="btn btn-danger" value="`+u.uid+`" name="delete-user">移除用户</button></td>
                            </tr>`)
                    }
                    $("#page-manage").empty();
                    $("#page-manage").append(`<button class="btn" value="1" name="manage-button">首页</button>`);
                    if (e.prePage > 0) {
                        $("#page-manage").append(`<button class="btn" name="manage-button" value="`+e.prePage+`">上一页</button>`);
                    }
                    $("#page-manage").append(`本页共`+e.size+`条 第`+e.pageNum+`/`);
                    if (e.pages < 1) {
                        $("#page-manage").append(`1页`);
                    } else {
                        $("#page-manage").append(e.pages + `页`);
                    }
                    if (e.nextPage > 0) {
                        $("#page-manage").append(`<button class="btn" name="manage-button" value="`+e.nextPage+`">下一页</button>`);
                    }
                    if (e.pages < 1) {
                        $("#page-manage").append(`<button class="btn" name="manage-button" value="1">末页</button>`)
                    } else {
                        $("#page-manage").append(`<button class="btn" name="manage-button" value="`+e.pages+`">末页</button>`)
                    }
                }
            })
            $("#manage-user-page").css("display", "block");
            $("#manage-user-content").css({
                "transform": "translate(-50%, -50%) scale(1)",
                "top": "50%",
                "left": "50%"
            });
        })
        // 关闭面板
        $("#manage-user-bg").click(function () {
            $("#manage-user-content").css({
                "transform": "translate(50%, -50%) scale(0)"
            });
            setTimeout(function () {
                $("#keyword-manage").val("");
                $("#manage-user-page").css("display", "none");
            }, 400)
        })
        $("#manage-user-close").click(function () {
            $("#manage-user-content").css({
                "transform": "translate(50%, -50%) scale(0)"
            });
            setTimeout(function () {
                $("#keyword-manage").val("");
                $("#manage-user-page").css("display", "none");
            }, 400)
        })
        // 自由拖动
        var posX2;
        var posY2;

        fpage2 = document.getElementById("manage-user-content");
        ftop2 = document.getElementById("manage-user-top");
        ftop2.onmousedown = function(e) {
            posX2 = event.x - fpage2.offsetLeft; //获得横坐标x
            posY2 = event.y - fpage2.offsetTop; //获得纵坐标y
            document.onmousemove = mousemove2; //调用函数，只要一直按着按钮就能一直调用
        }
        document.onmouseup = function() {
            document.onmousemove = null; //鼠标举起，停止
        }

        function mousemove2(ev) {
            if (ev == null) ev = window.event; //IE
            fpage2.style.left = (ev.clientX - posX2) + "px";
            fpage2.style.top = (ev.clientY - posY2) + "px";
        }
        //查询人员
        $("#search-user").click(function () {
            var keyword = $("#keyword-manage").val();
            var id = $("#manage-id").val();
            $.ajax({
                url: "${pageContext.request.contextPath}/user/selectUserByMid",
                type: "POST",
                data: {
                    id: id,
                    keyword: keyword
                },
                success: function (e){
                    let userList = e.list
                    $("#table-manage").empty()
                    $("#table-manage").append(`<tr>
                        <th style="text-align: center">用户名</th>
                        <th style="text-align: center">电话</th>
                        <th style="text-align: center">邮箱</th>
                        <th style="text-align: center">操作</th>
                    </tr>`)
                    for (let i = 0; i < userList.length; i++) {
                        let u = userList[i];
                        $("#table-manage").append(`<tr>
                                <td style="text-align: center">`+ u.uname +`</td>
                                <td style="text-align: center">`+ u.utel +`</td>
                                <td style="text-align: center">`+ u.uemail +`</td>
                                <td style="text-align: center"><button class="btn btn-danger" value="`+u.uid+`" name="delete-user">移除用户</button></td>
                            </tr>`)
                    }
                    $("#page-manage").empty();
                    $("#page-manage").append(`<button class="btn" value="1" name="manage-button">首页</button>`);
                    if (e.prePage > 0) {
                        $("#page-manage").append(`<button class="btn" name="manage-button" value="`+e.prePage+`">上一页</button>`);
                    }
                    $("#page-manage").append(`本页共`+e.size+`条 第`+e.pageNum+`/`);
                    if (e.pages < 1) {
                        $("#page-manage").append(`1页`);
                    } else {
                        $("#page-manage").append(e.pages + `页`);
                    }
                    if (e.nextPage > 0) {
                        $("#page-manage").append(`<button class="btn" name="manage-button" value="`+e.nextPage+`">下一页</button>`);
                    }
                    if (e.pages < 1) {
                        $("#page-manage").append(`<button class="btn" name="manage-button" value="1">末页</button>`)
                    } else {
                        $("#page-manage").append(`<button class="btn" name="manage-button" value="`+e.pages+`">末页</button>`)
                    }
                }
            })
        })
        //换页
        $("body").on("click", "button[name=manage-button]", function (){
            var id = $("#manage-id").val();
            var keyword = $("#keyword-manage").val();
            let index = $("button[name=manage-button]").index(this);
            var pageNo = $("button[name=manage-button]").eq(index).val();
            $.ajax({
                url: "${pageContext.request.contextPath}/user/selectUserByMid",
                type: "POST",
                data: {
                    id: id,
                    keyword: keyword,
                    pageNo: pageNo
                },
                success: function (e){
                    let userList = e.list
                    $("#table-manage").empty()
                    $("#table-manage").append(`<tr>
                        <th style="text-align: center">用户名</th>
                        <th style="text-align: center">电话</th>
                        <th style="text-align: center">邮箱</th>
                        <th style="text-align: center">操作</th>
                    </tr>`)
                    for (let i = 0; i < userList.length; i++) {
                        let u = userList[i];
                        $("#table-manage").append(`<tr>
                                <td style="text-align: center">`+ u.uname +`</td>
                                <td style="text-align: center">`+ u.utel +`</td>
                                <td style="text-align: center">`+ u.uemail +`</td>
                                <td style="text-align: center"><button class="btn btn-danger" value="`+u.uid+`" name="delete-user">移除用户</button></td>
                            </tr>`)
                    }
                    $("#page-manage").empty();
                    $("#page-manage").append(`<button class="btn" value="1" name="manage-button">首页</button>`);
                    if (e.prePage > 0) {
                        $("#page-manage").append(`<button class="btn" name="manage-button" value="`+e.prePage+`">上一页</button>`);
                    }
                    $("#page-manage").append(`本页共`+e.size+`条 第`+e.pageNum+`/`);
                    if (e.pages < 1) {
                        $("#page-manage").append(`1页`);
                    } else {
                        $("#page-manage").append(e.pages + `页`);
                    }
                    if (e.nextPage > 0) {
                        $("#page-manage").append(`<button class="btn" name="manage-button" value="`+e.nextPage+`">下一页</button>`);
                    }
                    if (e.pages < 1) {
                        $("#page-manage").append(`<button class="btn" name="manage-button" value="1">末页</button>`)
                    } else {
                        $("#page-manage").append(`<button class="btn" name="manage-button" value="`+e.pages+`">末页</button>`)
                    }
                }
            })
        })
        //删除参会人员
        $("body").on("click", "button[name=delete-user]", function (){
            var Time = $("#begin-time").val();
            var myDate = new Date();
            Time = Time.replaceAll("-", "/");
            Time = new Date(Time);
            if (Time <= myDate) {
                swal("抱歉", "该会议已开始，不能移除参会人员！", "error");
                return ;
            }
            let index = $("button[name=delete-user]").index(this);
            var uid = $("button[name=delete-user]").eq(index).val();
            var mid = $("#manage-id").val();
            $.ajax({
                url: "${pageContext.request.contextPath}/meeting/exitMeeting",
                type: "POST",
                data: {
                    mid: mid,
                    uid: uid,
                },
                success: function (e) {
                    if (e == "success") {
                        swal("恭喜", "移除参会人员成功，1s后刷新界面！", "success")
                        setTimeout(function () {
                            window.location.reload()
                        }, 1000)
                    } else {
                        swal("抱歉", "移除参会人员失败！", "error")
                    }
                }
            })
        })
    }
    function selectAll() {
        var selectAll = document.getElementById("select-all");
        var flag = selectAll.checked;
        var checkboxs = document.getElementsByName("check-meeting");
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
        var checkboxs = document.getElementsByName("check-meeting");
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
            if (type == "begin") {
                dom = $("#add-begin-error");
            } else if (type == "end") {
                dom = $("#add-end-error");
            } else if (type == "intro") {
                dom = $("#add-intro-error");
            }
        } else if (page == "update") {
            if (type == "begin") {
                dom = $("#update-begin-error");
            } else if (type == "end") {
                dom = $("#update-end-error");
            } else if (type == "intro") {
                dom = $("#update-intro-error");
            }
        }
        dom.text(msg);
        if (status == "success") {
            dom.css("color", "green");
        } else {
            dom.css("color", "red");
        }
    }
</script>
</body>
</html>

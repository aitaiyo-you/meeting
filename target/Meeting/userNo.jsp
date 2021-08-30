<%--
  Created by IntelliJ IDEA.
  User: aitaiyo
  Date: 2021/7/2
  Time: 8:42
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
                    <li><a href="${pageContext.request.contextPath}/meeting/selectAllNo?id=${user.uid}"><i class="icon-font">&#xe008;</i>未报名会议</a></li>
                    <li style="background-color: #d0d0d0"><a href="${pageContext.request.contextPath}/meeting/selectAllJoin?id=${user.uid}"><i class="icon-font">&#xe005;</i>已报名会议</a></li>
                </ul>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list">
                <i class="icon-font"></i><a href="${pageContext.request.contextPath}/user/userMain">首页</a>
                <span class="crumb-step">></span>
                <span class="crumb-wrap">未报名会议</span>
            </div>
        </div>
        <div class="search-wrap">
            <table class="search-tab">
                <tr>
                    <th width="70">关键字：</th>
                    <td><input class="common-text" placeholder="关键字" name="keyword" value="${mKeyword}" id="keyword" type="text"></td>
                    <td><input class="btn btn-primary btn2" id="search-key" value="查询" type="submit"></td>
                </tr>
            </table>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <table class="result-tab" width="100%" id="table-noMeeting">
                    <tr>
                        <th style="text-align: center">会议ID</th>
                        <th style="text-align: center">会议名</th>
                        <th style="text-align: center">会议地址</th>
                        <th style="text-align: center">会议开始时间</th>
                        <th style="text-align: center">会议结束时间</th>
                        <th style="text-align: center">参会人数</th>
                        <th style="text-align: center">会议简介</th>
                        <th style="text-align: center">操作</th>
                    </tr>
                    <c:forEach items="${noInfo.list}" var="meeting" varStatus="status">
                        <tr>
                            <td align="center" class="meetingItem-id">${meeting.mid}</td>
                            <td align="center" class="meetingItem-name">${meeting.mname}</td>
                            <td align="center" class="meetingItem-address">${meeting.maddress}</td>
                            <td align="center" class="meetingItem-bTime">${meeting.mbtime}</td>
                            <td align="center" class="meetingItem-eTime">${meeting.metime}</td>
                            <td align="center" class="meetingItem-num">${meeting.etc1}/${meeting.mnum}</td>
                            <td align="center" class="meetingItem-intro">${meeting.mintro}</td>
                            <td align="center" style="word-break: break-all">
                                <input type="hidden" name="mid" value="${meeting.mid}">
                                <input type="hidden" name="num" value="${meeting.mnum}">
                                <input type="hidden" name="people" value="${meeting.etc1}">
                                <button class="btn btn-success" name="join-meeting">参加会议</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="list-page">
                    <input type="button" class="btn" value="首页" onclick="window.location.replace('${pageContext.request.contextPath}/meeting/selectAllNo?id=${user.uid}&pageNo=1&keyword=${mKeyword}')"/>
                    <c:if test="${requestScope.noInfo.prePage >= 1}">
                        <input type="button" class="btn" value="上一页" onclick="window.location.replace('${pageContext.request.contextPath}/meeting/selectAllNo?id=${user.uid}&pageNo=${requestScope.noInfo.prePage}&keyword=${mKeyword}')"/>
                    </c:if>
                    本页共${requestScope.noInfo.size}条 第${requestScope.noInfo.pageNum}/${requestScope.noInfo.pages < 1?1:requestScope.noInfo.pages}页
                    <c:if test="${requestScope.noInfo.nextPage >= 1}">
                        <input type="button" class="btn" value="下一页" onclick="window.location.replace('${pageContext.request.contextPath}/meeting/selectAllNo?id=${user.uid}&pageNo=${requestScope.noInfo.nextPage}&keyword=${mKeyword}')"/>
                    </c:if>
                    <input value="末页" type="button" class="btn" onclick="window.location.replace('${pageContext.request.contextPath}/meeting/selectAllNo?id=${user.uid}&pageNo=${requestScope.noInfo.pages}&keyword=${mKeyword}')"/>
                </div>
            </div>
        </div>
    </div>
    <!--/main-->
</div>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
<script type="text/javascript">
    window.onload = function () {
        $("#search-key").click(function (){
            var key = $("#keyword").val();
            var id = $("#user-id").val();
            window.location.replace("${pageContext.request.contextPath}/meeting/selectAllNo?id="+ id +"&keyword=" + key);
        })
        $("button[name=join-meeting]").click(function () {
            var uid = $("#user-id").val();
            let index = $("button[name=join-meeting]").index(this);
            let mid = $("input[name=mid]").eq(index).val();
            let num = $("input[name=num]").eq(index).val();
            let people = $("input[name=people]").eq(index).val();
            if (people >= num) {
                swal("抱歉", "该会议已报满！", "error");
                return ;
            }
            var bTime = $(".meetingItem-bTime").eq(index).text();
            var myDate = new Date();
            bTime = bTime.replaceAll("-", "/");
            bTime = new Date(bTime);
            if (bTime <= myDate) {
                swal("抱歉", "该会议已开始，不能报名！", "error");
                return ;
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/meeting/joinMeeting",
                type: "POST",
                data: {
                    mid: mid,
                    uid: uid,
                },
                success: function (e) {
                    if (e == "success") {
                        swal("恭喜", "报名会议成功，1s后刷新界面！", "success")
                        setTimeout(function () {
                            window.location.reload()
                        }, 1000)
                    } else {
                        swal("抱歉", "报名会议失败！", "error")
                    }
                }
            })
        })
    }
</script>
</body>
</html>